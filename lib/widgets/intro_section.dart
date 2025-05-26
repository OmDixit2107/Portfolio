import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'dart:math';

class IntroSection extends StatefulWidget {
  const IntroSection({Key? key}) : super(key: key);

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection>
    with TickerProviderStateMixin {
  late AnimationController _typewriterController;
  late AnimationController _floatingController;
  late Animation<int> _typewriterAnimation;
  late Animation<double> _floatingAnimation;

  final String _fullDescription =
      "I solve complex algorithms and build innovative applications. "
      "Passionate about data structures, competitive programming, and creating scalable solutions.";

  @override
  void initState() {
    super.initState();

    // Typewriter animation
    _typewriterController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _typewriterAnimation = IntTween(
      begin: 0,
      end: _fullDescription.length,
    ).animate(CurvedAnimation(
      parent: _typewriterController,
      curve: Curves.easeInOut,
    ));

    // Floating animation for social icons
    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    // Start animations with delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      _typewriterController.forward();
      _floatingController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  Future<void> _launchResumeUrl() async {
    final Uri url = Uri.parse(resumeLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Portfolio Contact'});
    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450, maxHeight: 700),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image with enhanced effects
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF64FFDA),
                    const Color(0xFF82B1FF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64FFDA).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/your_profile_pic.jpeg',
                    width: 112,
                    height: 112,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to a beautiful avatar if image not found
                      return Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF64FFDA),
                              const Color(0xFF82B1FF),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
              .animate()
              .scale(
                  begin: const Offset(0.5, 0.5),
                  duration: 800.ms,
                  curve: Curves.elasticOut)
              .fadeIn()
              .then()
              .shimmer(duration: 3000.ms, color: Colors.white.withOpacity(0.3)),

          const SizedBox(height: 20),

          // Greeting with particle effect
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

          // Name with enhanced animation
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
          )
              .animate(delay: 200.ms)
              .slideX(begin: -1, duration: 800.ms)
              .fadeIn()
              .then()
              .shimmer(duration: 2000.ms, color: const Color(0xFF64FFDA)),

          const SizedBox(height: 15),

          // Roles with gradient text effect
          AutoSizeText(
            "Competitive Programmer",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFF64FFDA),
              fontWeight: FontWeight.w600,
            ),
            maxFontSize: 20,
            minFontSize: 14,
          ).animate(delay: 400.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 5),

          AutoSizeText(
            "& Full Stack Mobile Developer",
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFF82B1FF),
              fontWeight: FontWeight.w600,
            ),
            maxFontSize: 20,
            minFontSize: 14,
          ).animate(delay: 600.ms).slideX(begin: -1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 25),

          // Typewriter description
          Container(
            height: 80,
            child: AnimatedBuilder(
              animation: _typewriterAnimation,
              builder: (context, child) {
                String currentText =
                    _fullDescription.substring(0, _typewriterAnimation.value);
                return AutoSizeText(
                  "$currentText${_typewriterAnimation.value < _fullDescription.length ? '|' : ''}",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.85),
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                  maxFontSize: 16,
                  minFontSize: 12,
                  maxLines: 4,
                );
              },
            ),
          ).animate(delay: 800.ms).fadeIn(),

          const SizedBox(height: 30),

          // Enhanced stats with glow effect
          Row(
            children: [
              _buildEnhancedStat(
                  "1000+", "DSA Problems Solved", const Color(0xFF64FFDA)),
              const SizedBox(width: 30),
              _buildEnhancedStat("Proficient", "Flutter & Spring Boot",
                  const Color(0xFF82B1FF)),
            ],
          ).animate(delay: 1000.ms).slideY(begin: 1, duration: 800.ms).fadeIn(),

          const SizedBox(height: 30),

          // Enhanced CTA Buttons
          Row(
            children: [
              _buildEnhancedButton(
                "View Resume",
                Colors.white,
                Colors.black,
                _launchResumeUrl,
                icon: Icons.description,
              ),
              const SizedBox(width: 15),
              _buildEnhancedButton(
                "Contact Me",
                Colors.transparent,
                Colors.white,
                _launchEmail,
                border: true,
                icon: Icons.email,
              ),
            ],
          ).animate(delay: 1200.ms).slideY(begin: 1, duration: 800.ms).fadeIn(),
        ],
      ),
    );
  }

  Widget _buildEnhancedStat(String number, String label, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.3)),
        color: accentColor.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            number,
            style: GoogleFonts.exo(
              fontSize: 24,
              color: accentColor,
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
      ),
    );
  }

  Widget _buildEnhancedButton(
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed, {
    bool border = false,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: border ? Border.all(color: Colors.white, width: 1.5) : null,
          boxShadow: !border
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: 16),
              const SizedBox(width: 8),
            ],
            AutoSizeText(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              maxFontSize: 14,
              minFontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
