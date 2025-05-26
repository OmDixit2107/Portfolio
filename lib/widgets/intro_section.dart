import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IntroSection extends StatelessWidget {
  // final String? profileImagePath; // Removed
  const IntroSection({Key? key /*, this.profileImagePath*/})
      : super(key: key); // Removed

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image (if provided) - REMOVED FROM HERE
          // if (profileImagePath != null)
          //   Center(
          //     child: ClipOval(
          //       child: Image.asset(
          //         profileImagePath!,
          //         height: 120,
          //         width: 120,
          //         fit: BoxFit.cover,
          //       ),
          //     ).animate().scaleXY(begin: 0.5, duration: 800.ms).fadeIn(),
          //   ),
          // if (profileImagePath != null) const SizedBox(height: 20),

          // Greeting
          AutoSizeText(
            "Hello! 👋",
            style: GoogleFonts.inter(
              fontSize: 24,
              color: Colors.white.withOpacity(0.95),
              fontWeight: FontWeight.w300,
            ),
            maxFontSize: 24,
            minFontSize: 16,
          ).animate().slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 10),

          // Name
          AutoSizeText(
            "I'm Om Dixit",
            style: GoogleFonts.exo(
              fontSize: 42,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
            maxFontSize: 42,
            minFontSize: 28,
            maxLines: 2,
          ).animate(delay: 200.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 15),

          // Roles
          AutoSizeText(
            "Competitive Programmer",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFF64FFDA), // Bright cyan for dark theme
              fontWeight: FontWeight.w600,
            ),
            maxFontSize: 20,
            minFontSize: 14,
          ).animate(delay: 400.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 5),

          AutoSizeText(
            "& Full Stack Mobile  Developer",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFF82B1FF), // Bright blue for dark theme
              fontWeight: FontWeight.w600,
            ),
            maxFontSize: 20,
            minFontSize: 14,
          ).animate(delay: 600.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 25),

          // Description
          AutoSizeText(
            "I solve complex algorithms and build innovative applications. "
            "Passionate about data structures, competitive programming, and creating scalable solutions.",
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
            maxFontSize: 16,
            minFontSize: 12,
            maxLines: 4,
          ).animate(delay: 800.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 30),

          // Stats Row
          Row(
            children: [
              _buildStat("1000+", "Problems Solved"),
              const SizedBox(width: 30),
              _buildStat("1540", "CF Rating"),
            ],
          ).animate(delay: 1000.ms).slideY(begin: 1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 30),

          // CTA Buttons
          Row(
            children: [
              _buildButton(
                "View Portfolio",
                Colors.white,
                Colors.black,
                () {},
              ),
              const SizedBox(width: 15),
              _buildButton(
                "Contact Me",
                Colors.transparent,
                Colors.white,
                () {},
                border: true,
              ),
            ],
          ).animate(delay: 1200.ms).slideY(begin: 1, duration: 800.ms).fadeIn(),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          number,
          style: GoogleFonts.exo(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxFontSize: 24,
          minFontSize: 18,
        ),
        AutoSizeText(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w400,
          ),
          maxFontSize: 12,
          minFontSize: 10,
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed, {
    bool border = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: border ? Border.all(color: Colors.white, width: 1.5) : null,
        ),
        child: AutoSizeText(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
          maxFontSize: 14,
          minFontSize: 12,
        ),
      ),
    );
  }
}
