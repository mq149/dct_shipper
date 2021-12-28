import 'package:flutter/material.dart';

class NavbarButton {
  IconData icon;
  Color iconColor;
  VoidCallback onPressed;

  NavbarButton(
      {required this.icon, required this.iconColor, required this.onPressed});
}
