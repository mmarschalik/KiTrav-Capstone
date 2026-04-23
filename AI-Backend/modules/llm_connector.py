"""OpenAI LLM connector for KiTravia."""

import json
import os
import re
import time
from typing import Any, Optional

import openai

from modules.prompt_builder import MAX_HISTORY_MESSAGES, build_prompt


def _extract_json_string(text: str) -> str | None:
    """Extract a parseable JSON object from the LLM response.

    Handles three cases:
    1. The entire response is valid JSON.
    2. The response contains a ```json ... ``` (or ``` ... ```) code block.
    3. The response contains a raw JSON object (first '{' to its matching '}').
    Returns the extracted JSON string, or None if nothing could be found.
    """
    s = (text or "").strip()
    if not s:
        return None

    # Case 1: whole string is already valid JSON
    try:
        json.loads(s)
        return s
    except json.JSONDecodeError:
        pass

    # Case 2: find a markdown code-fenced JSON block anywhere in the text
    m = re.search(r"```(?:json)?\s*\n(.*?)\n\s*```", s, re.DOTALL)
    if m:
        candidate = m.group(1).strip()
        try:
            json.loads(candidate)
            return candidate
        except json.JSONDecodeError:
            pass

    # Case 3: find the first '{' and its matching '}' by brace counting
    start = s.find("{")
    if start != -1:
        depth = 0
        in_string = False
        escape_next = False
        for i in range(start, len(s)):
            c = s[i]
            if escape_next:
                escape_next = False
                continue
            if c == "\\":
                escape_next = True
                continue
            if c == '"':
                in_string = not in_string
                continue
            if in_string:
                continue
            if c == "{":
                depth += 1
            elif c == "}":
                depth -= 1
                if depth == 0:
                    candidate = s[start : i + 1]
                    try:
                        json.loads(candidate)
                        return candidate
                    except json.JSONDecodeError:
                        break

    return None

# Request timeout in seconds.
LLM_TIMEOUT = 30
# Number of retries on timeout or 5xx (total attempts = 1 + LLM_RETRIES).
LLM_RETRIES = 2


def _get_client():
    """Create OpenAI client using env var only (no hardcoded key)."""
    api_key = os.getenv("OPENAI_API_KEY")
    if not api_key:
        raise ValueError(
            "OPENAI_API_KEY is not set. Set it in your environment or .env file."
        )
    return openai.OpenAI(api_key=api_key)


def _is_retryable_error(exc: BaseException) -> bool:
    """True if we should retry on this error (timeout or 5xx)."""
    if getattr(exc, "status_code", None) and 500 <= getattr(exc, "status_code") < 600:
        return True
    name = type(exc).__name__
    if "Timeout" in name or "timeout" in str(exc).lower():
        return True
    # OpenAI SDK may raise InternalServerError or RateLimitError for 5xx/429.
    if "InternalServerError" in name or "RateLimitError" in name:
        return True
    return False


def call_llm(
    chat_history: list[dict],
    intent: str = "ITINERARY",
    search_results: Optional[dict[str, Any]] = None,
    include_debug: bool = False,
    itinerary_params: Optional[dict[str, Any]] = None,
) -> tuple[str, str, Optional[dict], Optional[dict]]:
    """
    Send the conversation history to the LLM using the intent-specific system prompt.
    Returns (reply_to_user, raw_json_string, token_usage, debug_sent).
    token_usage is {"input_tokens": int, "output_tokens": int} or None.
    When include_debug is True, debug_sent is {"system_prompt": str, "messages": list}; else None.
    Limits history to last MAX_HISTORY_MESSAGES. Uses timeout and retries on timeout/5xx.
    itinerary_params: when intent is "ITINERARY_GENERATION", these are injected into the prompt.
    """
    # Limit to last N messages to control token usage.
    limited = chat_history[-MAX_HISTORY_MESSAGES:] if len(chat_history) > MAX_HISTORY_MESSAGES else chat_history

    latest_user_message = ""
    for entry in reversed(limited):
        if entry["role"] == "user":
            latest_user_message = entry["text"]
            break

    system_prompt = build_prompt(intent, latest_user_message, search_results=search_results, itinerary_params=itinerary_params)

    formatted_messages = [
        {
            "role": "user" if entry["role"] == "user" else "assistant",
            "content": entry["text"],
        }
        for entry in limited
    ]

    openai_messages = [{"role": "system", "content": system_prompt}] + formatted_messages

    client = _get_client()
    last_exc = None
    for attempt in range(1 + LLM_RETRIES):
        try:
            response = client.chat.completions.create(
                model="gpt-4.1",
                max_tokens=16384,
                temperature=0.2,
                messages=openai_messages,
                timeout=LLM_TIMEOUT,
                response_format={"type": "json_object"},
            )
            break
        except Exception as e:
            last_exc = e
            if attempt < LLM_RETRIES and _is_retryable_error(e):
                time.sleep(1.0 * (attempt + 1))
                continue
            raise
    else:
        if last_exc is not None:
            raise last_exc
        raise RuntimeError("LLM call failed after retries")

    usage = None
    if getattr(response, "usage", None) is not None:
        usage = {
            "input_tokens": getattr(response.usage, "prompt_tokens", 0),
            "output_tokens": getattr(response.usage, "completion_tokens", 0),
        }

    full_text = (response.choices[0].message.content or "").strip()

    # Extract JSON from anywhere in the response (plain, code-fenced, or embedded)
    data = None
    extracted = _extract_json_string(full_text)
    if extracted is not None:
        try:
            data = json.loads(extracted)
        except json.JSONDecodeError:
            pass

    if data is not None:
        reply_to_user = data.get("reply_to_user", full_text)
        if not isinstance(reply_to_user, str):
            reply_to_user = str(reply_to_user) if reply_to_user is not None else ""
        raw_json_str = json.dumps(data, indent=2)
    else:
        raw_json_str = full_text
        if "{" in full_text and "reply_to_user" in full_text:
            reply_to_user = (
                "I had trouble formatting that response. Please try rephrasing or ask again."
            )
        else:
            reply_to_user = full_text

    debug_sent = None
    if include_debug:
        debug_sent = {
            "system_prompt": system_prompt,
            "messages": formatted_messages,
        }

    return reply_to_user, raw_json_str, usage, debug_sent
