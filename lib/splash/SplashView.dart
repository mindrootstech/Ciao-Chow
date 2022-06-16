import 'package:ciao_chow/splash/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../constants/CommonUi.dart';

class SplashView extends StatelessWidget {
  var splashController = Get.put(SplashController());
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: CommonUi.gradientColorForSplash,
      child: Container(
        margin: const EdgeInsets.only(left: 75,right: 75),
          child: SvgPicture.asset(CommonUi.setSvgImage('splash_image'))),
    );
  }
}
