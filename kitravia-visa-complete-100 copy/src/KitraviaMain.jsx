import React, { useState } from 'react';
import { FileText, Plane, Home, Users } from 'lucide-react';
import KitraviaVisaFeature from './App';
import DocumentsBooking from './DocumentsBooking';
import ImmigrationAgents from './ImmigrationAgents';

export default function KitraviaMain() {
  // Changed default page to 'documents' (Booking for Visa)
  const [currentPage, setCurrentPage] = useState('documents');

  return (
    <div className="min-h-screen">
      {/* Navigation Header - NO HELP OR SIGN IN */}
      <nav className="bg-white shadow-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            {/* Navigation Menu - REORDERED */}
            <div className="flex items-center gap-2">
              {/* FIRST TAB: Booking for Visa */}
              <button
                onClick={() => setCurrentPage('documents')}
                className={`flex items-center gap-2 px-6 py-3 rounded-xl font-semibold transition-all ${
                  currentPage === 'documents'
                    ? 'text-white shadow-lg'
                    : 'text-gray-700 hover:bg-gray-100'
                }`}
                style={currentPage === 'documents' ? {background: 'linear-gradient(to right, #004aad, #fc0000)'} : {}}
              >
                <Plane className="w-5 h-5" />
                <span>Booking for Visa</span>
              </button>

              {/* SECOND TAB: Visa Information */}
              <button
                onClick={() => setCurrentPage('visa-info')}
                className={`flex items-center gap-2 px-6 py-3 rounded-xl font-semibold transition-all ${
                  currentPage === 'visa-info'
                    ? 'text-white shadow-lg'
                    : 'text-gray-700 hover:bg-gray-100'
                }`}
                style={currentPage === 'visa-info' ? {background: 'linear-gradient(to right, #004aad, #fc0000)'} : {}}
              >
                <Home className="w-5 h-5" />
                <span>Visa Information</span>
              </button>

              {/* THIRD TAB: Expert Hub */}
              <button
                onClick={() => setCurrentPage('agents')}
                className={`flex items-center gap-2 px-6 py-3 rounded-xl font-semibold transition-all ${
                  currentPage === 'agents'
                    ? 'text-white shadow-lg'
                    : 'text-gray-700 hover:bg-gray-100'
                }`}
                style={currentPage === 'agents' ? {background: 'linear-gradient(to right, #004aad, #fc0000)'} : {}}
              >
                <Users className="w-5 h-5" />
                <span>Expert Hub</span>
              </button>
            </div>

            {/* NO HELP BUTTON */}
            {/* NO SIGN IN BUTTON */}
            {/* Clean navigation - just the 3 main tabs! */}
          </div>
        </div>
      </nav>

      {/* Page Content */}
      <div>
        {currentPage === 'documents' && <DocumentsBooking />}
        {currentPage === 'visa-info' && <KitraviaVisaFeature />}
        {currentPage === 'agents' && <ImmigrationAgents />}
      </div>

      {/* Quick Access Banner - Show on Visa Info page only */}
      {currentPage === 'visa-info' && (
        <div className="fixed bottom-8 right-8 z-40">
          <button
            onClick={() => setCurrentPage('documents')}
            className="text-white px-6 py-4 rounded-full font-bold shadow-2xl hover:scale-110 transition-all flex items-center gap-3 animate-bounce"
            style={{background: 'linear-gradient(135deg, #004aad 0%, #fc0000 100%)'}}
          >
            <FileText className="w-5 h-5" />
            <span>Need Flight/Hotel for Visa?</span>
            <div className="bg-white text-red-600 text-xs px-2 py-1 rounded-full font-bold">
              From $12
            </div>
          </button>
        </div>
      )}
    </div>
  );
}
