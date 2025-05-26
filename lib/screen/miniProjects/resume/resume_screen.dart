import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar is handled by ScreenWrapper if this is not a main screen
      // If you want a specific AppBar here, you can add it.
      body: SfPdfViewer.asset(
        'assets/files/resume.pdf', // Make sure your PDF is at this path
        // You can customize the viewer with various parameters if needed
        // e.g., canShowScrollHead: false,
        // e.g., canShowScrollStatus: false,
      ),
    );
  }
}
