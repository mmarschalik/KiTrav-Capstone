export const comprehensiveVisaData = [
  {
    country: 'United States',
    flag: '🇺🇸',
    popularDestinations: ['New York', 'Los Angeles', 'San Francisco', 'Miami', 'Las Vegas', 'Chicago'],
    visaTypes: [
      {
        type: 'B1/B2 Tourist/Business Visa',
        purpose: 'Tourism, Business Meetings, Medical Treatment',
        processingTime: '3-5 weeks',
        validity: 'Up to 10 years',
        stayDuration: 'Up to 6 months per entry',
        fee: 185,
        requirements: [
          'Valid passport (6 months validity beyond stay)',
          'DS-160 confirmation page',
          'Visa appointment confirmation',
          'Passport-size photograph (2x2 inches, white background)',
          'Proof of financial stability (bank statements, ITR)',
          'Travel itinerary and hotel bookings',
          'Employment letter or business registration',
          'Previous travel history to US/other countries',
          'Property documents (if applicable)',
          'Family ties proof in home country'
        ],
        applicationProcess: [
          'Complete DS-160 form online at ceac.state.gov',
          'Pay visa application fee ($185)',
          'Schedule visa interview appointment',
          'Gather all required documents',
          'Attend visa interview at US Embassy/Consulate',
          'Answer questions about purpose of visit',
          'Wait for administrative processing (3-5 weeks)',
          'Collect passport with visa stamp'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/tourism-visit/visitor.html',
        eligibility: {
          minAge: 0,
          maxStay: 180,
          requiresInterview: true,
          commonRejectionReasons: [
            'Insufficient financial proof',
            'Lack of strong ties to home country',
            'Incomplete or incorrect documentation',
            'Previous visa violations or overstay',
            'Immigration intent suspected',
            'Inconsistent answers during interview'
          ]
        }
      },
      {
        type: 'F-1 Student Visa',
        purpose: 'Academic Studies at US Institution',
        processingTime: '4-6 weeks',
        validity: 'Duration of study program',
        stayDuration: 'Full course duration + 60 days grace period',
        fee: 185,
        requirements: [
          'Valid passport (6 months beyond study period)',
          'I-20 form from SEVP-approved US institution',
          'SEVIS fee payment receipt ($350)',
          'DS-160 confirmation page',
          'Visa appointment confirmation',
          'Financial proof for tuition and living expenses',
          'Academic transcripts and certificates',
          'Standardized test scores (TOEFL/IELTS, GRE/GMAT/SAT)',
          'Admission letter from university',
          'Intent to return home after studies',
          'Sponsor documents (if sponsored)'
        ],
        applicationProcess: [
          'Get accepted to SEVP-approved school',
          'Receive Form I-20 from institution',
          'Pay SEVIS I-901 fee ($350) online',
          'Complete DS-160 form',
          'Pay visa application fee ($185)',
          'Schedule visa interview appointment',
          'Prepare all academic and financial documents',
          'Attend interview at US Embassy',
          'Demonstrate strong ties to home country',
          'Wait for visa processing',
          'Collect passport with F-1 visa'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html',
        eligibility: {
          minAge: 0,
          requiresInterview: true,
          commonRejectionReasons: [
            'Insufficient financial proof',
            'Poor academic credentials',
            'Immigration intent',
            'Inadequate explanation of study plans',
            'Weak ties to home country'
          ]
        }
      },
      {
        type: 'H-1B Work Visa (Specialty Occupation)',
        purpose: 'Employment in Specialty Occupation',
        processingTime: '3-6 months (including lottery)',
        validity: 'Up to 3 years (extendable to 6 years)',
        stayDuration: 'Duration of employment contract',
        fee: 190,
        requirements: [
          'Valid passport',
          'Approved Form I-129 petition by employer',
          'Form I-797 approval notice',
          'DS-160 confirmation',
          'Job offer letter',
          'Educational credentials (Bachelor\'s or higher)',
          'Resume/CV',
          'Employer\'s business documents',
          'Labor Condition Application (LCA)',
          'Proof of specialty occupation requirement',
          'Previous work experience documents'
        ],
        applicationProcess: [
          'Employer files H-1B petition (Form I-129) with USCIS',
          'Enter H-1B lottery (if cap-subject)',
          'Wait for petition approval (I-797 notice)',
          'Complete DS-160 form',
          'Pay visa fee ($190)',
          'Schedule visa interview',
          'Gather employment and education documents',
          'Attend interview at US Embassy',
          'Visa processing and passport stamping'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/employment/temporary-worker-visas.html',
        eligibility: {
          requiresInterview: true,
          note: 'Subject to annual cap of 65,000 (+ 20,000 for Master\'s degree holders)',
          commonRejectionReasons: [
            'Job doesn\'t qualify as specialty occupation',
            'Insufficient educational qualifications',
            'Employer credibility issues',
            'Salary doesn\'t meet prevailing wage'
          ]
        }
      },
      {
        type: 'J-1 Exchange Visitor Visa',
        purpose: 'Exchange Programs, Research, Training',
        processingTime: '2-4 weeks',
        validity: 'Program duration',
        stayDuration: 'As specified on DS-2019',
        fee: 185,
        requirements: [
          'Valid passport',
          'DS-2019 form from program sponsor',
          'SEVIS fee payment receipt ($220)',
          'DS-160 confirmation',
          'Program acceptance letter',
          'Financial proof',
          'Academic/professional credentials',
          'Insurance requirements met',
          'Intent to return home after program'
        ],
        applicationProcess: [
          'Get accepted to exchange program',
          'Receive DS-2019 from program sponsor',
          'Pay SEVIS I-901 fee ($220)',
          'Complete DS-160',
          'Pay visa fee ($185)',
          'Schedule interview',
          'Attend interview with all documents',
          'Obtain J-1 visa'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/study/exchange.html',
        eligibility: {
          requiresInterview: true,
          note: 'Subject to 2-year home residency requirement for some categories'
        }
      },
      {
        type: 'L-1 Intracompany Transfer Visa',
        purpose: 'Transfer within Same Company',
        processingTime: '3-6 months',
        validity: 'L-1A: 7 years, L-1B: 5 years',
        stayDuration: 'Per approval period',
        fee: 190,
        requirements: [
          'Approved I-129 petition',
          'I-797 approval notice',
          'Valid passport',
          'DS-160 confirmation',
          'Employment letter from foreign and US entity',
          'Company relationship documents',
          'Proof of managerial/specialized knowledge role',
          'Resume and credentials',
          'Company financial statements'
        ],
        applicationProcess: [
          'Employer files L-1 petition with USCIS',
          'Wait for I-129 approval',
          'Complete DS-160',
          'Pay visa fee',
          'Schedule interview',
          'Submit documents proving intracompany transfer',
          'Attend interview',
          'Receive L-1 visa'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/employment/temporary-worker-visas.html',
        eligibility: {
          requiresInterview: true,
          note: 'Must have worked for foreign entity for 1 continuous year in past 3 years'
        }
      },
      {
        type: 'O-1 Visa (Extraordinary Ability)',
        purpose: 'Extraordinary Ability in Sciences, Arts, Education, Business, Athletics',
        processingTime: '2-4 months',
        validity: 'Up to 3 years (extendable)',
        stayDuration: 'Duration of event/activity',
        fee: 190,
        requirements: [
          'Approved I-129 petition',
          'Evidence of extraordinary ability',
          'Awards, publications, media coverage',
          'Expert recommendation letters',
          'Employment contract or itinerary',
          'Consultation from peer group',
          'Valid passport',
          'DS-160 confirmation'
        ],
        applicationProcess: [
          'Employer/agent files I-129 petition',
          'Submit extensive evidence of extraordinary ability',
          'Obtain peer consultation letter',
          'Wait for USCIS approval',
          'Complete visa application',
          'Attend interview',
          'Receive O-1 visa'
        ],
        officialUrl: 'https://travel.state.gov/content/travel/en/us-visas/employment/temporary-worker-visas.html',
        eligibility: {
          requiresInterview: true,
          note: 'Must demonstrate sustained national or international acclaim'
        }
      }
    ]
  },
  {
    country: 'United Kingdom',
    flag: '🇬🇧',
    popularDestinations: ['London', 'Edinburgh', 'Manchester', 'Oxford', 'Cambridge', 'Liverpool'],
    visaTypes: [
      {
        type: 'Standard Visitor Visa',
        purpose: 'Tourism, Business, Medical Treatment, Visiting Family',
        processingTime: '3 weeks',
        validity: '6 months to 10 years (multiple entry)',
        stayDuration: 'Up to 6 months per visit',
        fee: 115,
        requirements: [
          'Valid passport',
          'Completed online application',
          'Biometric information (fingerprints and photo)',
          'Proof of accommodation (hotel bookings or invitation)',
          'Travel itinerary and return tickets',
          'Bank statements (last 6 months)',
          'Employment letter or business documents',
          'Purpose of visit letter',
          'Travel insurance',
          'Previous travel history',
          'Proof of ties to home country'
        ],
        applicationProcess: [
          'Complete online visa application',
          'Pay visa fee (£115 for 6 months)',
          'Book biometric appointment at VFS',
          'Attend appointment and submit documents',
          'Provide fingerprints and photograph',
          'Submit passport',
          'Wait for decision (3 weeks standard)',
          'Collect passport with visa vignette'
        ],
        officialUrl: 'https://www.gov.uk/standard-visitor-visa',
        eligibility: {
          minAge: 0,
          maxStay: 180,
          requiresInterview: false,
          commonRejectionReasons: [
            'Insufficient funds',
            'Unclear purpose of visit',
            'Missing documentation',
            'Previous immigration violations',
            'Lack of ties to home country'
          ]
        }
      },
      {
        type: 'Student Visa (Tier 4)',
        purpose: 'Academic Studies (Degree Level and Above)',
        processingTime: '3 weeks',
        validity: 'Course duration + 4-6 months',
        stayDuration: 'Full course length plus post-study period',
        fee: 363,
        requirements: [
          'CAS (Confirmation of Acceptance for Studies) from UK institution',
          'Valid passport',
          'Proof of English language proficiency (IELTS/TOEFL/PTE)',
          'Financial proof: Tuition + £1,334/month (London) or £1,023/month (outside London)',
          'Academic qualifications and transcripts',
          'TB test certificate (if from listed country)',
          'ATAS certificate (for certain science/engineering courses)',
          'Biometric information',
          'Immigration Health Surcharge payment',
          'Consent letter (if under 18)'
        ],
        applicationProcess: [
          'Receive CAS number from UK university',
          'Complete online visa application',
          'Pay visa fee (£363) and Immigration Health Surcharge (£470/year)',
          'Book biometric appointment',
          'Attend appointment and submit documents',
          'Provide biometrics',
          'Wait for decision (3 weeks)',
          'Collect BRP (Biometric Residence Permit) in UK within 10 days'
        ],
        officialUrl: 'https://www.gov.uk/student-visa',
        eligibility: {
          requiresInterview: false,
          note: 'Can work 20 hours/week during term, full-time during holidays'
        }
      },
      {
        type: 'Skilled Worker Visa (formerly Tier 2)',
        purpose: 'Skilled Employment',
        processingTime: '3 weeks (UK), 8 weeks (outside UK)',
        validity: 'Up to 5 years',
        stayDuration: 'Job duration + 14 days',
        fee: 625,
        requirements: [
          'Certificate of Sponsorship from licensed UK employer',
          'Valid passport',
          'Job offer in eligible occupation',
          'Minimum salary: £26,200 or occupation rate',
          'English language proficiency (B1 CEFR level)',
          'TB test certificate (if applicable)',
          'Criminal record certificate (if applicable)',
          'Financial maintenance funds (if required)',
          'Immigration Health Surcharge payment'
        ],
        applicationProcess: [
          'Receive job offer from licensed sponsor',
          'Get Certificate of Sponsorship (CoS)',
          'Apply online with CoS reference',
          'Pay visa fee (£625-£1,408)',
          'Pay Immigration Health Surcharge (£624/year)',
          'Provide biometrics',
          'Submit supporting documents',
          'Wait for decision',
          'Collect BRP in UK'
        ],
        officialUrl: 'https://www.gov.uk/skilled-worker-visa',
        eligibility: {
          requiresInterview: false,
          note: 'Can lead to Indefinite Leave to Remain after 5 years'
        }
      },
      {
        type: 'Graduate Visa',
        purpose: 'Post-Study Work',
        processingTime: '8 weeks',
        validity: '2 years (3 years for PhD)',
        stayDuration: '2-3 years',
        fee: 715,
        requirements: [
          'Completed degree at UK institution',
          'Valid Student visa or Tier 4 visa',
          'Current Biometric Residence Permit',
          'Degree from eligible UK higher education provider',
          'Valid passport',
          'Biometric information',
          'Immigration Health Surcharge payment'
        ],
        applicationProcess: [
          'Complete degree at UK university',
          'Apply online before current visa expires',
          'Pay application fee (£715)',
          'Pay Immigration Health Surcharge',
          'Submit supporting documents',
          'Provide biometrics if required',
          'Wait for decision (8 weeks)',
          'Receive new BRP'
        ],
        officialUrl: 'https://www.gov.uk/graduate-visa',
        eligibility: {
          requiresInterview: false,
          note: 'No sponsorship required, can work in any job, can switch to Skilled Worker visa'
        }
      },
      {
        type: 'Family Visa (Spouse/Partner)',
        purpose: 'Join or Remain with UK Partner',
        processingTime: '12 weeks',
        validity: '2.5 or 5 years',
        stayDuration: 'Per visa validity',
        fee: 1538,
        requirements: [
          'Partner is British citizen or settled in UK',
          'Relationship is genuine and subsisting',
          'Living together or intention to live together',
          'English language requirement (A1 CEFR)',
          'Financial requirement: £18,600 annual income (plus £3,800 for first child)',
          'Adequate accommodation',
          'Valid passport',
          'Marriage/civil partnership certificate',
          'Relationship evidence (photos, correspondence)',
          'TB test certificate'
        ],
        applicationProcess: [
          'Gather relationship and financial evidence',
          'Pass English language test',
          'Complete online application',
          'Pay visa fee (£1,538) and IHS',
          'Book biometric appointment',
          'Submit extensive documentation',
          'Attend appointment',
          'Wait for decision (12 weeks)',
          'Collect BRP in UK'
        ],
        officialUrl: 'https://www.gov.uk/uk-family-visa',
        eligibility: {
          requiresInterview: false,
          note: 'Can lead to settlement after 5 years'
        }
      },
      {
        type: 'Investor Visa (Tier 1)',
        purpose: 'Investment in UK',
        processingTime: '3 weeks',
        validity: '3 years 4 months',
        stayDuration: 'Per visa period',
        fee: 1621,
        requirements: [
          'At least £2 million to invest in UK',
          'Funds held in regulated financial institution',
          'Funds available for at least 2 years',
          'UK bank account',
          'Valid passport',
          'TB test certificate',
          'Criminal record certificate',
          'Investment plan'
        ],
        applicationProcess: [
          'Open UK bank account',
          'Prepare investment funds',
          'Complete online application',
          'Pay visa fee (£1,621)',
          'Submit financial documents',
          'Provide biometrics',
          'Make qualifying investments within 3 months',
          'Receive visa'
        ],
        officialUrl: 'https://www.gov.uk/tier-1-investor',
        eligibility: {
          note: 'Closed to new applicants from February 2022, existing holders can extend'
        }
      }
    ]
  },
  {
    country: 'Canada',
    flag: '🇨🇦',
    popularDestinations: ['Toronto', 'Vancouver', 'Montreal', 'Calgary', 'Ottawa', 'Banff'],
    visaTypes: [
      {
        type: 'Visitor Visa (Temporary Resident Visa - TRV)',
        purpose: 'Tourism, Business, Family Visit',
        processingTime: '2-4 weeks',
        validity: 'Up to 10 years (multiple entry)',
        stayDuration: 'Up to 6 months per visit',
        fee: 100,
        requirements: [
          'Valid passport',
          'Completed IMM 5257 form',
          'Digital photo (35mm x 45mm)',
          'Proof of financial support',
          'Travel itinerary',
          'Purpose of visit letter',
          'Employment/enrollment proof',
          'Family information form (IMM 5645)',
          'Biometrics (fingerprints and photo)',
          'Police certificates (if required)',
          'Medical exam (if required)',
          'Invitation letter (if visiting family)'
        ],
        applicationProcess: [
          'Create GCKey or Sign-In Partner account',
          'Complete online application (IMM 5257)',
          'Upload all supporting documents',
          'Pay application fee (CAD $100)',
          'Pay biometric fee (CAD $85)',
          'Submit application online',
          'Provide biometrics at VAC within 30 days',
          'Wait for processing decision',
          'Submit passport for visa stamping (if approved)',
          'Receive passport with visa'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada.html',
        eligibility: {
          minAge: 0,
          maxStay: 180,
          requiresInterview: false,
          commonRejectionReasons: [
            'Insufficient funds',
            'Lack of ties to home country',
            'Travel history concerns',
            'Purpose of visit unclear'
          ]
        }
      },
      {
        type: 'Study Permit',
        purpose: 'Academic Studies in Canada',
        processingTime: '4-12 weeks (varies by country)',
        validity: 'Course duration + 90 days',
        stayDuration: 'Full program length plus 90 days',
        fee: 150,
        requirements: [
          'Letter of acceptance from DLI (Designated Learning Institution)',
          'Valid passport',
          'Proof of financial support (CAD $10,000/year + tuition)',
          'Letter of explanation',
          'Police certificate',
          'Medical examination',
          'Quebec Acceptance Certificate (CAQ) - if studying in Quebec',
          'English/French language proficiency proof',
          'Academic transcripts and certificates',
          'GIC (Guaranteed Investment Certificate) - CAD $10,000',
          'Biometrics',
          'Digital photo'
        ],
        applicationProcess: [
          'Get accepted to DLI institution',
          'Gather financial documents',
          'Get medical exam (if required)',
          'Obtain police certificates',
          'Create online account',
          'Complete study permit application',
          'Upload all documents',
          'Pay fees (CAD $150 + biometrics $85)',
          'Submit biometrics',
          'Wait for approval',
          'Receive Port of Entry letter',
          'Get study permit at Canadian border upon arrival'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada.html',
        eligibility: {
          requiresInterview: false,
          note: 'Can work 20 hours/week off-campus during studies, full-time during breaks'
        }
      },
      {
        type: 'Post-Graduation Work Permit (PGWP)',
        purpose: 'Post-Study Work in Canada',
        processingTime: '80-180 days',
        validity: '8 months to 3 years (based on study duration)',
        stayDuration: 'As per work permit validity',
        fee: 255,
        requirements: [
          'Completed program at eligible DLI',
          'Program was at least 8 months long',
          'Valid study permit when applying',
          'Apply within 180 days of program completion',
          'Transcript or degree/diploma',
          'Completion letter from institution',
          'Valid passport',
          'Digital photo'
        ],
        applicationProcess: [
          'Complete eligible program',
          'Gather completion documents',
          'Apply online within 180 days',
          'Pay work permit fee (CAD $255)',
          'Submit supporting documents',
          'Wait for processing',
          'Receive work permit',
          'Can work for any employer in Canada'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/study-canada/work/after-graduation.html',
        eligibility: {
          note: 'One-time opportunity, cannot extend, counts toward Express Entry points'
        }
      },
      {
        type: 'Express Entry (Federal Skilled Worker)',
        purpose: 'Permanent Residence - Skilled Workers',
        processingTime: '6 months',
        validity: 'Permanent Residence',
        stayDuration: 'Permanent',
        fee: 1325,
        requirements: [
          'Minimum 1 year skilled work experience (NOC 0, A, or B)',
          'Language test results (IELTS/CELPIP/TEF)',
          'Educational Credential Assessment (ECA)',
          'Proof of funds (CAD $13,310 for single)',
          'CRS score of 470+ (varies by draw)',
          'Valid passport',
          'Police certificates',
          'Medical examination',
          'Job offer (optional but adds points)',
          'Provincial nomination (optional, adds 600 points)'
        ],
        applicationProcess: [
          'Take language test (IELTS/CELPIP)',
          'Get ECA for foreign education',
          'Calculate CRS score',
          'Create Express Entry profile',
          'Enter pool',
          'Receive Invitation to Apply (ITA)',
          'Gather all documents within 60 days',
          'Submit complete PR application',
          'Provide biometrics',
          'Complete medical exam',
          'Wait for approval (6 months)',
          'Receive Confirmation of Permanent Residence (COPR)',
          'Land in Canada as Permanent Resident'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry.html',
        eligibility: {
          note: 'Points-based system, minimum 67/100 points to enter pool'
        }
      },
      {
        type: 'Provincial Nominee Program (PNP)',
        purpose: 'Permanent Residence through Province',
        processingTime: '3-6 months (provincial) + 6 months (federal)',
        validity: 'Permanent Residence',
        stayDuration: 'Permanent',
        fee: 1325,
        requirements: [
          'Provincial nomination certificate',
          'Meet specific provincial criteria',
          'Work experience in demanded occupation',
          'Language proficiency',
          'Educational credentials',
          'Job offer from province (some streams)',
          'Intention to live in nominating province',
          'Medical examination',
          'Police certificates',
          'Proof of funds'
        ],
        applicationProcess: [
          'Choose province and immigration stream',
          'Submit Expression of Interest to province',
          'Receive provincial nomination',
          'Apply for PR to IRCC',
          'Submit complete application',
          'Provide biometrics and medicals',
          'Wait for federal processing',
          'Receive COPR',
          'Land as PR'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees.html',
        eligibility: {
          note: 'Each province has different requirements and streams'
        }
      },
      {
        type: 'Temporary Foreign Worker Program (LMIA)',
        purpose: 'Work Permit with Job Offer',
        processingTime: '2-6 months',
        validity: 'Up to 2 years',
        stayDuration: 'Job duration',
        fee: 155,
        requirements: [
          'Valid job offer from Canadian employer',
          'Positive LMIA from employer',
          'Valid passport',
          'Work permit application',
          'Proof of qualifications',
          'Medical exam (if required)',
          'Police certificate (if required)',
          'Biometrics'
        ],
        applicationProcess: [
          'Employer obtains positive LMIA',
          'Receive job offer and LMIA copy',
          'Apply for work permit online',
          'Pay processing fee (CAD $155)',
          'Provide biometrics',
          'Submit supporting documents',
          'Wait for approval',
          'Receive work permit'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/permit/temporary.html',
        eligibility: {
          note: 'LMIA proves no Canadian worker available for the job'
        }
      },
      {
        type: 'Working Holiday Visa (IEC)',
        purpose: 'Work and Travel (Youth)',
        processingTime: '8 weeks',
        validity: '12-24 months',
        stayDuration: '1-2 years',
        fee: 156,
        requirements: [
          'Age 18-35 (varies by country)',
          'Citizen of IEC partner country',
          'Valid passport',
          'Proof of funds (CAD $2,500)',
          'Medical insurance',
          'Clean criminal record',
          'Letter of explanation',
          'Invitation to apply from pool'
        ],
        applicationProcess: [
          'Create IEC profile',
          'Enter pool for your country',
          'Receive invitation to apply',
          'Complete work permit application',
          'Pay fees (CAD $156 + $100)',
          'Provide biometrics',
          'Submit documents',
          'Receive Port of Entry letter',
          'Get work permit at border'
        ],
        officialUrl: 'https://www.canada.ca/en/immigration-refugees-citizenship/services/work-canada/iec.html',
        eligibility: {
          note: 'Limited spots, varies by country bilateral agreement'
        }
      }
    ]
  },
  {
    country: 'Australia',
    flag: '🇦🇺',
    popularDestinations: ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Gold Coast', 'Adelaide'],
    visaTypes: [
      {
        type: 'Visitor Visa (subclass 600)',
        purpose: 'Tourism, Business Visitor, Visiting Family',
        processingTime: '15-30 days',
        validity: 'Up to 12 months',
        stayDuration: '3, 6, or 12 months',
        fee: 190,
        requirements: [
          'Valid passport',
          'ImmiAccount registration',
          'Recent passport photo',
          'Financial evidence (bank statements)',
          'Health insurance',
          'Character documents (police certificates)',
          'Purpose of visit evidence',
          'Employment/study proof',
          'Travel itinerary',
          'Invitation letter (if visiting family)',
          'Relationship evidence (if applicable)',
          'Health examination (if required)'
        ],
        applicationProcess: [
          'Create ImmiAccount online',
          'Complete Form 1419 application',
          'Upload all required documents',
          'Pay visa fee (AUD $190)',
          'Submit application',
          'Complete health examination (if requested)',
          'Provide biometrics (if required)',
          'Wait for decision (15-30 days)',
          'Receive visa grant notification via email',
          'Check VEVO for visa details'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/visitor-600',
        eligibility: {
          minAge: 0,
          maxStay: 365,
          requiresInterview: false,
          commonRejectionReasons: [
            'Insufficient funds',
            'Health concerns',
            'Character issues',
            'Previous visa breaches'
          ]
        }
      },
      {
        type: 'Student Visa (subclass 500)',
        purpose: 'Full-time Study',
        processingTime: '1-4 months',
        validity: 'Course duration + 1-2 months',
        stayDuration: 'Full course length',
        fee: 650,
        requirements: [
          'Confirmation of Enrolment (CoE) from Australian institution',
          'Valid passport',
          'Genuine Temporary Entrant (GTE) statement',
          'Financial capacity proof (AUD $24,505/year + tuition)',
          'English language test (IELTS/PTE/TOEFL)',
          'Health insurance (OSHC - Overseas Student Health Cover)',
          'Health examination',
          'Police clearance certificates',
          'Academic transcripts and certificates',
          'Statement of Purpose',
          'Parental consent (if under 18)'
        ],
        applicationProcess: [
          'Receive offer and CoE from institution',
          'Purchase OSHC',
          'Create ImmiAccount',
          'Complete online application (Form 157A)',
          'Write comprehensive GTE statement',
          'Upload all documents',
          'Pay visa fee (AUD $650)',
          'Complete health examination',
          'Provide biometrics',
          'Wait for visa decision',
          'Receive visa grant'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500',
        eligibility: {
          requiresInterview: false,
          note: 'Can work 48 hours per fortnight during term, unlimited during breaks'
        }
      },
      {
        type: 'Temporary Graduate Visa (subclass 485)',
        purpose: 'Post-Study Work',
        processingTime: '4-5 months',
        validity: '18 months to 4 years',
        stayDuration: 'Varies by qualification',
        fee: 1730,
        requirements: [
          'Australian qualification (at least 2 years)',
          'Age under 50',
          'English language proficiency',
          'Completed studies in last 6 months',
          'Current student visa',
          'Health insurance',
          'Health examination',
          'Police certificates',
          'Skills assessment (for Graduate Work stream)'
        ],
        applicationProcess: [
          'Complete eligible Australian qualification',
          'Apply within 6 months of completion',
          'Take English test',
          'Complete health checks',
          'Gather police certificates',
          'Create ImmiAccount',
          'Submit online application',
          'Pay fee (AUD $1,730)',
          'Wait for processing',
          'Receive visa grant'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/temporary-graduate-485',
        eligibility: {
          note: 'Two streams: Graduate Work (18 months) and Post-Study Work (2-4 years)'
        }
      },
      {
        type: 'Skilled Independent Visa (subclass 189)',
        purpose: 'Permanent Residence - Skilled Workers',
        processingTime: '6-9 months',
        validity: 'Permanent',
        stayDuration: 'Permanent',
        fee: 4240,
        requirements: [
          'Occupation on skilled occupation list',
          'Skills assessment for occupation',
          'Age under 45',
          'Minimum 65 points',
          'English language proficiency (IELTS/PTE)',
          'Expression of Interest submitted',
          'Invitation to apply',
          'Health examination',
          'Police certificates',
          'No outstanding debts to Australian government'
        ],
        applicationProcess: [
          'Check occupation on MLTSSL',
          'Obtain skills assessment',
          'Take English language test',
          'Submit Expression of Interest (EOI)',
          'Calculate points (minimum 65)',
          'Wait for invitation to apply',
          'Lodge visa application within 60 days',
          'Pay visa fee (AUD $4,240)',
          'Complete health checks',
          'Obtain police certificates',
          'Wait for decision',
          'Receive visa grant'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-independent-189',
        eligibility: {
          note: 'Points test required, invitation rounds held regularly'
        }
      },
      {
        type: 'Skilled Nominated Visa (subclass 190)',
        purpose: 'PR with State Nomination',
        processingTime: '6-9 months',
        validity: 'Permanent',
        stayDuration: 'Permanent',
        fee: 4240,
        requirements: [
          'State/territory nomination',
          'Occupation on state list',
          'Skills assessment',
          'Age under 45',
          'Minimum 65 points (+ 5 from nomination)',
          'English proficiency',
          'EOI submitted',
          'Commit to live in nominating state',
          'Health and character requirements'
        ],
        applicationProcess: [
          'Check state occupation lists',
          'Apply for state nomination',
          'Receive state nomination (+5 points)',
          'Submit EOI',
          'Receive invitation',
          'Lodge visa application',
          'Pay fees',
          'Complete medicals and police checks',
          'Wait for decision',
          'Receive PR visa'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/skilled-nominated-190',
        eligibility: {
          note: 'Must live in nominating state for 2 years'
        }
      },
      {
        type: 'Temporary Skill Shortage Visa (subclass 482)',
        purpose: 'Employer-Sponsored Work',
        processingTime: '1-4 months',
        validity: '2-4 years',
        stayDuration: 'Per sponsorship',
        fee: 1290,
        requirements: [
          'Job offer from approved sponsor',
          'Occupation on skill shortage list',
          'Relevant skills and experience',
          'English language proficiency',
          'Skills assessment (for some occupations)',
          'Labor Market Testing by employer',
          'Age under 45 (for pathway to PR)',
          'Health examination',
          'Police certificates'
        ],
        applicationProcess: [
          'Employer becomes approved sponsor',
          'Employer nominates position',
          'Receive job offer',
          'Lodge visa application',
          'Pay visa fee (AUD $1,290-$2,690)',
          'Provide evidence of skills',
          'Complete health checks',
          'Obtain police certificates',
          'Wait for approval',
          'Receive visa grant'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/temporary-skill-shortage-482',
        eligibility: {
          note: 'Can lead to PR after 3 years (Medium-term stream)'
        }
      },
      {
        type: 'Working Holiday Visa (subclass 417)',
        purpose: 'Holiday and Work (Youth)',
        processingTime: '14-28 days',
        validity: '12 months',
        stayDuration: '1 year (extendable)',
        fee: 510,
        requirements: [
          'Age 18-30 (35 for some countries)',
          'Citizen of eligible country',
          'Valid passport',
          'Sufficient funds (AUD $5,000)',
          'Return ticket or funds',
          'Health insurance',
          'Meet health requirements',
          'Meet character requirements',
          'No dependent children'
        ],
        applicationProcess: [
          'Check eligibility by nationality',
          'Create ImmiAccount',
          'Complete online application',
          'Pay visa fee (AUD $510)',
          'Provide health examination (if required)',
          'Submit biometrics',
          'Wait for decision (14-28 days)',
          'Receive visa grant',
          'Enter Australia within 12 months'
        ],
        officialUrl: 'https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/work-holiday-417',
        eligibility: {
          note: 'Can extend to 2nd and 3rd year with specified work'
        }
      }
    ]
  },
  {
    country: 'Germany',
    flag: '🇩🇪',
    popularDestinations: ['Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'Cologne'],
    visaTypes: [
      {
        type: 'Schengen Tourist Visa (Germany)',
        purpose: 'Tourism, Business, Family Visit',
        processingTime: '15 days',
        validity: 'Up to 5 years',
        stayDuration: '90 days within 180 days',
        fee: 80,
        requirements: [
          'Valid passport (3 months beyond stay)',
          'Completed visa application form',
          'Two recent passport photos (35x45mm)',
          'Travel health insurance (€30,000 coverage)',
          'Flight reservation',
          'Hotel bookings or invitation letter',
          'Bank statements (last 3 months)',
          'Employment certificate or proof of occupation',
          'Cover letter explaining trip purpose'
        ],
        applicationProcess: [
          'Complete visa application form',
          'Book appointment at German embassy/consulate',
          'Gather all required documents',
          'Purchase travel insurance',
          'Pay visa fee (€80)',
          'Attend appointment with biometrics',
          'Wait for processing (15 days)',
          'Collect passport with visa'
        ],
        officialUrl: 'https://www.germany.info/us-en/service/visa',
        eligibility: {
          maxStay: 90,
          requiresInterview: true
        }
      }
    ]
  },
  {
    country: 'France',
    flag: '🇫🇷',
    popularDestinations: ['Paris', 'Nice', 'Lyon', 'Marseille', 'Bordeaux'],
    visaTypes: [
      {
        type: 'Schengen Tourist Visa (France)',
        purpose: 'Tourism, Business, Family Visit',
        processingTime: '15-30 days',
        validity: 'Up to 5 years',
        stayDuration: '90 days within 180 days',
        fee: 80,
        requirements: [
          'Valid passport (3 months beyond stay)',
          'Completed France-Visas application',
          'Two passport-sized photos (35x45mm)',
          'Travel insurance (€30,000 minimum)',
          'Flight reservation round-trip',
          'Hotel reservations or invitation letter',
          'Bank statements (last 3 months)',
          'Proof of employment or studies',
          'Cover letter in French or English'
        ],
        applicationProcess: [
          'Create account on France-Visas website',
          'Complete online application',
          'Print application summary',
          'Book appointment at VFS/consulate',
          'Pay visa fee (€80)',
          'Attend appointment with documents',
          'Provide biometrics',
          'Track application online',
          'Collect passport'
        ],
        officialUrl: 'https://france-visas.gouv.fr/en',
        eligibility: {
          maxStay: 90,
          requiresInterview: false
        }
      }
    ]
  },
  {
    country: 'New Zealand',
    flag: '🇳🇿',
    popularDestinations: ['Auckland', 'Wellington', 'Queenstown', 'Rotorua'],
    visaTypes: [
      {
        type: 'Visitor Visa',
        purpose: 'Tourism, Business, Family Visit',
        processingTime: '20-25 days',
        validity: 'Up to 9 months',
        stayDuration: 'Up to 9 months',
        fee: 246,
        requirements: [
          'Valid passport',
          'Completed online visa application',
          'Recent passport photo',
          'Evidence of funds (NZD $1,000/month)',
          'Return flight ticket or reservation',
          'Travel itinerary',
          'Proof of accommodation',
          'Character certificate (if required)',
          'Medical certificate (if required)',
          'Travel insurance recommended'
        ],
        applicationProcess: [
          'Create RealMe account',
          'Complete online visa application',
          'Upload all supporting documents',
          'Pay visa fee (NZD $246)',
          'Submit application online',
          'Wait for processing (20-25 days)',
          'Receive visa decision via email',
          'Print visa approval (eVisa)'
        ],
        officialUrl: 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/visitor-visa',
        eligibility: {
          maxStay: 270,
          requiresInterview: false
        }
      }
    ]
  }
];

export default comprehensiveVisaData;
