import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../consts/data.dart';
import '../../providers/current_state.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 20),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.85,
        children: List.generate(
            apps.length,
            (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      borderRadius:
                          currentState.currentDevice == Devices.ios.iPhone13
                              ? 12
                              : 100,
                      onPressed: () {
                        if (apps[index].link != null) {
                          currentState.launchInBrowser(
                            apps[index].link!,
                          );
                        } else if (apps[index].screen != null) {
                          currentState.changePhoneScreen(
                              apps[index].screen!, false,
                              titlee: apps[index].title);
                        }
                      },
                      width: 50,
                      height: 50,
                      asset: apps[index].assetPath != null
                          ? ButtonAsset(apps[index].assetPath!,
                              width: 28, height: 28)
                          : null,
                      backgroundColor: apps[index].color,
                      child: apps[index].assetPath == null &&
                              apps[index].icon != null
                          ? Center(
                              child: Icon(
                                apps[index].icon!,
                                size: 28,
                                color: Colors.black,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 65,
                      child: Text(
                        apps[index].title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.openSans(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
