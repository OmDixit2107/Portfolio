import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../consts/data.dart';
import '../../providers/current_state.dart';
import '../../models/app_model.dart';

class PhoneHomeScreen extends StatefulWidget {
  const PhoneHomeScreen({super.key});

  @override
  State<PhoneHomeScreen> createState() => _PhoneHomeScreenState();
}

class _PhoneHomeScreenState extends State<PhoneHomeScreen>
    with TickerProviderStateMixin {
  List<AnimationController> _pressControllers = [];
  List<AnimationController> _pulseControllers = [];

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers for each app
    for (int i = 0; i < apps.length; i++) {
      _pressControllers.add(AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this,
      ));

      _pulseControllers.add(AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      ));
    }

    // Start pulse animations for featured apps
    _startPulseAnimations();
  }

  void _startPulseAnimations() {
    // Add pulse animation to specific apps (like Projects, Skills, etc.)
    final featuredIndices = [0, 1, 2]; // First 3 apps get pulse animation

    for (int index in featuredIndices) {
      if (index < _pulseControllers.length) {
        Future.delayed(Duration(milliseconds: 500 + (index * 200)), () {
          if (mounted) {
            _pulseControllers[index].repeat(reverse: true);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _pressControllers) {
      controller.dispose();
    }
    for (var controller in _pulseControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 20),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 18,
        childAspectRatio: 0.85,
        children: List.generate(
          apps.length,
          (index) => _buildEnhancedAppItem(
            context,
            apps[index],
            index,
            currentState,
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedAppItem(
    BuildContext context,
    AppModel app,
    int index,
    CurrentState currentState,
  ) {
    final isIOS = currentState.currentDevice == Devices.ios.iPhone13;
    final hasBadge = _shouldShowBadge(app.title);

    return AnimatedBuilder(
      animation: Listenable.merge([
        _pressControllers[index],
        _pulseControllers[index],
      ]),
      builder: (context, child) {
        final pressValue = _pressControllers[index].value;
        final pulseValue = _pulseControllers[index].value;
        final scale = 1.0 - (pressValue * 0.1);
        final pulseScale = 1.0 + (pulseValue * 0.05);

        return Transform.scale(
          scale: scale * pulseScale,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App Icon Container with Enhanced Effects
              GestureDetector(
                onTapDown: (_) => _pressControllers[index].forward(),
                onTapUp: (_) {
                  _pressControllers[index].reverse();
                  _handleAppTap(app, currentState);
                },
                onTapCancel: () => _pressControllers[index].reverse(),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isIOS ? 16 : 35),
                    color: app.color,
                    boxShadow: [
                      BoxShadow(
                        color: app.color.withOpacity(0.4),
                        blurRadius: 12 + (pulseValue * 8),
                        offset: const Offset(0, 4),
                        spreadRadius: pulseValue * 2,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        app.color,
                        app.color.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Main Icon/Asset
                      Center(
                        child: app.assetPath != null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(isIOS ? 12 : 31),
                                child: Image.asset(
                                  app.assetPath!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                app.icon ?? Icons.apps,
                                size: 36,
                                color: _getIconColor(app.color),
                              ),
                      ),

                      // Badge Notification
                      if (hasBadge)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                _getBadgeCount(app.title),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ).animate().scale(
                                duration: 300.ms,
                                curve: Curves.elasticOut,
                              ),
                        ),

                      // Shimmer effect for new/featured apps
                      if (_isFeaturedApp(app.title))
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(isIOS ? 16 : 35),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 2000.ms),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // App Title with Enhanced Typography
              SizedBox(
                width: 70,
                child: Text(
                  app.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.95),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        )
            .animate(delay: Duration(milliseconds: index * 100))
            .slideY(begin: 0.5, duration: 600.ms)
            .fadeIn();
      },
    );
  }

  void _handleAppTap(AppModel app, CurrentState currentState) {
    // Add haptic feedback
    // HapticFeedback.lightImpact(); // Uncomment if you want haptic feedback

    if (app.link != null) {
      currentState.launchInBrowser(app.link!);
    } else if (app.screen != null) {
      currentState.changePhoneScreen(
        app.screen!,
        false,
        titlee: app.title,
      );
    }
  }

  Color _getIconColor(Color backgroundColor) {
    // Calculate luminance to determine if we should use black or white icon
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  bool _shouldShowBadge(String appTitle) {
    // Define which apps should show badges
    const badgedApps = ['Projects', 'Skills', 'Experience'];
    return badgedApps.contains(appTitle);
  }

  String _getBadgeCount(String appTitle) {
    // Return badge count based on app
    switch (appTitle) {
      case 'Projects':
        return '${projects.length}';
      case 'Skills':
        return '${skills.length}';
      case 'Experience':
        return '${jobExperiences.length}';
      default:
        return '1';
    }
  }

  bool _isFeaturedApp(String appTitle) {
    // Define which apps are featured (get shimmer effect)
    const featuredApps = ['About', 'Projects', 'Skills'];
    return featuredApps.contains(appTitle);
  }
}
