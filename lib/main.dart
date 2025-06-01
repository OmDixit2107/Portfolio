import 'package:om_dixit_portfolio/providers/current_state.dart';
import 'package:om_dixit_portfolio/providers/theme_provider.dart';
import 'package:om_dixit_portfolio/screen/homescreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CurrentState()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Om Dixit - Portfolio',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            home: const HomePage(),
          );
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      textTheme: _buildTextTheme(Colors.black87),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      cardTheme: _buildCardTheme(Colors.white, Colors.grey.shade200),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFF121212),
      canvasColor: const Color(0xFF1E1E1E),
      textTheme: _buildTextTheme(Colors.white),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      cardTheme:
          _buildCardTheme(const Color(0xFF1E1E1E), const Color(0xFF2A2A2A)),
    );
  }

  TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      // Display styles - for large headlines
      displayLarge: GoogleFonts.exo(
        fontSize: 57,
        fontWeight: FontWeight.w800,
        color: textColor,
        height: 1.12,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.exo(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.16,
        letterSpacing: 0,
      ),
      displaySmall: GoogleFonts.exo(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.22,
        letterSpacing: 0,
      ),

      // Headline styles - for section headers
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.25,
        letterSpacing: 0,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.29,
        letterSpacing: 0,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.33,
        letterSpacing: 0,
      ),

      // Title styles - for card titles and important text
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.27,
        letterSpacing: 0,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.50,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.43,
        letterSpacing: 0.1,
      ),

      // Body styles - for main content
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.75,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.71,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.7),
        height: 1.67,
        letterSpacing: 0.4,
      ),

      // Label styles - for buttons and captions
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.33,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: textColor,
        height: 1.45,
        letterSpacing: 0.5,
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  CardThemeData _buildCardTheme(Color backgroundColor, Color shadowColor) {
    return CardThemeData(
      elevation: 4,
      shadowColor: shadowColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: backgroundColor,
      margin: const EdgeInsets.all(8),
    );
  }
}
