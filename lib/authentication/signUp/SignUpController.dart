import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signUp/ModelText.dart';
import 'package:ciao_chow/authentication/signUp/SignUpModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{

  var imagePath = ''.obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var userName = TextEditingController().obs;
  var genderValue = 'Gender'.obs;
  var dobText = "Date of Birth".obs;
  var accountDetail = <ModelText>[].obs;
  var signUpLoaderShow = false.obs;
  final _apiProvider = ApiProvider();
  var imageName = '';
  var imagePathNew = '';
  var passwordVisibleLogin = false.obs;
  final getStorage = GetStorage();



  Future<void> getCameraImage() async {

    PickedFile image = (await ImagePicker.platform.pickImage(
    source: ImageSource.camera,
        imageQuality: 25,
    ))!;
    imageName = image.path.split('/').last;
    imagePath.value = image.path;
    imagePathNew  = image.path;
    // getUploadImage(image.path, imageName);


  }

  Future<void> getGalleryImage() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
     imageName = image!.path.split('/').last;
    imagePath.value = image.path;
    imagePathNew  = image.path;
    // getUploadImage(image.path, imageName);
  }

  void onDobSelection(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    dobText.value = formattedDate;
    ModelText modelText = ModelText();
    modelText = accountDetail[0];
    modelText.name = formattedDate;
    accountDetail[0] = modelText;
  }

  void addAccountItems(String firstName, bool firstSelected, String secondName, bool secondSelected) {
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

  Future<SignUpModel> signUpImplementation(String userName, String phoneNumber, String email, String password) {

    String gender;
    if (genderValue.value == 'Male') {
      gender = '1';
    } else if (genderValue.value == 'Female') {
      gender = '2';
    } else {
      gender = '3';
    }

    return _apiProvider.getSignUp(userName,phoneNumber,email,password,gender,accountDetail[0].name,imagePathNew,imageName);
  }



}