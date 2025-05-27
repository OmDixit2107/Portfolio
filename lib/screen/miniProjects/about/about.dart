import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String profilePicPath = "assets/images/your_profile_pic.jpeg";

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profilePicPath),
                    backgroundColor: Colors.grey[800],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Hi, I am Om Dixit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.exo(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Competitive Programmer & Mobile Developer",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64FFDA)),
                      ),
                    ],
                  ),
                ),

                // Professional Summary
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF64FFDA).withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: const Color(0xFF64FFDA),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Professional Summary",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Passionate Computer Science student at IIT Vadodara with a stellar 9.34 CGPA, specializing in competitive programming and mobile development. Currently serving as a Mobile Developer Intern at FullFocus, where I architect complete mobile and backend systems using Flutter, PHP, and Laravel.\n\nWith expertise in data structures, algorithms, and modern development frameworks, I've solved 1000+ DSA problems and excel in building scalable, real-time applications. My experience spans from developing real estate platforms with WebSocket integration to optimizing calendar-based features that improved task completion rates by 25%.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 600)),

                // Key Highlights
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF82B1FF).withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_outline,
                            color: const Color(0xFF82B1FF),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Key Highlights",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildHighlightItem(
                          "🎓", "9.34 CGPA at IIT Vadodara (CSE)"),
                      _buildHighlightItem(
                          "💼", "Mobile Developer Intern at FullFocus"),
                      _buildHighlightItem("🏆", "1000+ DSA Problems Solved"),
                      _buildHighlightItem(
                          "🚀", "Expert in Flutter & Spring Boot"),
                      _buildHighlightItem(
                          "⚡", "30% Performance Improvement in Apps"),
                      _buildHighlightItem(
                          "🔧", "Full-Stack Development Experience"),
                    ],
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)),

                // Technical Expertise
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF4FC3F7).withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.code,
                            color: const Color(0xFF4FC3F7),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Technical Expertise",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildTechChip("Flutter", const Color(0xFF02569B)),
                          _buildTechChip(
                              "Spring Boot", const Color(0xFF6DB33F)),
                          _buildTechChip("C++", const Color(0xFF00599C)),
                          _buildTechChip("Java", const Color(0xFFED8B00)),
                          _buildTechChip("MySQL", const Color(0xFF4479A1)),
                          _buildTechChip("Supabase", const Color(0xFF3ECF8E)),
                          _buildTechChip("WebSocket", const Color(0xFF010101)),
                          _buildTechChip("Provider", const Color(0xFFFF9800)),
                        ],
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 1000))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String tech, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        tech,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
