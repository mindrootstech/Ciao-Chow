import 'package:ciao_chow/authentication/signIn/SignInView.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var getStorage = GetStorage();

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 5000), () {

      // getStorage.read('token') != '' && getStorage.read('token') != null
      //     ? Get.off(DashBoardView(0))
      //     : Get.off(SignInView());
    });
  }
}
