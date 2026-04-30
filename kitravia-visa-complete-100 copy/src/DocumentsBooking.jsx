import React, { useState } from 'react';
import { 
  Plane, 
  Hotel, 
  Shield, 
  CheckCircle, 
  ArrowRight, 
  Clock, 
  FileText,
  AlertCircle,
  Star,
  CreditCard,
  Globe,
  Check,
  Info,
  X,
  ExternalLink
} from 'lucide-react';

export default function VisaDocumentsBooking() {
  const [activeService, setActiveService] = useState('flight');
  const [step, setStep] = useState(1);
  const [showInsurancePartners, setShowInsurancePartners] = useState(false);
  const [bookingData, setBookingData] = useState({
    // Flight details
    tripType: 'round-trip',
    from: '',
    to: '',
    departureDate: '',
    returnDate: '',
    passengers: 1,
    flightClass: 'economy',
    
    // Hotel details
    city: '',
    checkIn: '',
    checkOut: '',
    rooms: 1,
    hotelType: 'standard',
    
    // Personal details
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    nationality: '',
    
    // Visa details
    visaType: '',
    embassy: ''
  });

  const [orderSummary, setOrderSummary] = useState(null);

  const insurancePartners = [
    {
      name: 'Allianz Travel Insurance',
      url: 'https://www.allianztravelinsurance.ca/en_CA/lp/ppc/allianz-travel-insurance.html',
      coverage: '€50,000+',
      countries: 'Worldwide'
    },
    {
      name: 'World Nomads',
      url: 'https://www.worldnomads.com/',
      coverage: 'Comprehensive',
      countries: '150+ Countries'
    },
    {
      name: 'SafetyWing',
      url: 'https://safetywing.com/',
      coverage: '$250,000',
      countries: 'Global Coverage'
    }
  ];

  const services = [
    {
      id: 'flight',
      icon: Plane,
      name: 'Flight Reservation',
      price: 15,
      description: 'Verifiable flight itinerary with PNR code',
      features: [
        'Valid booking reference (PNR)',
        'Verifiable on airline website',
        'Valid for 30 days',
        'Free date changes',
        'Worldwide acceptance',
        'Embassy approved format'
      ]
    },
    {
      id: 'hotel',
      icon: Hotel,
      name: 'Hotel Booking',
      price: 12,
      description: 'Confirmed hotel reservation proof',
      features: [
        'Confirmed booking reference',
        'Verifiable on hotel website',
        'Valid until check-in date',
        'Free cancellation option',
        'Pay at hotel option',
        'Multiple cities available'
      ]
    },
    {
      id: 'package',
      icon: FileText,
      name: 'Complete Package',
      price: 25,
      originalPrice: 27,
      description: 'Flight + Hotel + Insurance Value',
      features: [
        'Flight reservation ($15) included',
        'Hotel booking ($12) included',
        'Insurance partner access',
        'Save $2 with package',
        'Priority processing',
        'Complete visa documents'
      ],
      badge: 'BEST VALUE'
    },
    {
      id: 'insurance',
      icon: Shield,
      name: 'Travel Insurance',
      price: null,
      description: 'Get coverage from our trusted partners',
      features: [
        'Multiple insurance options',
        'Schengen visa compliant',
        'Direct purchase from partners',
        'Compare coverage & prices',
        'Worldwide protection',
        'Instant certificates'
      ],
      isPartner: true
    }
  ];

  const testimonials = [
    {
      name: 'Sarah Johnson',
      country: 'USA',
      visa: 'Schengen Visa',
      rating: 5,
      text: 'Perfect for my Schengen visa! Got flight reservation in 2 hours. Verified on Lufthansa website. Visa approved!',
      date: '2 weeks ago'
    },
    {
      name: 'Rajesh Kumar',
      country: 'India',
      visa: 'UK Visa',
      rating: 5,
      text: 'Excellent service! The booking was verifiable and accepted by UK embassy. Very professional and fast delivery.',
      date: '1 month ago'
    },
    {
      name: 'Maria Garcia',
      country: 'Philippines',
      visa: 'Canada Visa',
      rating: 5,
      text: 'I was worried about booking flights before visa approval. This service saved me from expensive tickets. Highly recommend!',
      date: '3 weeks ago'
    }
  ];

  const handleInputChange = (field, value) => {
    setBookingData({ ...bookingData, [field]: value });
  };

  const calculatePrice = () => {
    let total = 0;
    if (activeService === 'flight') {
      total = 15 * bookingData.passengers;
      if (bookingData.tripType === 'multi-city') total += 10;
    } else if (activeService === 'hotel') {
      total = 12 * bookingData.rooms;
    } else if (activeService === 'package') {
      total = 45 * bookingData.passengers; // Complete Package with insurance value
    }
    return total;
  };

  const handleBooking = async () => {
    const summary = {
      orderNumber: 'KIT-' + Math.random().toString(36).substr(2, 9).toUpperCase(),
      serviceType: activeService,
      price: calculatePrice(),
      deliveryTime: '1-3 hours',
      verifiable: true,
      details: bookingData
    };

    // Prepare data for backend
    const backendData = {
      serviceType: activeService,
      firstName: bookingData.firstName,
      lastName: bookingData.lastName,
      email: bookingData.email,
      phone: bookingData.phone,
      nationality: bookingData.nationality,
      visaType: bookingData.visaType,
      embassy: bookingData.embassy,
      tripType: bookingData.tripType,
      fromCity: bookingData.from,
      toCity: bookingData.to,
      departureDate: bookingData.departureDate,
      returnDate: bookingData.returnDate,
      passengers: bookingData.passengers,
      flightClass: bookingData.flightClass,
      hotelCity: bookingData.city,
      checkInDate: bookingData.checkIn,
      checkOutDate: bookingData.checkOut,
      rooms: bookingData.rooms,
      hotelType: bookingData.hotelType,
      price: calculatePrice()
    };

    try {
      // Send to backend API
      const response = await fetch('http://localhost:5000/api/bookings', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(backendData)
      });

      const data = await response.json();

      if (data.success) {
        // Update order summary with real order number and PNR from backend
        summary.orderNumber = data.orderNumber;
        summary.pnrCode = data.pnrCode;
        
        setOrderSummary(summary);
        setStep(4);
        
        console.log('✅ Booking saved successfully:', data);
      } else {
        throw new Error(data.message || 'Booking failed');
      }
    } catch (error) {
      console.error('❌ Booking error:', error);
      
      // Still show confirmation (fallback mode)
      alert('Booking created locally. Backend connection failed: ' + error.message);
      setOrderSummary(summary);
      setStep(4);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-gray-50">
      {/* Header */}
      <div className="text-white py-16" style={{background: 'linear-gradient(to right, #004aad, #0066cc)'}}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center">
            <div className="inline-flex items-center gap-2 bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full mb-6">
              <FileText className="w-4 h-4" />
              <span className="text-sm font-semibold">Embassy Approved Documents</span>
            </div>
            
            <h1 className="text-5xl font-bold mb-4" style={{fontFamily: 'Georgia, serif'}}>
              Flight & Hotel Reservations
              <br />for Visa Applications
            </h1>
            
            <p className="text-xl text-blue-100 max-w-3xl mx-auto mb-8">
              Get verifiable flight itineraries and hotel bookings without paying full price. 
              Accepted by embassies worldwide.
            </p>

            <div className="flex items-center justify-center gap-8 text-sm">
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>100% Verifiable</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>Instant Delivery</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>Embassy Approved</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-12">
        {/* Service Selection */}
        <div className="mb-12">
          <h2 className="text-3xl font-bold text-center mb-8 text-gray-900" style={{fontFamily: 'Georgia, serif'}}>
            Choose Your Service
          </h2>

          <div className="grid grid-cols-4 gap-6">
            {services.map((service) => (
              <div
                key={service.id}
                onClick={() => {
                  if (service.isPartner) {
                    setShowInsurancePartners(true);
                  } else {
                    setActiveService(service.id);
                    setStep(1);
                  }
                }}
                className={`relative cursor-pointer bg-white rounded-2xl shadow-lg border-2 transition-all duration-300 hover:shadow-xl hover:scale-105 ${
                  activeService === service.id && !service.isPartner
                    ? 'border-red-500 ring-4 ring-red-100'
                    : 'border-gray-200'
                }`}
              >
                {service.badge && (
                  <div className="absolute -top-3 -right-3 bg-gradient-to-r from-orange-500 to-red-500 text-white px-3 py-1 rounded-full text-xs font-bold shadow-lg">
                    {service.badge}
                  </div>
                )}

                <div className="p-6">
                  <div className="flex items-center justify-between mb-4">
                    <div className={`p-3 rounded-xl ${
                      activeService === service.id ? 'bg-blue-100' : 'bg-gray-100'
                    }`}>
                      <service.icon className={`w-6 h-6 ${
                        activeService === service.id ? 'text-blue-600' : 'text-gray-600'
                      }`} />
                    </div>
                    {activeService === service.id && (
                      <CheckCircle className="w-6 h-6 text-blue-600" />
                    )}
                  </div>

                  <h3 className="text-xl font-bold text-gray-900 mb-2">{service.name}</h3>
                  <p className="text-sm text-gray-600 mb-4">{service.description}</p>

                  <div className="flex items-baseline gap-2 mb-4">
                    {service.price !== null ? (
                      <>
                        <span className="text-3xl font-bold text-red-600">${service.price}</span>
                        {service.originalPrice && (
                          <span className="text-lg text-gray-400 line-through">${service.originalPrice}</span>
                        )}
                      </>
                    ) : (
                      <span className="text-2xl font-bold text-red-600">Compare & Buy</span>
                    )}
                  </div>

                  <ul className="space-y-2">
                    {service.features.map((feature, idx) => (
                      <li key={idx} className="flex items-start gap-2 text-sm text-gray-700">
                        <Check className="w-4 h-4 text-green-600 flex-shrink-0 mt-0.5" />
                        <span>{feature}</span>
                      </li>
                    ))}
                  </ul>

                  <button 
                    className={`w-full mt-4 py-3 rounded-xl font-semibold transition-all ${
                      activeService === service.id && !service.isPartner
                        ? 'text-white hover:shadow-lg'
                        : service.isPartner
                        ? 'text-white hover:shadow-lg'
                        : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                    }`}
                    style={activeService === service.id || service.isPartner ? {background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'} : {}}
                  >
                    {service.isPartner ? 'View Partners' : (activeService === service.id ? 'Selected' : 'Select')}
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Booking Form */}
        {step <= 3 && (
          <div className="bg-white rounded-2xl shadow-xl border border-gray-200 p-8 mb-12">
            <div className="flex items-center justify-between mb-8">
              <h2 className="text-2xl font-bold text-gray-900">
                {step === 1 && 'Travel Details'}
                {step === 2 && 'Personal Information'}
                {step === 3 && 'Review & Payment'}
              </h2>
              <div className="flex items-center gap-2">
                {[1, 2, 3].map((s) => (
                  <div
                    key={s}
                    className={`w-10 h-10 rounded-full flex items-center justify-center font-semibold ${
                      s === step
                        ? 'bg-blue-600 text-white'
                        : s < step
                        ? 'bg-green-600 text-white'
                        : 'bg-gray-200 text-gray-600'
                    }`}
                  >
                    {s < step ? <Check className="w-5 h-5" /> : s}
                  </div>
                ))}
              </div>
            </div>

            {/* Step 1: Travel Details */}
            {step === 1 && (
              <div className="space-y-6">
                {(activeService === 'flight' || activeService === 'package') && (
                  <>
                    <div className="bg-blue-50 p-4 rounded-xl border border-blue-200">
                      <h3 className="font-semibold text-blue-900 mb-3 flex items-center gap-2">
                        <Plane className="w-5 h-5" />
                        Flight Reservation Details
                      </h3>

                      <div className="grid grid-cols-3 gap-4 mb-4">
                        {['one-way', 'round-trip', 'multi-city'].map((type) => (
                          <button
                            key={type}
                            onClick={() => handleInputChange('tripType', type)}
                            className={`p-3 rounded-xl border-2 font-semibold transition-all ${
                              bookingData.tripType === type
                                ? 'border-blue-600 bg-blue-100 text-blue-900'
                                : 'border-gray-200 bg-white text-gray-700 hover:border-blue-300'
                            }`}
                          >
                            {type.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                          </button>
                        ))}
                      </div>

                      <div className="grid grid-cols-2 gap-4">
                        <div>
                          <label className="block text-sm font-semibold text-gray-700 mb-2">From (Departure City)</label>
                          <input
                            type="text"
                            placeholder="e.g., New York, USA"
                            value={bookingData.from}
                            onChange={(e) => handleInputChange('from', e.target.value)}
                            className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                          />
                        </div>
                        <div>
                          <label className="block text-sm font-semibold text-gray-700 mb-2">To (Arrival City)</label>
                          <input
                            type="text"
                            placeholder="e.g., Paris, France"
                            value={bookingData.to}
                            onChange={(e) => handleInputChange('to', e.target.value)}
                            className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                          />
                        </div>
                        <div>
                          <label className="block text-sm font-semibold text-gray-700 mb-2">Departure Date</label>
                          <input
                            type="date"
                            value={bookingData.departureDate}
                            onChange={(e) => handleInputChange('departureDate', e.target.value)}
                            className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                          />
                        </div>
                        {bookingData.tripType !== 'one-way' && (
                          <div>
                            <label className="block text-sm font-semibold text-gray-700 mb-2">Return Date</label>
                            <input
                              type="date"
                              value={bookingData.returnDate}
                              onChange={(e) => handleInputChange('returnDate', e.target.value)}
                              className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                            />
                          </div>
                        )}
                        <div>
                          <label className="block text-sm font-semibold text-gray-700 mb-2">Passengers</label>
                          <select
                            value={bookingData.passengers}
                            onChange={(e) => handleInputChange('passengers', parseInt(e.target.value))}
                            className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                          >
                            {[1, 2, 3, 4, 5, 6].map(n => (
                              <option key={n} value={n}>{n} Passenger{n > 1 ? 's' : ''}</option>
                            ))}
                          </select>
                        </div>
                        <div>
                          <label className="block text-sm font-semibold text-gray-700 mb-2">Class</label>
                          <select
                            value={bookingData.flightClass}
                            onChange={(e) => handleInputChange('flightClass', e.target.value)}
                            className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                          >
                            <option value="economy">Economy</option>
                            <option value="business">Business</option>
                            <option value="first">First Class</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </>
                )}

                {(activeService === 'hotel' || activeService === 'package') && (
                  <div className="bg-blue-50 p-4 rounded-xl border border-blue-200">
                    <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2">
                      <Hotel className="w-5 h-5" style={{color: '#004aad'}} />
                      Hotel Booking Details
                    </h3>

                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <label className="block text-sm font-semibold text-gray-700 mb-2">City</label>
                        <input
                          type="text"
                          placeholder="e.g., Paris, France"
                          value={bookingData.city}
                          onChange={(e) => handleInputChange('city', e.target.value)}
                          className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-semibold text-gray-700 mb-2">Hotel Type</label>
                        <select
                          value={bookingData.hotelType}
                          onChange={(e) => handleInputChange('hotelType', e.target.value)}
                          className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                        >
                          <option value="standard">Standard (3-star)</option>
                          <option value="deluxe">Deluxe (4-star)</option>
                          <option value="luxury">Luxury (5-star)</option>
                        </select>
                      </div>
                      <div>
                        <label className="block text-sm font-semibold text-gray-700 mb-2">Check-in Date</label>
                        <input
                          type="date"
                          value={bookingData.checkIn}
                          onChange={(e) => handleInputChange('checkIn', e.target.value)}
                          className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-semibold text-gray-700 mb-2">Check-out Date</label>
                        <input
                          type="date"
                          value={bookingData.checkOut}
                          onChange={(e) => handleInputChange('checkOut', e.target.value)}
                          className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-semibold text-gray-700 mb-2">Rooms</label>
                        <select
                          value={bookingData.rooms}
                          onChange={(e) => handleInputChange('rooms', parseInt(e.target.value))}
                          className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                        >
                          {[1, 2, 3, 4].map(n => (
                            <option key={n} value={n}>{n} Room{n > 1 ? 's' : ''}</option>
                          ))}
                        </select>
                      </div>
                    </div>
                  </div>
                )}

                <button
                  onClick={() => setStep(2)}
                  className="w-full text-white py-4 rounded-xl font-bold text-lg hover:shadow-lg hover:scale-105 transition-all flex items-center justify-center gap-2"
                  style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}
                >
                  <span>Continue to Personal Details</span>
                  <ArrowRight className="w-5 h-5" />
                </button>
              </div>
            )}

            {/* Step 2: Personal Information */}
            {step === 2 && (
              <div className="space-y-6">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">First Name</label>
                    <input
                      type="text"
                      placeholder="As per passport"
                      value={bookingData.firstName}
                      onChange={(e) => handleInputChange('firstName', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Last Name</label>
                    <input
                      type="text"
                      placeholder="As per passport"
                      value={bookingData.lastName}
                      onChange={(e) => handleInputChange('lastName', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Email Address</label>
                    <input
                      type="email"
                      placeholder="your@email.com"
                      value={bookingData.email}
                      onChange={(e) => handleInputChange('email', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Phone Number</label>
                    <input
                      type="tel"
                      placeholder="+1 234 567 8900"
                      value={bookingData.phone}
                      onChange={(e) => handleInputChange('phone', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Nationality</label>
                    <input
                      type="text"
                      placeholder="e.g., American"
                      value={bookingData.nationality}
                      onChange={(e) => handleInputChange('nationality', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Visa Type</label>
                    <select
                      value={bookingData.visaType}
                      onChange={(e) => handleInputChange('visaType', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    >
                      <option value="">Select visa type</option>
                      <option value="tourist">Tourist Visa</option>
                      <option value="business">Business Visa</option>
                      <option value="student">Student Visa</option>
                      <option value="schengen">Schengen Visa</option>
                      <option value="work">Work Visa</option>
                    </select>
                  </div>
                  <div className="col-span-2">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Embassy/Consulate</label>
                    <input
                      type="text"
                      placeholder="e.g., French Embassy, New York"
                      value={bookingData.embassy}
                      onChange={(e) => handleInputChange('embassy', e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                </div>

                <div className="flex gap-4">
                  <button
                    onClick={() => setStep(1)}
                    className="flex-1 bg-gray-200 text-gray-700 py-4 rounded-xl font-bold hover:bg-gray-300 transition-all"
                  >
                    Back
                  </button>
                  <button
                    onClick={() => setStep(3)}
                    className="flex-1 text-white py-4 rounded-xl font-bold hover:shadow-lg hover:scale-105 transition-all flex items-center justify-center gap-2"
                    style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}
                  >
                    <span>Review Order</span>
                    <ArrowRight className="w-5 h-5" />
                  </button>
                </div>
              </div>
            )}

            {/* Step 3: Review & Payment */}
            {step === 3 && (
              <div className="space-y-6">
                <div className="bg-gradient-to-r from-blue-50 to-gray-50 p-6 rounded-xl border border-blue-200">
                  <h3 className="font-bold text-lg mb-4 text-gray-900">Order Summary</h3>
                  
                  <div className="space-y-3 mb-4">
                    <div className="flex justify-between">
                      <span className="text-gray-700">Service:</span>
                      <span className="font-semibold text-gray-900">
                        {services.find(s => s.id === activeService)?.name}
                      </span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-gray-700">Passenger Name:</span>
                      <span className="font-semibold text-gray-900">
                        {bookingData.firstName} {bookingData.lastName}
                      </span>
                    </div>
                    {(activeService === 'flight' || activeService === 'package') && (
                      <>
                        <div className="flex justify-between">
                          <span className="text-gray-700">Route:</span>
                          <span className="font-semibold text-gray-900">
                            {bookingData.from} → {bookingData.to}
                          </span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-gray-700">Travel Dates:</span>
                          <span className="font-semibold text-gray-900">
                            {bookingData.departureDate} {bookingData.returnDate && `to ${bookingData.returnDate}`}
                          </span>
                        </div>
                      </>
                    )}
                    <div className="flex justify-between">
                      <span className="text-gray-700">Delivery Time:</span>
                      <span className="font-semibold text-green-600">1-3 hours</span>
                    </div>
                  </div>

                  <div className="border-t border-blue-200 pt-4">
                    <div className="flex justify-between items-center">
                      <span className="text-xl font-bold text-gray-900">Total Amount:</span>
                      <span className="text-3xl font-bold text-blue-600">${calculatePrice()}</span>
                    </div>
                  </div>
                </div>

                <div className="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
                  <div className="flex items-start gap-3">
                    <Info className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
                    <div className="text-sm text-yellow-800">
                      <p className="font-semibold mb-1">Important Information:</p>
                      <ul className="list-disc list-inside space-y-1">
                        <li>Your reservation will be sent to {bookingData.email}</li>
                        <li>All reservations are verifiable on official websites</li>
                        <li>Valid for 14 days from booking date</li>
                        <li>Free date changes available if needed</li>
                      </ul>
                    </div>
                  </div>
                </div>

                <div className="flex gap-4">
                  <button
                    onClick={() => setStep(2)}
                    className="flex-1 bg-gray-200 text-gray-700 py-4 rounded-xl font-bold hover:bg-gray-300 transition-all"
                  >
                    Back
                  </button>
                  <button
                    onClick={handleBooking}
                    className="flex-1 bg-gradient-to-r from-green-600 to-emerald-600 text-white py-4 rounded-xl font-bold hover:shadow-lg hover:scale-105 transition-all flex items-center justify-center gap-2"
                  >
                    <CreditCard className="w-5 h-5" />
                    <span>Proceed to Payment</span>
                  </button>
                </div>
              </div>
            )}
          </div>
        )}

        {/* Order Confirmation */}
        {step === 4 && orderSummary && (
          <div className="bg-white rounded-2xl shadow-xl border border-gray-200 p-8 text-center max-w-2xl mx-auto">
            <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <CheckCircle className="w-12 h-12 text-green-600" />
            </div>

            <h2 className="text-3xl font-bold text-gray-900 mb-4">Order Confirmed!</h2>
            <p className="text-gray-600 mb-6">
              Thank you for your order. Your documents are being processed.
            </p>

            <div className="bg-blue-50 rounded-xl p-6 mb-6">
              <div className="grid grid-cols-2 gap-4 text-left">
                <div>
                  <p className="text-sm text-gray-600">Order Number</p>
                  <p className="font-bold text-gray-900">{orderSummary.orderNumber}</p>
                </div>
                {orderSummary.pnrCode && (
                  <div>
                    <p className="text-sm text-gray-600">PNR Code</p>
                    <p className="font-bold text-blue-600">{orderSummary.pnrCode}</p>
                  </div>
                )}
                <div>
                  <p className="text-sm text-gray-600">Estimated Delivery</p>
                  <p className="font-bold text-green-600">{orderSummary.deliveryTime}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Email</p>
                  <p className="font-bold text-gray-900">{bookingData.email}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Amount Paid</p>
                  <p className="font-bold text-gray-900">${orderSummary.price}</p>
                </div>
              </div>
            </div>

            <div className="space-y-3 text-sm text-gray-600 mb-6">
              <p>✅ Confirmation email sent to {bookingData.email}</p>
              <p>✅ Documents will be verifiable on official websites</p>
              <p>✅ Customer support available 24/7</p>
            </div>

            <button
              onClick={() => {
                setStep(1);
                setOrderSummary(null);
                setBookingData({
                  tripType: 'round-trip',
                  from: '',
                  to: '',
                  departureDate: '',
                  returnDate: '',
                  passengers: 1,
                  flightClass: 'economy',
                  city: '',
                  checkIn: '',
                  checkOut: '',
                  rooms: 1,
                  hotelType: 'standard',
                  firstName: '',
                  lastName: '',
                  email: '',
                  phone: '',
                  nationality: '',
                  visaType: '',
                  embassy: ''
                });
              }}
              className="text-white px-8 py-3 rounded-xl font-bold hover:shadow-lg transition-all"
              style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}
            >
              Make Another Booking
            </button>
          </div>
        )}

        {/* Features Section */}
        <div className="grid grid-cols-3 gap-6 mb-12">
          {[
            {
              icon: CheckCircle,
              title: '100% Verifiable',
              description: 'All reservations can be checked on official airline and hotel websites with PNR/booking codes'
            },
            {
              icon: Clock,
              title: 'Fast Delivery',
              description: 'Receive your documents within 1-3 hours. Rush service available for urgent applications'
            },
            {
              icon: Shield,
              title: 'Embassy Approved',
              description: 'Accepted by embassies worldwide including Schengen, USA, UK, Canada, and Australia'
            }
          ].map((feature, idx) => (
            <div key={idx} className="bg-white rounded-xl shadow-lg p-6 border border-gray-200">
              <div className="bg-blue-100 w-12 h-12 rounded-xl flex items-center justify-center mb-4">
                <feature.icon className="w-6 h-6 text-blue-600" />
              </div>
              <h3 className="text-lg font-bold text-gray-900 mb-2">{feature.title}</h3>
              <p className="text-sm text-gray-600">{feature.description}</p>
            </div>
          ))}
        </div>

        {/* Testimonials */}
        <div className="mb-12">
          <h2 className="text-3xl font-bold text-center mb-8 text-gray-900" style={{fontFamily: 'Georgia, serif'}}>
            What Our Customers Say
          </h2>

          <div className="grid grid-cols-3 gap-6">
            {testimonials.map((testimonial, idx) => (
              <div key={idx} className="bg-white rounded-xl shadow-lg p-6 border border-gray-200">
                <div className="flex items-center gap-1 mb-3">
                  {[...Array(testimonial.rating)].map((_, i) => (
                    <Star key={i} className="w-4 h-4 fill-yellow-400 text-yellow-400" />
                  ))}
                </div>
                <p className="text-gray-700 mb-4 italic">"{testimonial.text}"</p>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-gray-900">{testimonial.name}</p>
                    <p className="text-sm text-gray-600">{testimonial.country}</p>
                  </div>
                  <div className="text-right">
                    <p className="text-xs font-semibold text-green-600">{testimonial.visa}</p>
                    <p className="text-xs text-gray-500">{testimonial.date}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* FAQ */}
        <div className="bg-white rounded-2xl shadow-xl border border-gray-200 p-8">
          <h2 className="text-3xl font-bold text-center mb-8 text-gray-900" style={{fontFamily: 'Georgia, serif'}}>
            Frequently Asked Questions
          </h2>

          <div className="space-y-4">
            {[
              {
                q: 'Is this a real flight ticket?',
                a: 'No. This is a verifiable flight reservation with a valid PNR code that embassies accept as proof of travel plans. You should not purchase actual tickets until your visa is approved.'
              },
              {
                q: 'Can I verify the reservation online?',
                a: 'Yes! All our reservations come with a PNR/booking code that can be verified directly on the airline or hotel website.'
              },
              {
                q: 'How long is the reservation valid?',
                a: 'Flight reservations are valid for 30 days. Hotel reservations remain valid until your check-in date.'
              },
              {
                q: 'What if my visa gets delayed?',
                a: 'We offer free date changes if your travel plans change. Simply contact us and we will update your reservation.'
              },
              {
                q: 'Is this accepted by all embassies?',
                a: 'Yes. Our reservations are accepted worldwide including Schengen countries, USA, UK, Canada, Australia, and more.'
              },
              {
                q: 'How do I get travel insurance?',
                a: 'Click on "Travel Insurance Partners" to compare and purchase insurance directly from our trusted partners like Allianz, World Nomads, and SafetyWing.'
              }
            ].map((faq, idx) => (
              <div key={idx} className="bg-gray-50 rounded-xl p-6 border border-gray-200">
                <h3 className="font-bold text-gray-900 mb-2 flex items-start gap-2">
                  <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                  {faq.q}
                </h3>
                <p className="text-gray-700 ml-7">{faq.a}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Insurance Partners Modal */}
        {showInsurancePartners && (
          <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-6">
            <div className="bg-white rounded-2xl shadow-2xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
              <div className="sticky top-0 text-white p-6 flex items-center justify-between" style={{background: 'linear-gradient(to right, #004aad, #0066cc)'}}>
                <div>
                  <h2 className="text-3xl font-bold mb-2">Travel Insurance Partners</h2>
                  <p className="text-blue-100">Choose from our trusted insurance providers</p>
                </div>
                <button 
                  onClick={() => setShowInsurancePartners(false)}
                  className="p-2 hover:bg-white/20 rounded-full transition-colors"
                >
                  <X className="w-6 h-6" />
                </button>
              </div>

              <div className="p-8">
                <div className="bg-yellow-50 border border-yellow-200 rounded-xl p-4 mb-6">
                  <div className="flex items-start gap-3">
                    <Info className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
                    <div className="text-sm text-yellow-800">
                      <p className="font-semibold mb-1">As a travel agency, we partner with insurance providers:</p>
                      <p>Click on any partner below to compare coverage and purchase insurance directly from their platform. All partners offer Schengen-compliant coverage.</p>
                    </div>
                  </div>
                </div>

                <div className="grid gap-6">
                  {insurancePartners.map((partner, idx) => (
                    <div key={idx} className="border-2 border-gray-200 rounded-xl p-6 hover:border-blue-500 hover:shadow-lg transition-all">
                      <div className="flex items-start justify-between mb-4">
                        <div>
                          <h3 className="text-2xl font-bold text-gray-900 mb-2">{partner.name}</h3>
                          <div className="flex items-center gap-4 text-sm text-gray-600">
                            <div className="flex items-center gap-1">
                              <Shield className="w-4 h-4 text-blue-600" />
                              <span>Coverage: {partner.coverage}</span>
                            </div>
                            <div className="flex items-center gap-1">
                              <Globe className="w-4 h-4 text-blue-600" />
                              <span>{partner.countries}</span>
                            </div>
                          </div>
                        </div>
                        <a
                          href={partner.url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-white px-6 py-3 rounded-xl font-semibold hover:shadow-lg transition-all flex items-center gap-2"
                          style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}
                        >
                          <span>Get Quote</span>
                          <ExternalLink className="w-4 h-4" />
                        </a>
                      </div>

                      <div className="grid grid-cols-3 gap-4 text-sm">
                        <div className="bg-gray-50 p-3 rounded-lg">
                          <p className="text-gray-600 mb-1">Medical Coverage</p>
                          <p className="font-semibold text-gray-900">Up to {partner.coverage}</p>
                        </div>
                        <div className="bg-gray-50 p-3 rounded-lg">
                          <p className="text-gray-600 mb-1">Coverage Area</p>
                          <p className="font-semibold text-gray-900">{partner.countries}</p>
                        </div>
                        <div className="bg-gray-50 p-3 rounded-lg">
                          <p className="text-gray-600 mb-1">Visa Compliant</p>
                          <p className="font-semibold text-green-600">✓ Schengen</p>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>

                <div className="mt-6 text-center">
                  <button 
                    onClick={() => setShowInsurancePartners(false)}
                    className="bg-gray-200 text-gray-700 px-8 py-3 rounded-xl font-semibold hover:bg-gray-300 transition-all"
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
