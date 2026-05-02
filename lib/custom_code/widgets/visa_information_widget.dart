// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class VisaInformationWidget extends StatefulWidget {
  const VisaInformationWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _VisaInformationWidgetState createState() => _VisaInformationWidgetState();
}

class _VisaInformationWidgetState extends State<VisaInformationWidget> {
  String? selectedCountry;

  final Map<String, List<Map<String, String>>> visaData = {
    'USA 🇺🇸': [
      {
        'name': 'B1/B2 Tourist/Business Visa',
        'fee': '\$185',
        'processing': '2-4 weeks',
        'validity': '10 years',
      },
      {
        'name': 'F-1 Student Visa',
        'fee': '\$185',
        'processing': '3-5 weeks',
        'validity': 'Duration of studies',
      },
      {
        'name': 'H-1B Work Visa',
        'fee': '\$190',
        'processing': '2-3 months',
        'validity': '3 years (renewable)',
      },
    ],
    'UK 🇬🇧': [
      {
        'name': 'Standard Visitor Visa',
        'fee': '£115',
        'processing': '3 weeks',
        'validity': '6 months',
      },
      {
        'name': 'Student Visa (Tier 4)',
        'fee': '£490',
        'processing': '3 weeks',
        'validity': 'Duration + 4 months',
      },
      {
        'name': 'Skilled Worker Visa',
        'fee': '£719',
        'processing': '3 weeks',
        'validity': 'Up to 5 years',
      },
    ],
    'Canada 🇨🇦': [
      {
        'name': 'Visitor Visa (TRV)',
        'fee': 'CAD \$100',
        'processing': '2-4 weeks',
        'validity': 'Up to 10 years',
      },
      {
        'name': 'Study Permit',
        'fee': 'CAD \$150',
        'processing': '4-6 weeks',
        'validity': 'Duration of studies',
      },
      {
        'name': 'Express Entry (PR)',
        'fee': 'CAD \$1,365',
        'processing': '6 months',
        'validity': 'Permanent',
      },
    ],
    'Australia 🇦🇺': [
      {
        'name': 'Visitor Visa (600)',
        'fee': 'AUD \$190',
        'processing': '1-4 weeks',
        'validity': '3-12 months',
      },
      {
        'name': 'Student Visa (500)',
        'fee': 'AUD \$710',
        'processing': '4-6 weeks',
        'validity': 'Duration of course',
      },
      {
        'name': 'Skilled Independent (189)',
        'fee': 'AUD \$4,640',
        'processing': '6-9 months',
        'validity': 'Permanent',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0066CC), Color(0xFF0052A3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    '🌍 Visa Information',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0066CC),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Comprehensive visa requirements for 4 countries',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Country Cards
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: visaData.keys.length,
                itemBuilder: (context, index) {
                  String country = visaData.keys.elementAt(index);
                  bool isExpanded = selectedCountry == country;

                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCountry = isExpanded ? null : country;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      country,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0066CC),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${visaData[country]!.length} visa types',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Color(0xFF0066CC),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Visa Details
                        if (isExpanded)
                          ...visaData[country]!.map(
                            (visa) => Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(12),
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF0066CC),
                                    width: 4,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    visa['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0066CC),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _infoBox('Fee', visa['fee']!),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: _infoBox(
                                            'Processing', visa['processing']!),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  _infoBox('Validity', visa['validity']!),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String label, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
