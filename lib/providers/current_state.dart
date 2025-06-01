import 'package:om_dixit_portfolio/consts/data.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/homescreen/phone_home_page.dart';

class CurrentState extends ChangeNotifier {
  // Define the two devices for toggling
  final DeviceInfo _iPhoneDevice = Devices.ios.iPhone13;
  final DeviceInfo _androidDevice = Devices.android.samsungGalaxyS20;

  // Initialize currentDevice to iPhone
  late DeviceInfo currentDevice = _iPhoneDevice;

  String selectedCloud = "assets/images/cloudyBlue.svg";
  Gradient bgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.black,
      Colors.grey[850]!, // Dark grey
      Colors.grey[700]!, // Medium grey
      Colors.grey[500]!, // Lighter grey
    ],
    stops: const [0.0, 0.4, 0.7, 1.0],
  );
  int selectedColor = 1; // values can range from 0 to 5

  // Method to toggle between iPhone and Android
  void toggleDevice() {
    if (currentDevice == _iPhoneDevice) {
      currentDevice = _androidDevice;
    } else {
      currentDevice = _iPhoneDevice;
    }
    notifyListeners();
  }

  // existing changeSelectedDevice can be kept if you plan to select from a list later
  // or removed if only toggling is needed.
  // For now, I'll keep it commented out to avoid confusion if not used.
  /* 
  void changeSelectedDevice(DeviceInfo device) async {
    currentDevice = device;
    notifyListeners();
  }
  */

  bool isMainScreen = true;
  String? title;

  Widget currentScreen = const PhoneHomeScreen();

  void changeGradient(int index) {
    selectedColor = index;
    bgGradient = colorPalette[index].gradient;
    selectedCloud = colorPalette[index].svgPath;
    notifyListeners();
  }

  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  void changePhoneScreen(Widget change, bool isMain, {String? titlee}) {
    title = titlee;
    currentScreen = change;
    isMainScreen = isMain;
    notifyListeners();
  }
}
