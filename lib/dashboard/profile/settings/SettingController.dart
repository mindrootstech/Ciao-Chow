import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingsModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../authentication/signIn/SignInView.dart';
import '../../../constants/CommonUi.dart';
import '../ProfileController.dart';

class SettingController extends GetxController{


  var loaderLogout = false.obs;
  final _apiProvider = ApiProvider();
  final getStorage = GetStorage();
  var arraySettingList = <SettingsModel>[];


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
        Get.delete<ProfileController>();
      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
      loaderLogout.value = false;
    });
  }


  void getAccountDelete() {
    _apiProvider.getAccountDelete().then((value) {
      if (value != 'error') {
        getStorage.remove('lat');
        getStorage.remove('long');
        getStorage.remove('firebaseToken');
        getStorage.remove('stripeCustomerId');
        getStorage.remove('isRegisterOrLoggedIn');
        getStorage.remove('token');
        FirebaseMessaging.instance.unsubscribeFromTopic("ciaochow");
        Get.offAll(SignInView());
        Get.delete<ProfileController>();
      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
      loaderLogout.value = false;
    });
  }


}