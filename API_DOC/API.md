## 1) LLM API – OpenAI (Chat Completions)

**Vendor Base URL**: `https://api.openai.com/v1/chat/completions`

**Auth**: `Authorization: Bearer ${OPENAI_API_KEY}`

### Backend Wrapper

- `POST /api/llm/compose`
    - Body:
        
        ```json
        {
          "system": "You are a travel assistant...",
          "messages": [{"role":"user","content":"3-day Vegas under $800"}],
          "tools": ["flight_search","hotel_search"],
          "itinerary_constraints": {"budget":800,"nights":2}
        }
        
        ```
        
    - Returns normalized text + optional tool call hints.

### Minimum Vendor Request

```json
{
  "model": "gpt-5",
  "messages": [
    {"role":"system","content":"You are a travel assistant."},
    {"role":"user","content":"Plan a 3-day Vegas trip under $800."}
  ],
  "temperature": 0.4
}

```

### Sample Normalized Response

```json
{
  "text": "Day 1: Arrive PHX→LAS ...",
  "entities": {"city":"Las Vegas","dates":["2025-10-10","2025-10-12"],"budget":800},
  "actions": [{"type":"flight_search"},{"type":"hotel_search"}]
}

```

### Errors

- 401 invalid key, 429 rate limit → backoff/retry; surface `error_code`, `retry_after`.
- Safety filters: return `{blocked:true, reason}` and show safe fallback message.

---

## 2) Flights API – Amadeus (example)

**Vendor Base URL**: `https://test.api.amadeus.com`

**Auth**: OAuth2 Client Credentials → `AMADEUS_CLIENT_ID/SECRET` → `Bearer ${AMADEUS_TOKEN}`

### Backend Wrappers

- `GET /api/flights/search`
    - Query: `origin`, `destination`, `departDate`, `returnDate?`, `adults`, `cabin?`, `maxPrice?`, `nonStop?`, `page?`, `limit?`
- `POST /api/flights/price`
    - Body: `{"offerId":"amds_off_123"}`
- `POST /api/flights/book` *(idempotent)*
    - Body:
        
        ```json
        {
          "offerId":"amds_off_123",
          "passengers":[{"firstName":"Ishaan","lastName":"Kurmi","dob":"2005-01-01"}],
          "contacts":{"email":"...","phone":"+1..."},
          "paymentToken":"pp_order_456"
        }
        
        ```
        

### Typical Vendor Search (illustrative)

`GET /v2/shopping/flight-offers?originLocationCode=PHX&destinationLocationCode=LAS&departureDate=2025-10-10&returnDate=2025-10-12&adults=1&nonStop=false`

### Normalized Search Response

```json
{
  "results":[
    {
      "id":"amds_off_123",
      "price":{"total": "178.20","currency":"USD"},
      "segments":[{"from":"PHX","to":"LAS","dep":"2025-10-10T09:15","arr":"10:25"}],
      "carrier":"WN",
      "fareClass":"W"
    }
  ],
  "page":{"cursor":"eyJ...","limit":20}
}

```

### Errors

- 400 bad query (dates/airport codes), 401/403 auth, 429/5xx retry/backoff.
- On pricing mismatch at `book`, respond `409 PRICE_CHANGED` with new quote.

---

## 3) Hotels API – Expedia Partner Solutions or Booking.com (example)

**Vendor Base URL**: (varies by provider; shown as EPS style)

**Auth**: API key or OAuth2 depending on partner program.

### Backend Wrappers

- `GET /api/hotels/search`
    - Query: `city|lat,lng`, `checkIn`, `checkOut`, `guests`, `rooms?=1`, `stars?`, `amenities?`, `maxPrice?`, `sort?=price|rating|distance`, `page?`, `limit?`
- `GET /api/hotels/:id`
    - Returns property details, images, room types, cancellation policy.
- `POST /api/hotels/book` *(idempotent)*
    - Body:
        
        ```json
        {
          "hotelId":"exp_987",
          "roomTypeId":"rt_king_1",
          "ratePlanId":"refundable",
          "guests":[{"firstName":"Ishaan","lastName":"Kurmi"}],
          "paymentToken":"pp_order_456",
          "specialRequests":"High floor"
        }
        
        ```
        

### Normalized Search Response

```json
{
  "results":[
    {
      "id":"exp_987",
      "name":"Grand Casino Hotel",
      "stars":4,
      "price":{"night":"129.00","currency":"USD","nights":2,"total":"258.00"},
      "location":{"lat":36.11,"lng":-115.17,"distanceKm":0.6},
      "freeCancellation": true,
      "thumbnail":"https://cdn..."
    }
  ],
  "page":{"cursor":"eyJ...","limit":20}
}

```

### Booking Response

```json
{
  "bookingId":"hot_abc_123",
  "status":"CONFIRMED",
  "cancellationPolicy":{"until":"2025-10-08T23:59"},
  "voucherUrl":"https://..."
}

```

### Errors

- 409 sold out / rate changed → return new rate/options.
- 422 validation (guest names, dates) with field errors.
- Handle vendor-specific guarantee rules (card holds vs. immediate capture).