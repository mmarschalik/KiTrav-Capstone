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


def search_hotels(
    city: str,
    check_in_date: str,
    check_out_date: str | None = None,
    adults: int = 1,
) -> list[dict]:
    """Return up to 5 hotel offers for a city using the Amadeus Hotel Search API."""
    client = _get_client()
    try:
        # Step 1: get hotel IDs for the city
        hotel_list = client.reference_data.locations.hotels.by_city.get(cityCode=city.upper())
        hotel_ids = [h["hotelId"] for h in (hotel_list.data or [])[:20]]
        if not hotel_ids:
            return []
    except ResponseError as e:
        print(f"[amadeus_hotels] hotel list ResponseError: {e}")
        return []

    params = {
        "hotelIds": hotel_ids,
        "adults": adults,
        "checkInDate": check_in_date,
    }
    if check_out_date:
        params["checkOutDate"] = check_out_date

    try:
        response = client.shopping.hotel_offers_search.get(**params)
        return (response.data or [])[:5]
    except ResponseError as e:
        print(f"[amadeus_hotels] offers ResponseError: {e}")
        return []
