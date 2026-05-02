import React, { useState } from 'react';
import { ExternalLink, Users, MapPin, Globe, CheckCircle, Info, Star } from 'lucide-react';

export default function ImmigrationAgentsPartners() {
  const [selectedCountry, setSelectedCountry] = useState('all');

  const immigrationAgents = [
    // Add your partners' information here
    {
      name: 'Immigration Expert Name 1',
      country: 'USA',
      url: 'https://partner-website.com',
      services: ['Visa Applications', 'Permanent Residence', 'Business Immigration', 'Study Permits'],
      rating: 4.8,
      experience: '15+ years',
      languages: ['English', 'Spanish', 'French']
    },
    {
      name: 'Immigration Expert Name 2',
      country: 'Canada',
      url: 'https://partner-website.com',
      services: ['Express Entry', 'Study Permits', 'Work Permits', 'Travel Documentation'],
      rating: 4.9,
      experience: '20+ years',
      languages: ['English', 'French']
    },
    {
      name: 'Immigration Expert Name 3',
      country: 'UK',
      url: 'https://partner-website.com',
      services: ['Visa Applications', 'Business Immigration', 'Study Permits', 'Travel Documentation'],
      rating: 4.7,
      experience: '12+ years',
      languages: ['English', 'Hindi', 'Urdu']
    },
    {
      name: 'Immigration Expert Name 4',
      country: 'Australia',
      url: 'https://partner-website.com',
      services: ['Permanent Residence', 'Study Permits', 'Work Permits', 'Travel Documentation'],
      rating: 4.8,
      experience: '18+ years',
      languages: ['English', 'Mandarin']
    }
  ];

  const countries = ['all', 'USA', 'Canada', 'UK', 'Australia', 'Germany', 'France', 'New Zealand'];

  const filteredAgents = selectedCountry === 'all' 
    ? immigrationAgents 
    : immigrationAgents.filter(agent => agent.country === selectedCountry);

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-gray-50">
      {/* Header */}
      <div className="text-white py-16" style={{background: 'linear-gradient(to right, #004aad, #0066cc)'}}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center">
            <div className="inline-flex items-center gap-2 bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full mb-6">
              <Users className="w-4 h-4" />
              <span className="text-sm font-semibold">Connecting You With Trusted Immigration Experts Worldwide</span>
            </div>
            
            <h1 className="text-5xl font-bold mb-4" style={{fontFamily: 'Georgia, serif'}}>
              Expert Hub
            </h1>
            
            <p className="text-xl text-blue-100 max-w-3xl mx-auto mb-8">
              The Expert Hub connects users with verified immigration professionals around the world. Whether you are applying for a visa, permanent residence, business immigration, study permit, or travel documentation, our platform helps you find the right expert to guide you through the process.
            </p>

            <div className="flex items-center justify-center gap-8 text-sm">
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>Verified Professionals</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>Global Coverage</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-300" />
                <span>Expert Guidance</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-12">
        {/* Filter by Country */}
        <div className="mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Filter by Country</h2>
          <div className="flex flex-wrap gap-3">
            {countries.map((country) => (
              <button
                key={country}
                onClick={() => setSelectedCountry(country)}
                className={`px-6 py-3 rounded-xl font-semibold transition-all ${
                  selectedCountry === country
                    ? 'text-white shadow-lg'
                    : 'bg-white text-gray-700 border-2 border-gray-200 hover:border-blue-500'
                }`}
                style={selectedCountry === country ? {background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'} : {}}
              >
                {country === 'all' ? 'All Countries' : `🌍 ${country}`}
              </button>
            ))}
          </div>
        </div>

        {/* Information Banner */}
        <div className="bg-blue-50 border border-blue-200 rounded-xl p-6 mb-8">
          <div className="flex items-start gap-3">
            <Info className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
            <div className="text-sm text-blue-900">
              <p className="font-semibold mb-2">Why Expert Hub?</p>
              <ul className="list-disc list-inside space-y-1">
                <li>Verified professionals with proven track records</li>
                <li>Higher success rates for visa and immigration applications</li>
                <li>Personalized guidance tailored to your specific situation</li>
                <li>Expert navigation of complex immigration laws and procedures</li>
                <li>Save time and avoid costly application mistakes</li>
              </ul>
            </div>
          </div>
        </div>

        {/* Immigration Agents Grid */}
        <div className="grid gap-6">
          {filteredAgents.map((agent, idx) => (
            <div key={idx} className="bg-white border-2 border-gray-200 rounded-xl p-6 hover:border-blue-500 hover:shadow-xl transition-all">
              <div className="flex items-start justify-between mb-4">
                <div className="flex-1">
                  <div className="flex items-center gap-3 mb-2">
                    <h3 className="text-2xl font-bold text-gray-900">{agent.name}</h3>
                    <div className="flex items-center gap-1 bg-yellow-50 px-3 py-1 rounded-full">
                      <Star className="w-4 h-4 fill-yellow-400 text-yellow-400" />
                      <span className="font-semibold text-gray-900">{agent.rating}</span>
                    </div>
                  </div>
                  
                  <div className="flex items-center gap-4 text-sm text-gray-600 mb-4">
                    <div className="flex items-center gap-1">
                      <MapPin className="w-4 h-4 text-blue-600" />
                      <span className="font-semibold">{agent.country}</span>
                    </div>
                    <div className="flex items-center gap-1">
                      <CheckCircle className="w-4 h-4 text-green-600" />
                      <span>{agent.experience} experience</span>
                    </div>
                    <div className="flex items-center gap-1">
                      <Globe className="w-4 h-4 text-blue-600" />
                      <span>{agent.languages.join(', ')}</span>
                    </div>
                  </div>

                  <div className="mb-4">
                    <p className="text-sm font-semibold text-gray-700 mb-2">Services Offered:</p>
                    <div className="flex flex-wrap gap-2">
                      {agent.services.map((service, i) => (
                        <span key={i} className="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-sm font-medium">
                          {service}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>

                <a
                  href={agent.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-white px-6 py-3 rounded-xl font-semibold hover:shadow-lg transition-all flex items-center gap-2 ml-4"
                  style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}
                >
                  <span>Contact Agent</span>
                  <ExternalLink className="w-4 h-4" />
                </a>
              </div>

              <div className="grid grid-cols-4 gap-4 pt-4 border-t border-gray-200">
                <div className="text-center">
                  <p className="text-gray-600 text-xs mb-1">Success Rate</p>
                  <p className="font-bold text-green-600">95%+</p>
                </div>
                <div className="text-center">
                  <p className="text-gray-600 text-xs mb-1">Cases Handled</p>
                  <p className="font-bold text-gray-900">1000+</p>
                </div>
                <div className="text-center">
                  <p className="text-gray-600 text-xs mb-1">Response Time</p>
                  <p className="font-bold text-gray-900">24 hours</p>
                </div>
                <div className="text-center">
                  <p className="text-gray-600 text-xs mb-1">Consultation</p>
                  <p className="font-bold text-blue-600">Free</p>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* No Results */}
        {filteredAgents.length === 0 && (
          <div className="text-center py-12">
            <Users className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">No Agents Found</h3>
            <p className="text-gray-600">We're working on adding immigration agents for {selectedCountry}. Check back soon!</p>
          </div>
        )}

        {/* Bottom Info Section */}
        <div className="mt-12 bg-white rounded-2xl shadow-xl border border-gray-200 p-8">
          <h2 className="text-3xl font-bold text-center mb-6 text-gray-900" style={{fontFamily: 'Georgia, serif'}}>
            How to Choose an Immigration Expert
          </h2>

          <div className="grid md:grid-cols-3 gap-6">
            <div className="text-center">
              <div className="w-16 h-16 rounded-full mx-auto mb-4 flex items-center justify-center" style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}>
                <CheckCircle className="w-8 h-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2">Verify Credentials</h3>
              <p className="text-sm text-gray-600">Ensure the agent is registered and certified in their country of practice</p>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 rounded-full mx-auto mb-4 flex items-center justify-center" style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}>
                <Star className="w-8 h-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2">Check Reviews</h3>
              <p className="text-sm text-gray-600">Read testimonials and success stories from previous clients</p>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 rounded-full mx-auto mb-4 flex items-center justify-center" style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}>
                <Users className="w-8 h-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2">Get Consultation</h3>
              <p className="text-sm text-gray-600">Schedule a free consultation to discuss your case and evaluate their expertise</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
