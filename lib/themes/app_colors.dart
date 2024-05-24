import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF45505B);
  static const Color backgroundColor = Colors.black;
  static const Color blackGrey = Color(0xFF8B8C8C);
  static const Color blackGreyOpacity = Color(0xFF969797); /// [blackGrey] opacity .9
  static const Color purple = Color(0xFF8300E9);
  static const Color lightYellow = Color(0xFFFCF0B3);
  static const Color extraLightYellow = Color(0xffFEF1B9);
  static const Color lightBlue = Color(0xFFAEE0F6);
  static const Color blue = Color(0xff00B4AB);
  static const LinearGradient yellowCyanGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      AppColors.extraLightYellow,
      Color(0xffCFBEE9),
    ],
  );
}
