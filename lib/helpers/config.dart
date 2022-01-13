import 'package:dct_shipper/extensions/hex_color.dart';
import 'package:flutter/material.dart';

enum AppStatus { appDev, webDev, staging, production }

class Config {
  static AppStatus status = AppStatus.appDev;
  static String baseURL() {
    switch (status) {
      case AppStatus.appDev:
        return "https://10.0.2.2:5001/api";
      case AppStatus.webDev:
        return "https://127.0.0.1:5001/api";
      case AppStatus.staging:
        return "";
      case AppStatus.production:
        return "";
    }
  }

  static Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
  };

  static Color primaryColor = HexColor.fromHex('#58B742');
  static Color accentColor = Colors.white;
  static Color errorColor = HexColor.fromHex('#EE6666');
  static Color unselectedWidgetColor = HexColor.fromHex('#E5E5E5');

  static Duration animationDuration = const Duration(microseconds: 500);

  static List<BoxShadow> getShadow() {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 5),
          blurRadius: 20),
    ];
  }

  static List<BoxShadow> getShadow2() {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 15),
          blurRadius: 15)
    ];
  }

  static BorderRadius getBorderRadius() {
    return BorderRadius.circular(100);
  }
}
