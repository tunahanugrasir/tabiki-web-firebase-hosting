import 'package:flutter/material.dart';

class TimelineConstants {
  static const Duration animationDuration = Duration(milliseconds: 400);
  static const Curve animationCurve = Curves.easeOutCubic;
  
  static const double defaultScale = 1.0;
  static const double hoverScale = 1.03;
  static const double defaultRotate = 0.0;
  static const double hoverRotate = 0.05;
  
  static const double timelineWidth = 3.0;
  static const double cardBorderRadius = 20.0;
  static const double iconBorderRadius = 15.0;
  
  static const EdgeInsets cardPadding = EdgeInsets.all(30);
  static const EdgeInsets iconPadding = EdgeInsets.all(16);
  
  static const double defaultIconSize = 32.0;
  static const double hoverIconSizeIncrease = 4.0;
  
  static const double defaultFontSize = 16.0;
  static const double hoverFontSize = 17.0;
  static const double titleFontSize = 26.0;
  static const double hoverTitleFontSize = 28.0;
  
  static const double defaultOpacity = 0.8;
  static const double hoverOpacity = 0.9;
  
  static const double defaultShadowOpacity = 0.05;
  static const double hoverShadowOpacity = 0.2;
  static const double defaultBlur = 20.0;
  static const double hoverBlur = 30.0;
  static const double defaultSpread = 0.0;
  static const double hoverSpread = 5.0;
}

class TimelineColors {
  static const Color textColor = Color(0xFF2D3436);
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color backgroundEndColor = Color(0xFFF3F4F6);
  
  static const List<Color> step1Colors = [Color(0xFF4B6584), Color(0xFF778CA3)];
  static const List<Color> step2Colors = [Color(0xFF20BF6B), Color(0xFF26DE81)];
  static const List<Color> step3Colors = [Color(0xFFF7B731), Color(0xFFFED330)];
  static const List<Color> step4Colors = [Color(0xFF0FB9B1), Color(0xFF2BCBBA)];
} 