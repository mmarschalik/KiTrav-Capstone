import json
import os
import ssl
import certifi

# Fix macOS Python SSL cert verification for the Amadeus SDK
os.environ.setdefault("SSL_CERT_FILE", certifi.where())
os.environ.setdefault("REQUESTS_CA_BUNDLE", certifi.where())
ssl._create_default_https_context = lambda: ssl.create_default_context(cafile=certifi.where())

import openai as _openai
from dotenv import load_dotenv
from flask import Flask, request
from flask_cors import CORS

load_dotenv()

from modules.llm_connector import call_llm

app = Flask(__name__)
CORS(app)


def _parse_llm_response(raw_json_str: str):
    if not raw_json_str or not raw_json_str.strip():
        return None
    try:
        return json.loads(raw_json_str)
    except json.JSONDecodeError:
        return {"_raw": raw_json_str, "_parse_error": True}


def _format_itinerary_as_text(llm_data: dict, params: dict) -> str:
    destination = params.get("destination", "your destination")
    travelers = params.get("travelers")
    start_date = params.get("start_date", "")
    end_date = params.get("end_date", "")
    budget_range = params.get("budget_range")
    travel_types = params.get("travel_types")

    itinerary = llm_data.get("itinerary") or []
    duration_days = len(itinerary)

    header_parts = [f"{duration_days}-day itinerary for {destination}"]
    if start_date and end_date:
        header_parts.append(f"({start_date} – {end_date})")
    if travelers:
        header_parts.append(f"{travelers} traveler{'s' if int(travelers) != 1 else ''}")
    if budget_range:
        header_parts.append(f"{budget_range} budget")
    if travel_types:
        types = travel_types if isinstance(travel_types, list) else [travel_types]
        header_parts.append(", ".join(types))

    lines = ["Your " + " | ".join(header_parts) + ":\n"]

    for day in itinerary:
        day_num = day.get("day", "")
        date_str = day.get("date", "")
        theme = day.get("theme") or day.get("title", "")
        day_header = f"Day {day_num}"
        if date_str:
            day_header += f" – {date_str}"
        if theme:
            day_header += f": {theme}"
        lines.append(day_header)

        for period in ("morning", "afternoon", "evening"):
            val = day.get(period)
            if val:
                lines.append(f"  {period.capitalize()}: {val}")

        meals = day.get("meals")
        if isinstance(meals, dict):
            meal_parts = [f"{k.capitalize()}: {v}" for k, v in meals.items() if v]
            if meal_parts:
                lines.append(f"  Meals: {' | '.join(meal_parts)}")

        transport = day.get("transport")
        if transport:
            lines.append(f"  Transport: {transport}")

        tip = day.get("tip")
        if tip:
            lines.append(f"  Tip: {tip}")

        lines.append("")

    return "\n".join(lines).strip()


def _generate_mock_search_reply(parsed_llm: dict) -> str | None:
    api_key = os.getenv("OPENAI_API_KEY")
    if not api_key:
        return None
    client = _openai.OpenAI(api_key=api_key)

    if parsed_llm.get("ready_to_search"):
        p = parsed_llm.get("flight_params") or {}
        origin = p.get("origin", "the origin")
        destination = p.get("destination", "the destination")
        start_date = p.get("start_date", "the departure date")
        end_date = p.get("end_date")
        travelers = p.get("travelers", 1)
        prompt = (
            f"Generate exactly 4 realistic but fictional flight options from {origin} to {destination} "
            f"departing {start_date}"
            + (f" and returning {end_date}" if end_date else "")
            + f" for {travelers} traveler(s). "
            "Use real airline names, realistic prices in USD, realistic departure/arrival times, "
            "and a mix of non-stop and 1-stop options. "
            "Format the reply as a friendly travel assistant message listing each flight clearly "
            "with airline, departure time, arrival time, duration, stops, and price per person. "
            "Use plain text only — no markdown, no asterisks, no bold, no symbols. "
            "Do NOT mention that the data is fake or generated."
        )
    elif parsed_llm.get("ready_to_search_hotel"):
        p = parsed_llm.get("hotel_params") or {}
        destination = p.get("destination", "the destination")
        check_in = p.get("check_in_date", "check-in date")
        check_out = p.get("check_out_date", "check-out date")
        guests = p.get("guests", 1)
        prompt = (
            f"Generate exactly 4 realistic but fictional hotel options in {destination} "
            f"for {guests} guest(s), checking in {check_in} and checking out {check_out}. "
            "Use real-sounding hotel names, realistic nightly prices in USD written as numbers (e.g. $95/night), star ratings, "
            "and a mix of budget to mid-range to upscale options. "
            "Format the reply as a friendly travel assistant message listing each hotel clearly "
            "with name, star rating, price per night, and a one-line description. "
            "Use plain text only — no markdown, no asterisks, no bold, no symbols. "
            "Do NOT mention that the data is fake or generated."
        )
    else:
        return None

    try:
        response = client.chat.completions.create(
            model="gpt-4.1-mini",
            messages=[{"role": "user", "content": prompt}],
            max_tokens=800,
            temperature=0.7,
        )
        return response.choices[0].message.content.strip()
    except Exception:
        return None


@app.route("/chat_new", methods=["POST"])
def chat_new():
    if not request.is_json:
        return {"error": "Content-Type must be application/json"}, 400

    data = request.get_json() or {}
    message = (data.get("message") or "").strip()
    if not message:
        return {"error": "message is required"}, 400

    history_text = (data.get("history_text") or "").strip()
    chat_history = []
    if history_text:
        chat_history.extend([
            {
                "role": "user",
                "text": (
                    f"Previous conversation between the user and assistant:\n{history_text}\n\n"
                    "Use this conversation as context for the latest user message. Continue naturally."
                ),
            },
            {
                "role": "assistant",
                "text": "Understood. I will use that conversation as context.",
            },
        ])
    chat_history.append({"role": "user", "text": message})

    try:
        _reply, raw_json_str, _usage, _ = call_llm(chat_history, intent="UNIFIED")
    except Exception as e:
        return {"error": str(e)}, 500

    parsed = _parse_llm_response(raw_json_str)
    reply_to_user = (parsed or {}).get("reply_to_user", "") if parsed else ""

    if parsed:
        if parsed.get("ready_to_search"):
            mock_reply = _generate_mock_search_reply(parsed)
            if mock_reply:
                reply_to_user = mock_reply
        elif parsed.get("ready_to_search_hotel"):
            mock_reply = _generate_mock_search_reply(parsed)
            if mock_reply:
                reply_to_user = mock_reply
        elif parsed.get("ready_to_generate"):
            itinerary_params = parsed.get("itinerary_params") or {}
            try:
                dummy_history = [{"role": "user", "text": "Generate the itinerary."}]
                _r, raw_json_str, _u, _ = call_llm(
                    dummy_history,
                    intent="ITINERARY_GENERATION",
                    itinerary_params=itinerary_params,
                )
                llm_data = json.loads(raw_json_str)
                reply_to_user = _format_itinerary_as_text(llm_data, itinerary_params)
            except Exception:
                pass

    return {"reply": reply_to_user}, 200


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5001))
    debug = os.environ.get("FLASK_ENV") != "production"
    app.run(host="0.0.0.0", port=port, debug=debug)
