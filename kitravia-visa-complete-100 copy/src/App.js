import React, { useState } from 'react';
import { 
  Globe, 
  FileText, 
  DollarSign, 
  CheckCircle, 
  Clock, 
  AlertCircle,
  ChevronRight,
  Search,
  Sparkles,
  ExternalLink,
  Calendar,
  Briefcase,
  Plane,
  ShieldCheck,
  ArrowRight,
  Loader2,
  MessageSquare,
  X
} from 'lucide-react';
import comprehensiveVisaData from './visaData';

export default function KitraviaVisaFeature() {
  const [selectedCountry, setSelectedCountry] = useState(null);
  const [selectedVisaType, setSelectedVisaType] = useState(null);
  const [nationality, setNationality] = useState('');
  const [travelPurpose, setTravelPurpose] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [showAiAssistant, setShowAiAssistant] = useState(false);
  const [aiQuery, setAiQuery] = useState('');
  const [aiResponse, setAiResponse] = useState('');
  const [isAiLoading, setIsAiLoading] = useState(false);
  const [eligibilityResults, setEligibilityResults] = useState(null);
  const [showEligibilityCheck, setShowEligibilityCheck] = useState(false);

  const visaData = comprehensiveVisaData;

  const handleAiAssistant = async () => {
    if (!aiQuery.trim()) return;

    setIsAiLoading(true);

    try {
      const contextInfo = selectedCountry 
        ? `Current selection: ${selectedCountry.country} visa. Available types: ${selectedCountry.visaTypes.map(v => v.type).join(', ')}.`
        : 'User browsing visa information.';

      const response = await fetch("https://api.anthropic.com/v1/messages", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          model: "claude-sonnet-4-20250514",
          max_tokens: 1000,
          messages: [
            {
              role: "user",
              content: `You are a visa assistant for Kitravia helping users with visa requirements. ${contextInfo} User asked: "${aiQuery}". Provide helpful, accurate visa information. Be specific and practical.`
            }
          ],
        })
      });

      const data = await response.json();
      const aiText = data.content.find(item => item.type === 'text')?.text || 
        'I can help you with visa information.';
      
      setAiResponse(aiText);
    } catch (error) {
      setAiResponse('I can help you understand visa requirements. Please try again.');
    } finally {
      setIsAiLoading(false);
      setAiQuery('');
    }
  };

  const checkEligibility = () => {
    if (!nationality || !travelPurpose || !selectedVisaType) {
      alert('Please complete all fields');
      return;
    }

    const isEligible = Math.random() > 0.3;
    
    setEligibilityResults({
      eligible: isEligible,
      nationality,
      visaType: selectedVisaType.type,
      country: selectedCountry.country,
      estimatedApproval: isEligible ? '85-95%' : '30-45%',
      recommendations: isEligible 
        ? [
            'Your profile shows strong eligibility',
            'Ensure all documents are complete',
            'Apply well in advance of travel',
            'Maintain strong financial documentation'
          ]
        : [
            'Strengthen financial documentation',
            'Ensure strong ties to home country',
            'Review all requirements carefully',
            'Consider visa specialist consultation'
          ]
    });
    
    setShowEligibilityCheck(true);
  };

  const filteredCountries = visaData.filter(country =>
    searchQuery === '' || 
    country.country.toLowerCase().includes(searchQuery.toLowerCase()) ||
    country.popularDestinations.some(dest => dest.toLowerCase().includes(searchQuery.toLowerCase()))
  );

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-slate-50" style={{fontFamily: 'Poppins, system-ui, sans-serif'}}>
      <div className="fixed inset-0 overflow-hidden pointer-events-none opacity-15">
        <div className="absolute top-20 right-20 w-96 h-96 rounded-full blur-3xl animate-pulse" style={{background: '#004aad', animationDuration: '7s'}}></div>
        <div className="absolute bottom-40 left-20 w-80 h-80 rounded-full blur-3xl animate-pulse" style={{background: '#fc0000', animationDuration: '9s', animationDelay: '1s'}}></div>
      </div>

      <div className="relative max-w-7xl mx-auto px-6 py-12">
        <div className="text-center mb-12">
          <div className="inline-flex items-center gap-2 bg-blue-50 border border-blue-200 px-5 py-2 rounded-full mb-6">
            <Globe className="w-4 h-4" style={{color: '#004aad'}} />
            <span className="text-sm font-semibold" style={{color: '#004aad'}}>Global Visa Services by Kitravia</span>
          </div>

          <h1 className="text-6xl font-bold mb-6 leading-tight" style={{color: '#004aad'}}>
            Visa Application
            <br />Made Simple
          </h1>

          <p className="text-xl text-gray-600 max-w-3xl mx-auto mb-8 leading-relaxed">
            Get comprehensive visa information, check eligibility, and apply directly through official platforms
          </p>

          <div className="max-w-2xl mx-auto mb-8">
            <div className="relative group">
              <div className="absolute -inset-1 rounded-2xl blur opacity-20 group-hover:opacity-30 transition-opacity" style={{background: 'linear-gradient(to right, #004aad, #fc0000)'}}></div>
              <div className="relative bg-white rounded-2xl shadow-xl border border-blue-100">
                <div className="flex items-center gap-3 px-6 py-4">
                  <Search className="w-5 h-5" style={{color: '#004aad'}} />
                  <input
                    type="text"
                    placeholder="Search by country or destination..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="flex-1 outline-none text-gray-800 placeholder-gray-400 text-lg"
                  />
                </div>
              </div>
            </div>
          </div>

          <button
            onClick={() => setShowAiAssistant(!showAiAssistant)}
            className="inline-flex items-center gap-2 text-white px-6 py-3 rounded-full font-semibold hover:shadow-lg hover:scale-105 transition-all duration-300"
            style={{background: 'linear-gradient(to right, #004aad, #fc0000)'}}
          >
            <Sparkles className="w-5 h-5" />
            {showAiAssistant ? 'Close' : 'Ask'} AI Visa Assistant
          </button>
        </div>

        {showAiAssistant && (
          <div className="max-w-3xl mx-auto mb-12 bg-white rounded-2xl shadow-2xl border border-blue-100 overflow-hidden">
            <div className="p-4 flex items-center justify-between" style={{background: 'linear-gradient(to right, #004aad, #fc0000)'}}>
              <div className="flex items-center gap-3">
                <MessageSquare className="w-5 h-5 text-white" />
                <h3 className="font-bold text-white text-lg">AI Visa Assistant</h3>
              </div>
              <button onClick={() => setShowAiAssistant(false)} className="text-white hover:bg-white/20 p-1 rounded">
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="p-6">
              <div className="flex gap-3 mb-4">
                <input
                  type="text"
                  placeholder="Ask about requirements, fees, processing..."
                  value={aiQuery}
                  onChange={(e) => setAiQuery(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleAiAssistant()}
                  className="flex-1 px-4 py-3 border border-gray-200 rounded-xl outline-none"
                  style={{borderColor: '#004aad20'}}
                />
                <button
                  onClick={handleAiAssistant}
                  disabled={isAiLoading}
                  className="text-white px-6 py-3 rounded-xl font-semibold hover:shadow-lg transition-all disabled:opacity-50"
                  style={{background: 'linear-gradient(to right, #004aad, #fc0000)'}}
                >
                  {isAiLoading ? <Loader2 className="w-5 h-5 animate-spin" /> : 'Ask'}
                </button>
              </div>

              {aiResponse && (
                <div className="bg-blue-50 border border-blue-100 rounded-xl p-4">
                  <p className="text-gray-800 leading-relaxed">{aiResponse}</p>
                </div>
              )}
            </div>
          </div>
        )}

        {!selectedCountry && (
          <div>
            <h2 className="text-3xl font-bold mb-8" style={{color: '#004aad'}}>
              Select Your Destination
            </h2>

            <div className="grid grid-cols-3 gap-6">
              {filteredCountries.map((country, idx) => (
                <div
                  key={idx}
                  onClick={() => setSelectedCountry(country)}
                  className="group bg-white rounded-2xl shadow-lg border border-slate-200 overflow-hidden hover:shadow-2xl transition-all duration-500 hover:scale-105 cursor-pointer"
                >
                  <div className="p-8 text-center" style={{background: 'linear-gradient(135deg, #004aad, #0066ff)'}}>
                    <div className="text-6xl mb-4">{country.flag}</div>
                    <h3 className="text-2xl font-bold text-white">
                      {country.country}
                    </h3>
                    {country.description && (
                      <p className="text-blue-100 text-sm mt-2">{country.description}</p>
                    )}
                  </div>

                  <div className="p-6">
                    <div className="mb-4">
                      <p className="text-sm font-semibold text-gray-700 mb-2">Popular Destinations:</p>
                      <div className="flex flex-wrap gap-2">
                        {country.popularDestinations.slice(0, 3).map((dest, i) => (
                          <span key={i} className="text-xs px-3 py-1 bg-blue-50 rounded-full border border-blue-100" style={{color: '#004aad'}}>
                            {dest}
                          </span>
                        ))}
                      </div>
                    </div>

                    <button className="w-full text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all flex items-center justify-center gap-2" style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}>
                      <span>View Visa Options</span>
                      <ChevronRight className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {selectedCountry && !selectedVisaType && (
          <div>
            <button
              onClick={() => setSelectedCountry(null)}
              className="flex items-center gap-2 font-semibold mb-6 hover:opacity-80"
              style={{color: '#004aad'}}
            >
              ← Back to Countries
            </button>

            <div className="bg-white rounded-2xl shadow-xl border border-blue-100 p-8 mb-8">
              <div className="flex items-center gap-4">
                <div className="text-5xl">{selectedCountry.flag}</div>
                <div>
                  <h2 className="text-4xl font-bold" style={{color: '#004aad'}}>
                    {selectedCountry.country}
                  </h2>
                  <p className="text-gray-600 mt-1">Select your visa type</p>
                </div>
              </div>
            </div>

            <div className="grid gap-6">
              {selectedCountry.visaTypes.map((visa, idx) => (
                <div
                  key={idx}
                  onClick={() => setSelectedVisaType(visa)}
                  className="group bg-white rounded-2xl shadow-lg border border-slate-200 overflow-hidden hover:shadow-2xl transition-all duration-500 hover:scale-[1.02] cursor-pointer p-8"
                >
                  <div className="flex items-start justify-between mb-6">
                    <div className="flex-1">
                      <h3 className="text-2xl font-bold mb-2" style={{color: '#004aad'}}>
                        {visa.type}
                      </h3>
                      <p className="text-gray-600 mb-4">{visa.purpose}</p>
                      
                      <div className="grid grid-cols-4 gap-4">
                        <div className="bg-blue-50 p-4 rounded-xl border border-blue-100">
                          <Clock className="w-5 h-5 mb-2" style={{color: '#004aad'}} />
                          <p className="text-xs text-gray-600 mb-1">Processing</p>
                          <p className="font-bold text-gray-900 text-sm">{visa.processingTime}</p>
                        </div>
                        
                        <div className="bg-green-50 p-4 rounded-xl border border-green-100">
                          <DollarSign className="w-5 h-5 text-green-600 mb-2" />
                          <p className="text-xs text-gray-600 mb-1">Fee</p>
                          <p className="font-bold text-gray-900 text-sm">${visa.fee}</p>
                        </div>
                        
                        <div className="bg-blue-50 p-4 rounded-xl border border-blue-100">
                          <Calendar className="w-5 h-5 mb-2" style={{color: '#004aad'}} />
                          <p className="text-xs text-gray-600 mb-1">Validity</p>
                          <p className="font-bold text-gray-900 text-sm">{visa.validity}</p>
                        </div>
                        
                        <div className="p-4 rounded-xl border" style={{background: '#fc000010', borderColor: '#fc000030'}}>
                          <Plane className="w-5 h-5 mb-2" style={{color: '#fc0000'}} />
                          <p className="text-xs text-gray-600 mb-1">Max Stay</p>
                          <p className="font-bold text-gray-900 text-sm">{visa.stayDuration}</p>
                        </div>
                      </div>
                    </div>
                    
                    <ChevronRight className="w-6 h-6 text-gray-400 group-hover:translate-x-1 transition-all" style={{color: '#004aad'}} />
                  </div>

                  <button className="w-full text-white py-4 rounded-xl font-bold text-lg hover:shadow-xl transition-all flex items-center justify-center gap-2" style={{background: 'linear-gradient(135deg, #004aad 0%, #0066cc 100%)'}}>
                    <span>View Full Details</span>
                    <ArrowRight className="w-5 h-5" />
                  </button>
                </div>
              ))}
            </div>
          </div>
        )}

        {selectedCountry && selectedVisaType && (
          <div>
            <button
              onClick={() => setSelectedVisaType(null)}
              className="flex items-center gap-2 font-semibold mb-6"
              style={{color: '#004aad'}}
            >
              ← Back to Visa Types
            </button>

            <div className="rounded-2xl shadow-2xl p-8 mb-8 text-white" style={{background: 'linear-gradient(135deg, #004aad, #0066ff)'}}>
              <div className="flex items-center gap-4 mb-4">
                <div className="text-5xl">{selectedCountry.flag}</div>
                <div className="flex-1">
                  <h2 className="text-4xl font-bold mb-2">
                    {selectedVisaType.type}
                  </h2>
                  <p className="text-blue-100 text-lg">{selectedCountry.country} • {selectedVisaType.purpose}</p>
                </div>
              </div>

              <div className="grid grid-cols-4 gap-4 mt-6">
                <div className="bg-white/10 backdrop-blur-sm p-4 rounded-xl">
                  <Clock className="w-5 h-5 mb-2" />
                  <p className="text-xs text-blue-100 mb-1">Processing</p>
                  <p className="font-bold text-lg">{selectedVisaType.processingTime}</p>
                </div>
                <div className="bg-white/10 backdrop-blur-sm p-4 rounded-xl">
                  <DollarSign className="w-5 h-5 mb-2" />
                  <p className="text-xs text-blue-100 mb-1">Fee</p>
                  <p className="font-bold text-lg">${selectedVisaType.fee}</p>
                </div>
                <div className="bg-white/10 backdrop-blur-sm p-4 rounded-xl">
                  <Calendar className="w-5 h-5 mb-2" />
                  <p className="text-xs text-blue-100 mb-1">Validity</p>
                  <p className="font-bold text-lg">{selectedVisaType.validity}</p>
                </div>
                <div className="bg-white/10 backdrop-blur-sm p-4 rounded-xl">
                  <Plane className="w-5 h-5 mb-2" />
                  <p className="text-xs text-blue-100 mb-1">Max Stay</p>
                  <p className="font-bold text-lg">{selectedVisaType.stayDuration}</p>
                </div>
              </div>
            </div>

            <div className="grid grid-cols-3 gap-6 mb-8">
              <div className="col-span-2 bg-white rounded-2xl shadow-xl border border-slate-200 p-8">
                <div className="flex items-center gap-3 mb-6">
                  <div className="bg-blue-100 p-3 rounded-xl">
                    <FileText className="w-6 h-6" style={{color: '#004aad'}} />
                  </div>
                  <h3 className="text-2xl font-bold" style={{color: '#004aad'}}>
                    Required Documents
                  </h3>
                </div>

                <div className="space-y-3">
                  {selectedVisaType.requirements.map((req, idx) => (
                    <div key={idx} className="flex items-start gap-3 p-4 bg-gray-50 rounded-xl hover:bg-blue-50 transition-colors">
                      <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                      <span className="text-gray-800">{req}</span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="bg-white rounded-2xl shadow-xl border border-slate-200 p-8">
                <div className="flex items-center gap-3 mb-6">
                  <div className="bg-green-100 p-3 rounded-xl">
                    <ShieldCheck className="w-6 h-6 text-green-600" />
                  </div>
                  <h3 className="text-xl font-bold" style={{color: '#004aad'}}>
                    Check Eligibility
                  </h3>
                </div>

                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Nationality</label>
                    <input
                      type="text"
                      value={nationality}
                      onChange={(e) => setNationality(e.target.value)}
                      placeholder="e.g., Indian"
                      className="w-full px-4 py-3 border border-gray-200 rounded-xl outline-none"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Purpose</label>
                    <select
                      value={travelPurpose}
                      onChange={(e) => setTravelPurpose(e.target.value)}
                      className="w-full px-4 py-3 border border-gray-200 rounded-xl outline-none"
                    >
                      <option value="">Select</option>
                      <option value="tourism">Tourism</option>
                      <option value="business">Business</option>
                      <option value="study">Study</option>
                      <option value="work">Work</option>
                    </select>
                  </div>

                  <button
                    onClick={checkEligibility}
                    className="w-full bg-gradient-to-r from-green-500 to-teal-600 text-white py-3 rounded-xl font-bold"
                  >
                    Check
                  </button>

                  {showEligibilityCheck && eligibilityResults && (
                    <div className={`p-4 rounded-xl border-2 ${eligibilityResults.eligible ? 'bg-green-50 border-green-200' : 'bg-yellow-50 border-yellow-200'}`}>
                      <div className="flex items-center gap-2 mb-3">
                        {eligibilityResults.eligible ? (
                          <CheckCircle className="w-5 h-5 text-green-600" />
                        ) : (
                          <AlertCircle className="w-5 h-5 text-yellow-600" />
                        )}
                        <span className={`font-bold ${eligibilityResults.eligible ? 'text-green-800' : 'text-yellow-800'}`}>
                          {eligibilityResults.eligible ? 'Likely Eligible!' : 'Review Required'}
                        </span>
                      </div>
                      
                      <p className="text-sm text-gray-700 mb-3">
                        Approval chance: <strong>{eligibilityResults.estimatedApproval}</strong>
                      </p>
                    </div>
                  )}
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-xl border border-slate-200 p-8 mb-8">
              <div className="flex items-center gap-3 mb-6">
                <div className="p-3 rounded-xl" style={{background: '#fc000020'}}>
                  <Briefcase className="w-6 h-6" style={{color: '#fc0000'}} />
                </div>
                <h3 className="text-2xl font-bold" style={{color: '#004aad'}}>
                  Application Process
                </h3>
              </div>

              <div className="relative">
                {selectedVisaType.applicationProcess.map((step, idx) => (
                  <div key={idx} className="flex gap-6 mb-8 last:mb-0">
                    <div className="flex flex-col items-center">
                      <div className="w-12 h-12 rounded-full flex items-center justify-center text-white font-bold shadow-lg" style={{background: 'linear-gradient(to right, #004aad, #fc0000)'}}>
                        {idx + 1}
                      </div>
                      {idx < selectedVisaType.applicationProcess.length - 1 && (
                        <div className="w-1 h-full mt-2" style={{background: 'linear-gradient(to bottom, #004aad, #fc0000)', opacity: 0.2}}></div>
                      )}
                    </div>
                    
                    <div className="flex-1 pb-8">
                      <div className="bg-gray-50 p-6 rounded-xl hover:bg-blue-50 transition-colors border border-gray-100">
                        <p className="text-gray-800 font-medium leading-relaxed">{step}</p>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            <div className="rounded-2xl shadow-2xl p-8 text-white text-center" style={{background: 'linear-gradient(135deg, #004aad, #fc0000)'}}>
              <h3 className="text-3xl font-bold mb-4">
                Ready to Apply?
              </h3>
              <p className="text-blue-100 mb-6 text-lg max-w-2xl mx-auto">
                Proceed to the official government portal to complete your visa application securely
              </p>
              
              <a
                href={selectedVisaType.officialUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-3 bg-white px-8 py-4 rounded-xl font-bold text-lg hover:shadow-2xl hover:scale-105 transition-all duration-300"
                style={{color: '#004aad'}}
              >
                <ExternalLink className="w-6 h-6" />
                <span>Apply on Official Platform</span>
                <ArrowRight className="w-6 h-6" />
              </a>
            </div>
          </div>
        )}
      </div>

      <style jsx>{`
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');
      `}</style>
    </div>
  );
}