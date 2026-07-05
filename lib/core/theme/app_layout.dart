import 'package:flutter/material.dart';

class AppLayout {
  // Padding
  static const double padH = 24.0;
  static const double padV = 20.0;
  
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: padH, vertical: padV);

  // Spacing
  static const double gap16 = 16.0;
  static const double gap32 = 32.0;
  static const double gap40 = 40.0;

  // Border Radius
  static const double radiusS = 12.0;
  static const double radiusM = 18.0;
  static const double radiusL = 24.0;

  static BorderRadius get borderS => BorderRadius.circular(radiusS);
  static BorderRadius get borderM => BorderRadius.circular(radiusM);
  static BorderRadius get borderL => BorderRadius.circular(radiusL);

  // Touch Target
  static const double minTouchTarget = 48.0;

  // Animation
  static const Duration animDuration = Duration(milliseconds: 250);
  static const Curve animCurve = Curves.easeInOut;
}
