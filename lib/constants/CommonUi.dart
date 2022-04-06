import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/Language.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class CommonUi {
  static var dropDownButtonDecoration =
      const InputDecoration.collapsed(hintText: "", border: InputBorder.none);

  static var gradientColorForSplash = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.AppColorGrad1, AppColors.AppColorGrad2]),
  );

  static commonBoxDecoration(double radius, Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius)));
  }

  static commonBoxDecorationGradient(double radius) {
    return BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.AppColorGrad1, AppColors.AppColorGrad2]),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static commonBoxDecorationAllSides(double radius, Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(
          radius,
        )));
  }

  static commonBorderDecoration(double radius, Color color) {
    return BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(
          radius,
        )));
  }

  static commonBoxDecorationAllOverlay(double radius) {
    return BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.transparent, AppColors.Black]),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static String setPngImage(String name) {
    return 'assets/images/$name.png';
  }

  static String setSvgImage(String name) {
    return 'assets/svg/$name.svg';
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

  static var shadowWhiteContainer = BoxDecoration(
      boxShadow: [
        CommonUi.shadowDecoration,
      ],
      color: AppColors.White,
      border: Border.all(color: Colors.transparent),
      borderRadius: const BorderRadius.all(Radius.circular(10)));

  static var shadowDecoration = const BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: 5.0, // soften the shadow
    spreadRadius: 0.0, //extend the shadow
    offset: Offset(
      0.0, // Move to right 10  horizontally
      2.0, // Move to bottom 10 Vertically
    ),
  );

  static emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static phoneNumberValidator(String value) {
    return RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$').hasMatch(value);
  }

  static final Language defaultLanguage =
      Language(languageCode: 'en', countryCode: 'US', name: 'English US');

  static final List<Language> psSupportedLanguageList = <Language>[
    Language(languageCode: 'en', countryCode: 'US', name: 'English'),
  ];

  static textFieldDecoration(String hintTxt) {
    return InputDecoration(
      hintText: hintTxt,
      hintStyle: const TextStyle(color: AppColors.textFieldsHint),
      filled: true,
      fillColor: AppColors.textFieldsMain,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static void hideKeyBoard(context) {
    // FocusScope.of(context).requestFocus(FocusNode());
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String dateFormat(DateTime createdAt) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(createdAt);
    return formatted;
  }

  static String timeFormat(DateTime createdAt) {
    String formattedDate = DateFormat('kk:mm:a').format(createdAt);
    return formattedDate;
  }

  static void imageSliders(
      List<dynamic> bannerList, RxList<Widget> imageSliders) {
    imageSliders.value = bannerList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 1000.0,
                imageUrl: item.image,
                placeholder: (context, url) => Transform.scale(
                    scale: 0.2,
                    child: const CircularProgressIndicator(
                      strokeWidth: 10.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ))
        .toList();
  }
}
