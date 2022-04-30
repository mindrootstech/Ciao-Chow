import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signIn/SignInView.dart';
import 'package:ciao_chow/authentication/signUp/ModelText.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/profile/settings/ProfileMainModel.dart' as gt;
import 'package:ciao_chow/dashboard/profile/settings/SettingsModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var loaderProfile = false.obs;
  var loaderLogout = false.obs;
  var arraySettingList = <SettingsModel>[];
  var imagePath = ''.obs;
  var userName = ''.obs;
  var emailController = ''.obs;
  var phoneController = ''.obs;
  var accountDetail = <ModelText>[].obs;
  var genderValue = 'Gender'.obs;
  var dobText = "Date of Birth".obs;
  var imageName = '';
  var imagePathNew = '';
  var isCameraOrGallery = ''.obs;
  var updateProfileLoaderShow = false.obs;
  final _apiProvider = ApiProvider();
  final getStorage = GetStorage();
  var showBottomSheet = false.obs;
  var passwordVisibleLogin = false.obs;
  var newPasswordVisibleLogin = false.obs;
  var newConfirmPasswordVisibleLogin = false.obs;
  var oldPasswordController = TextEditingController().obs;
  var newPasswordController = TextEditingController().obs;
  var newPasswordConfirmController = TextEditingController().obs;

  var profileData = gt.Data().obs;

  void addAccountItems(String firstName, bool firstSelected, String secondName,
      bool secondSelected) {
    accountDetail.clear();
    var model = ModelText();
    model.name = firstName;
    model.isSelected = firstSelected;
    accountDetail.add(model);
    model = ModelText();
    model.name = secondName;
    model.isSelected = secondSelected;
    accountDetail.add(model);
  }

  void onDobSelection(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    dobText.value = formattedDate;
    ModelText modelText = ModelText();
    modelText = accountDetail[0];
    modelText.name = formattedDate;
    accountDetail[0] = modelText;
  }

  Future<void> getCameraImage() async {
    PickedFile image = (await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    ))!;
    imageName = image.path.split('/').last;
    imagePath.value = image.path;
    imagePathNew = image.path;
    isCameraOrGallery.value = '1';
  }

  Future<void> getGalleryImage() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    imageName = image!.path.split('/').last;
    imagePath.value = image.path;
    imagePathNew = image.path;
    isCameraOrGallery.value ='1';
  }

  void updateProfile() {
    String gender;
    if (genderValue.value == 'Male') {
      gender = '1';
    } else if (genderValue.value == 'Female') {
      gender = '2';
    } else {
      gender = '3';
    }

    _apiProvider
        .updateProfile(
      userName.value.trim(),
      phoneController.value.trim(),
      emailController.value.trim(),
      gender,
      accountDetail[0].name,
      imagePathNew,
      imageName,
    )
        .then((value) {
      if (value != 'error') {
        getProfileData();
      } else {
        CommonUi.showToast('Error');
        return;
      }
    });
    updateProfileLoaderShow.value = false;
  }


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


  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  void getProfileData() {
    _apiProvider.getProfileData().then((value) {
      if (value != 'error') {
        var response = gt.profileMainModelFromJson(value);
        profileData.value = response.data!;

      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
      loaderLogout.value = false;
    });
  }

}
