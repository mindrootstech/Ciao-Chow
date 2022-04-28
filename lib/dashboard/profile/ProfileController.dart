import 'package:ciao_chow/dashboard/profile/settings/SettingsModel.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  var loaderProfile = false.obs;
  var arraySettingList = <SettingsModel>[].obs;

  var imagePath = ''.obs;

}