import 'package:ciao_chow/splash/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/CommonUi.dart';

class SplashView extends StatelessWidget{

  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Container(
    height : Get.height,width: Get.width, decoration: CommonUi.gradientColorForSplash,
      child:
      Image.asset(CommonUi.setPngImage('splash_image')),);
  }

}