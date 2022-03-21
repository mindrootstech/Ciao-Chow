import 'package:ciao_chow/constants/AppColors.dart';
import 'package:flutter/material.dart';

class CommonUi {
  static var gradientColorForSplash = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.AppColorGrad1, AppColors.AppColorGrad2]),
  );

  static String setPngImage(String name) {
    return 'assets/images/$name.png';
  }

  static customTextStyle1(String fontFamily, double fontSize,
      FontWeight fontWeight, Color color, TextDecoration txtDecoration) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: txtDecoration,
    );
  }

  static var shadowRoundedContainer = BoxDecoration(
      boxShadow: [
        CommonUi.shadowDecoration,
      ],
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.buttonColor1, AppColors.buttonColor2]),
      border: Border.all(color: Colors.transparent),
      borderRadius: const BorderRadius.all(Radius.circular(100)));

  static var shadowDecoration = const BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: 32.0, // soften the shadow
    spreadRadius: 0.0, //extend the shadow
    offset: Offset(
      0.0, // Move to right 10  horizontally
      8.0, // Move to bottom 10 Vertically
    ),
  );
}
