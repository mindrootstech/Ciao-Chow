import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signUp/ModelText.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/profile/editProfile/ChangePasswordMainModel.dart';
import 'package:ciao_chow/dashboard/profile/ProfileMainModel.dart' as gt;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var loaderProfile = false.obs;
  var loaderChangePassword = false.obs;
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
  var passwordVisibleLogin = true.obs;
  var newPasswordVisibleLogin = true.obs;
  var newConfirmPasswordVisibleLogin = true.obs;
  var oldPasswordController = TextEditingController().obs;
  var newPasswordController = TextEditingController().obs;
  var newPasswordConfirmController = TextEditingController().obs;
  var arrayLatestCheckIns = <gt.UserCheckin>[].obs;
  var arrayBadges = <gt.Badge>[].obs;
  var arrayLevels = <gt.Level>[].obs;
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
    isCameraOrGallery.value = '1';
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
        Get.back();
      } else {
        CommonUi.showToast('Error');
        return;
      }
    });
  }


  @override
  void onInit() {
    super.onInit();
    loaderProfile.value = true;
    getProfileData();

  }

  void getProfileData() {
    _apiProvider.getProfileData().then((value) {
      if (value != 'error') {
        var response = gt.profileMainModelFromJson(value);
        arrayLatestCheckIns.clear();
        arrayLevels.clear();
        arrayBadges.clear();
        profileData.value = response.data!;
        arrayLatestCheckIns.value = response.userCheckins!;
        arrayLevels.value = response.levels!;
        arrayBadges.value = response.badges!;
        String gender;

        if(profileData.value.gender.toString() != '') {
          if (profileData.value.gender == 1) {
            gender = 'Male';
          } else if (profileData.value.gender == 2) {
            gender = 'Female';
          } else {
            gender = 'Other';
          }

          profileData.value.dob != null
              ? addAccountItems(
              CommonUi.dateFormat(profileData.value.dob ??DateTime.now()),
              true,
              gender,
              false)
              : '';
          genderValue.value = gender;

        }
        profileData.value.email.toString() != '' ? emailController.value = profileData.value.email??"" : '';
        profileData.value.name.toString() != '' ? userName.value =
            profileData.value.name?? "" : '';
        profileData.value.mobileNumber.toString() != '' ?phoneController.value =
            profileData.value.mobileNumber?? "" : '';
        profileData.value.dob.toString() != '' ? dobText.value = CommonUi.dateFormat(profileData.value.dob??DateTime.now()) : '';
        isCameraOrGallery.value = '';
        showBottomSheet.value = false;
      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
      loaderProfile.value = false;
    });
  }

  void getPasswordChanged() {
    _apiProvider
        .getPasswordChanged(
            oldPasswordController.value.text,
            newPasswordController.value.text,
            newPasswordConfirmController.value.text)
        .then((value) {
      if (value != 'error') {
        var response = changePasswordMainModelFromJson(value);
        if (response.status == false) {
          CommonUi.showToast(response.message!);
        } else {
          Get.back();
          CommonUi.showToast(response.message!);
          showBottomSheet.value = false;
        }
      } else {
        CommonUi.showToast('Something went wrong!');
        return;
      }
      loaderChangePassword.value = false;
    });
  }
}
