function cleanFlightResponse(amadeusResponse) {
  if (!amadeusResponse || !amadeusResponse.data) {
    return [];
  }

  return amadeusResponse.data.map((flight) => {
    return {
      id: flight.id,
      price: flight.price?.total || null,
      currency: flight.price?.currency || null,
      itineraries: flight.itineraries?.map((itinerary) => ({
        duration: itinerary.duration,
        segments: itinerary.segments?.map((segment) => ({
          departureAirport: segment.departure?.iataCode || null,
          departureTime: segment.departure?.at || null,
          arrivalAirport: segment.arrival?.iataCode || null,
          arrivalTime: segment.arrival?.at || null,
          carrierCode: segment.carrierCode || null,
          flightNumber: segment.number || null
        }))
      }))
    };
  });
}

module.exports = cleanFlightResponse;
