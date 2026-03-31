# Rental Packages Research

Task: #66 Rental Packages  
User Story: #41 Research on new suggestion by sponsor  
Date: October 14, 2025  
Status: Completed

---

## User Story

As a traveler, I want to rent vehicles (car, scooter, or bike) along with my trip bookings, so that I can manage transportation at my destination from one platform.

---

## Research Summary

Researched rental car/vehicle APIs to integrate into KiTrav platform. Evaluated multiple options and selected Booking.com Rental Cars API for seamless integration with existing hotel booking system.

---

## Recommended API

### Booking.com Rental Cars API

Why This API:
- Already integrated in our platform for hotels (reuse authentication and code)
- Free to use (commission-based, 4-6% per booking)
- Bonus: 7-8% commission for bundled bookings (hotel + car)
- Global coverage with 60,000+ rental locations worldwide
- Real-time availability and pricing
- Major rental companies included (Hertz, Avis, Budget, Enterprise)
- Website: booking.com/affiliate

Advantages Over New APIs:
- No new API signup or approval needed
- Same authentication system as hotels
- Consistent error handling and data format
- Unified user experience
- Single support contact
- Code reuse saves 30% development time

---

## Alternative APIs Considered

### Rentalcars.com API
- Coverage: 900+ companies globally
- Cost: 5-8% commission
- Pros: Largest inventory
- Cons: New API integration needed
- Decision: Not selected (redundant with Booking.com)

### Kayak Rental Cars API
- Cost: 4-6% commission
- Pros: Aggregates multiple providers
- Cons: Another API to manage
- Decision: Not selected

### Turo API
- Type: Peer-to-peer car sharing
- Cost: 8-12% commission
- Pros: Unique vehicles, often cheaper
- Cons: Limited availability in some regions
- Decision: Future consideration

---

## Implementation Plan

### Week 1: API Setup (15 hours)
- Enable rental car API with Booking.com
- Test endpoints (reuse hotel integration code)
- Update backend configuration

### Week 2: Frontend (25 hours)
- Copy hotel search component and modify for cars
- Add vehicle type, pickup/return location fields
- Create rental result cards (vehicle specs, pricing)
- Build booking flow

### Week 3: Integration (15 hours)
- Connect to backend API
- Database updates (add 'rental' to booking_type)
- Payment integration
- Testing

### Week 4: Launch (10 hours)
- Bug fixes
- QA testing
- Deploy to production

Total: 65 hours (3-4 weeks)

---

## Features to Build

### Search Form
- Pickup location (with autocomplete)
- Pickup date and time
- Return date and time
- Vehicle type dropdown (economy, compact, SUV, luxury)
- Driver age input (default 25)

### Results Display
- Vehicle image and name
- Specifications (seats, bags, transmission type)
- Price per day and total price
- Rental company name
- Rating and reviews
- "Select" button

### Booking Flow
- Vehicle details page
- Insurance options
- Add-ons (GPS, child seat, extra driver)
- Confirmation and payment
- Email confirmation with pickup details

---

## Integration Benefits

Using Booking.com API:
- Reuse existing authentication (same API key)
- Consistent booking flow with hotels
- Unified confirmation emails
- Single affiliate dashboard for reporting
- Better commission rates with bundling
- Easier maintenance (one API partner)

vs Adding New API:
- New signup and approval process
- Different authentication system
- Separate error handling
- More complex codebase
- Multiple support contacts

---

## Cost Analysis

Commission Structure:
- Booking.com Hotels: 4-5%
- Booking.com Rentals: 4-6%
- Bundle Bonus (Hotel + Car): 7-8%

Revenue Model:
- Platform fee: 2-3% per rental booking
- Example: $500 rental = $10-15 revenue
- Monthly target: 30 rentals = $300-450 revenue

Comparison:
- Rentalcars.com: 5-8% commission (no bundling bonus)
- Booking.com: 4-6% + bundle bonus up to 8%
- Winner: Booking.com (better with bundling)

---

## Success Metrics

Adoption:
- 25% of trips include rental bookings
- 15% search-to-booking conversion rate

User Satisfaction:
- 4+ star rating for rental feature
- Less than 5% cancellation rate

Revenue:
- 30 rentals per month by Month 3
- $300-450 monthly revenue
- Break-even by Month 6

---

## Vehicle Types Supported

Categories Available:
1. Economy (cheapest, 4-5 seats, small)
2. Compact (popular, 5 seats, moderate)
3. Midsize (comfortable, 5 seats, spacious)
4. SUV (large groups, 5-7 seats, luggage)
5. Luxury (premium, 4-5 seats, high-end)
6. Van (groups, 7-9 seats, maximum space)

---

## User Benefits

Convenience:
- Book flights, hotels, and car in one place
- Single checkout process
- Unified trip itinerary

Savings:
- Bundle discounts (hotel + car)
- Price comparison built-in
- No hidden fees

Integration:
- Rental added to trip automatically
- Pickup times coordinated with flights
- Included in budget tracker

---

## Risk Mitigation

Risk: API downtime
Solution: Cache last results, show service status

Risk: Price changes between search and booking
Solution: Show disclaimer "Prices subject to change"

Risk: Limited availability
Solution: Show alternative vehicles, multiple pickup locations

Risk: International license requirements
Solution: Display requirements by country in booking flow

---

## Next Steps

Sprint 2 (Current):
- Research completed (Done)

Sprint 3:
- Contact Booking.com to enable rental API
- Test API endpoints
- Design rental search UI

Sprint 4:
- Backend integration
- Frontend components
- Database updates

Sprint 5:
- Testing and QA
- Bug fixes
- Launch rental feature

---

## Resources

- API Documentation: booking.com/affiliate
- Integration Guide: docs/api/booking-rental-integration.md
- UI Mockups: docs/design/rental-search-mockups.pdf
