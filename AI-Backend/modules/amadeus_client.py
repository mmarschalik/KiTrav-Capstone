import os
from amadeus import Client, ResponseError

_client = None


def _get_client() -> Client:
    global _client
    if _client is None:
        _client = Client(
            client_id=os.environ["AMADEUS_API_KEY"],
            client_secret=os.environ["AMADEUS_API_SECRET"],
        )
    return _client


def search_flights(
    origin: str,
    destination: str,
    departure_date: str,
    return_date: str | None = None,
    adults: int = 1,
) -> list[dict]:
    """Return up to 5 flight offers from the Amadeus Flight Offers Search API."""
    client = _get_client()
    params = {
        "originLocationCode": origin.upper(),
        "destinationLocationCode": destination.upper(),
        "departureDate": departure_date,
        "adults": adults,
        "max": 5,
        "currencyCode": "USD",
    }
    if return_date:
        params["returnDate"] = return_date

    try:
        response = client.shopping.flight_offers_search.get(**params)
        return response.data or []
    except ResponseError as e:
        print(f"[amadeus_client] ResponseError: {e}")
        return []
