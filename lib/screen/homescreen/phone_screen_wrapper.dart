import 'package:om_dixit_portfolio/screen/homescreen/phone_home_page.dart';
// import 'package:device_frame/device_frame.dart'; // No longer directly used here for DeviceInfo properties
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../providers/current_state.dart';

class ScreenWrapper extends StatefulWidget {
  final Widget childG;
  const ScreenWrapper({super.key, required this.childG});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _headerController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _headerFadeAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _headerController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _headerFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOut,
    ));

    // Start animations
    _slideController.forward();
    Future.delayed(const Duration(milliseconds: 100), () {
      _headerController.forward();
    });
  }

  @override
  void didUpdateWidget(ScreenWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.childG != widget.childG) {
      // Restart animations when screen changes
      _slideController.reset();
      _headerController.reset();
      _slideController.forward();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _headerController.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // CurrentState instance = Provider.of<CurrentState>(context, listen: false); // instance is not used directly here anymore for DeviceFrame
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Consumer<CurrentState>(builder: (context, state, __) {
              if (!state.isMainScreen) {
                return FadeTransition(
                  opacity: _headerFadeAnimation,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              state.title ?? "",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _buildCloseButton(state),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox
                  .shrink(); // Return empty container if it is the main screen, as buttons are external now
            }),
            Expanded(
              child: Container(
                child: widget.childG,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(CurrentState state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            // Add haptic feedback
            // HapticFeedback.lightImpact();

            // Animate out before changing screen
            _slideController.reverse().then((_) {
              if (mounted) {
                state.changePhoneScreen(
                  const PhoneHomeScreen(),
                  true,
                );
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ).animate().scale(
          duration: 200.ms,
          curve: Curves.elasticOut,
        );
  }
}
