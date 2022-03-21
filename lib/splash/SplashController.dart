import 'package:ciao_chow/signIn/SignInView.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Get.off(SignInView());
    });
  }

}