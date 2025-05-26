import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../widgets/lightning_animation.dart';
import '../../widgets/intro_section.dart';
import '../../widgets/top_clouds.dart';
import '../../widgets/enhanced_background.dart';
import 'phone_screen_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = size.width < 800;

    return Scaffold(
      body: Stack(
        children: [
          Consumer<CurrentState>(
            builder: (context, cs, __) {
              return Container(
                decoration: BoxDecoration(gradient: cs.bgGradient),
              );
            },
          ),
          Consumer<CurrentState>(
            builder: (context, cs, __) {
              if (cs.selectedCloud.isEmpty) {
                return const SizedBox.shrink();
              }
              return const SizedBox.shrink();
            },
          ),
          const EnhancedBackground(),
          const LightningAnimation(),
          const TopClouds(),
          const CloudRainEffect(),
          const MouseFollowerEffect(),
          const ColorPaletteSelector(),
          Row(
            children: [
              if (!phone)
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 50),
                    child: const IntroSection(),
                  ),
                ),
              Expanded(
                flex: phone ? 1 : 3,
                child:
                    Consumer<CurrentState>(builder: (context, deviceState, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height - 150,
                        child: DeviceFrame(
                          device: deviceState.currentDevice,
                          screen: Container(
                            decoration: BoxDecoration(
                              gradient: deviceState.bgGradient,
                            ),
                            child: ScreenWrapper(
                              childG: deviceState.currentScreen,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                deviceState.currentDevice =
                                    Devices.android.samsungGalaxyS20;
                                deviceState.notifyListeners();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: deviceState.currentDevice ==
                                          Devices.android.samsungGalaxyS20
                                      ? Colors.green.withOpacity(0.8)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Android',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                deviceState.currentDevice =
                                    Devices.ios.iPhone13;
                                deviceState.notifyListeners();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: deviceState.currentDevice ==
                                          Devices.ios.iPhone13
                                      ? Colors.blue.withOpacity(0.8)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.phone_iphone,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'iOS',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        deviceState.currentDevice.name,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorPaletteSelector extends StatefulWidget {
  const ColorPaletteSelector({Key? key}) : super(key: key);

  @override
  State<ColorPaletteSelector> createState() => _ColorPaletteSelectorState();
}

class _ColorPaletteSelectorState extends State<ColorPaletteSelector>
    with TickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;
  int _hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentState>(
      builder: (context, state, __) {
        return Positioned(
          top: 50,
          right: 20,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header with expand/collapse button
                GestureDetector(
                  onTap: _toggleExpanded,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.palette,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Themes",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Color palette grid
                if (_isExpanded) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: 80,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: colorPalette.length,
                      itemBuilder: (context, index) {
                        final isSelected = state.selectedColor == index;
                        final isHovered = _hoveredIndex == index;

                        return MouseRegion(
                          onEnter: (_) => setState(() => _hoveredIndex = index),
                          onExit: (_) => setState(() => _hoveredIndex = -1),
                          child: GestureDetector(
                            onTap: () {
                              state.changeGradient(index);
                              // Auto-collapse after selection for better UX
                              _toggleExpanded();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: colorPalette[index].gradient,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : isHovered
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.transparent,
                                  width: isSelected ? 3 : 2,
                                ),
                                boxShadow: [
                                  if (isSelected || isHovered)
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.3),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                ],
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ).animate().scale(
                                  duration: 200.ms,
                                  curve: Curves.elasticOut,
                                ),
                          ),
                        );
                      },
                    ),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 12),
                  // Theme info
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Theme ${state.selectedColor + 1}',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().fadeIn(duration: 300.ms, delay: 100.ms),
                ],
              ],
            ),
          ).animate().slideX(begin: 1, duration: 600.ms).fadeIn(),
        );
      },
    );
  }
}

class AnimatedCloud extends StatelessWidget {
  final String cloudAssetPath;
  final double screenWidth;
  final int animationDurationSeconds;
  final double startOffset;
  final double height;

  const AnimatedCloud({
    Key? key,
    required this.cloudAssetPath,
    required this.screenWidth,
    required this.animationDurationSeconds,
    required this.startOffset,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      cloudAssetPath,
      width: screenWidth,
      height: height,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    ).animate(onPlay: (controller) => controller.repeat()).moveX(
          begin: startOffset,
          end: startOffset - (screenWidth * 2),
          duration: Duration(seconds: animationDurationSeconds * 2),
          curve: Curves.linear,
        );
  }
}
