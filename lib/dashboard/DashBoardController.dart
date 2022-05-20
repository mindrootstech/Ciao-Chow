import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signIn/SignInView.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashBoardController extends GetxController {
  var selectedValue = 0.obs;
  final _apiProvider = ApiProvider();
  final getStorage = GetStorage();

  void getLogout() {
    _apiProvider.getLogoutApi().then((value) {
      if (value != 'error') {
        getStorage.remove('lat');
        getStorage.remove('long');
        getStorage.remove('firebaseToken');
        getStorage.remove('stripeCustomerId');
        getStorage.remove('isRegisterOrLoggedIn');
        getStorage.remove('token');
        FirebaseMessaging.instance.unsubscribeFromTopic("ciaochow");
        Get.offAll(SignInView());
      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
    });
  }
}
