# KiTravia Backend API Endpoints

Base URL: `http://localhost:5001` (development)

> **Auth:** No `Authorization` header is required. Authentication is handled client-side by FlutterFlow.

---

## POST `/chat_new`

Main conversational endpoint. Sends a user message to the LLM (with optional conversation history) and returns a plain-text reply. Handles flights, hotels, and itinerary planning in a single unified flow.

### Request

| Field          | Type   | Required | Description                                                                 |
|----------------|--------|----------|-----------------------------------------------------------------------------|
| `message`      | string | yes      | The user's current message                                                  |
| `history_text` | string | no       | Prior conversation as plain text (e.g. `"user: ...\nassistant: ..."`)      |

```json
{
  "message": "I want to fly from Phoenix to Miami on June 10",
  "history_text": "user: Hi\nassistant: Hey! How can I help you plan your trip?"
}
```

If `history_text` is omitted the message is treated as the start of a new conversation.

### Response `200`

```json
{
  "reply": "Here are 4 flight options from Phoenix to Miami on June 10..."
}
```

| Field   | Type   | Description                          |
|---------|--------|--------------------------------------|
| `reply` | string | Plain-text reply to show the user    |

### How the reply is generated

The LLM runs a unified prompt that handles all three travel flows:

**Flights** — the LLM collects origin, destination, and departure date, then the backend generates realistic flight options and returns them as plain text.

**Hotels** — the LLM collects destination, check-in date, and check-out date, then the backend generates realistic hotel options and returns them as plain text.

**Itinerary** — the LLM collects destination, travelers, start date, end date, and travel types, then generates a full day-by-day itinerary formatted as plain text:

```
Your 7-day itinerary for Paris | (2025-07-01 – 2025-07-07) | 2 travelers | mid-range budget | Cultural, Culinary:

Day 1 – 2025-07-01: Arrival & First Impressions
  Morning: ...
  Afternoon: ...
  Evening: ...
  Meals: Breakfast: ... | Lunch: ... | Dinner: ...
  Transport: ...
  Tip: ...
```

### Error Responses

| Status | Condition             | Body                                                  |
|--------|-----------------------|-------------------------------------------------------|
| 400    | Non-JSON body         | `{"error": "Content-Type must be application/json"}` |
| 400    | Missing `message`     | `{"error": "message is required"}`                   |
| 500    | LLM call failed       | `{"error": "..."}`                                   |

---

## Content-Type

All requests must include:
```
Content-Type: application/json
```

---

## CORS

No CORS headers are set by default. Configure as needed before deployment.
