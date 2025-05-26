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
import 'phone_screen_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = size.width < 800;

    String cloudAssetPath = currentState.selectedCloud;

    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentState, Gradient>(
            selector: (context, provider) => provider.bgGradient,
            builder: (context, gradient, __) {
              return Container(
                decoration: BoxDecoration(gradient: gradient),
              );
            },
          ),
          SizedBox(
            width: size.width,
            height: 200,
            child: Stack(
              children: [
                SvgPicture.asset(
                  cloudAssetPath,
                  width: size.width,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ).animate(onPlay: (controller) => controller.repeat()).moveX(
                      begin: 0,
                      end: -size.width,
                      duration: const Duration(seconds: 60),
                      curve: Curves.linear,
                    ),
                SvgPicture.asset(
                  cloudAssetPath,
                  width: size.width,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ).animate(onPlay: (controller) => controller.repeat()).moveX(
                      begin: size.width,
                      end: 0,
                      duration: const Duration(seconds: 60),
                      curve: Curves.linear,
                    ),
              ],
            ),
          ),
          const LightningAnimation(),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      height: size.height - 100,
                      child: Consumer<CurrentState>(
                        builder: (context, deviceState, __) {
                          return DeviceFrame(
                            device: deviceState.currentDevice,
                            screen: Container(
                              decoration: BoxDecoration(
                                gradient: deviceState.bgGradient,
                              ),
                              child: ScreenWrapper(
                                childG: deviceState.currentScreen,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10 * theme.heightRatio),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "iPhone 13",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
