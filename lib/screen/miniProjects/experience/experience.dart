import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';
import '../../../models/experience_model.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      body: ListView(
        padding:
            const EdgeInsets.all(8.0), // Added some padding to the ListView
        children: [
          const SizedBox(height: 20), // Top spacing
          Center(
            child: Icon(
              Icons
                  .work_history_outlined, // Changed icon for better semantics, was badge_outlined
              size: 80, // Slightly reduced size
              color: Colors.white.withOpacity(0.8), // Light icon color
            ),
          ),
          const SizedBox(height: 30), // Spacing after icon
          ...List.generate(jobExperiences.length, (index) {
            JobExperience experience = jobExperiences[index];
            return Card(
              // Wrapped ExpansionTile in a Card for better visual separation
              color: const Color(0xFF1E1E1E), // Dark card background
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ExpansionTile(
                collapsedIconColor: Colors.white70,
                iconColor: Colors.white,
                tilePadding: const EdgeInsets.all(16.0),
                childrenPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Container(
                  // Accent color line
                  width: 3, // Slightly thicker
                  height: double.infinity, // Takes full height of the tile
                  color: experience.color,
                ),
                title: Text(
                  experience.title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Light text
                    fontSize: 17, // Adjusted size
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    '${experience.company}\n${experience.startDate} - ${experience.endDate} | ${experience.location}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.7), // Lighter grey text
                      height: 1.4, // Adjusted line height
                    ),
                  ),
                ),
                children: experience.bulletPoints.map((bulletPoint) {
                  return ListTile(
                    visualDensity: VisualDensity.compact,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 8.0),
                          child: Icon(Icons.circle,
                              size: 8,
                              color: Colors.white54), // Bullet point icon
                        ),
                        Expanded(
                          child: Text(
                            bulletPoint,
                            style: GoogleFonts.inter(
                              fontSize: 13, // Adjusted size
                              color:
                                  Colors.white.withOpacity(0.85), // Light text
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          })
        ],
      ),
    );
  }
}
