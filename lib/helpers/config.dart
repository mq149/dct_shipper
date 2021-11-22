import 'package:flutter/material.dart';

class Config {
  static List<BoxShadow> getShadow() {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 5),
          blurRadius: 20)
    ];
  }

  static BorderRadius getBorderRadius() {
    return BorderRadius.circular(100);
  }
}
