import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/authentication/signUp/DOBText.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:ciao_chow/dashboard/profile/editProfile/BottomSheetChangePassword.dart';
import 'package:ciao_chow/dashboard/profile/editProfile/ImageOptionChooserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key}) : super(key: key);

  // HomeController homeController = Get.find();
  ProfileController profileController = Get.find();
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  Future<bool> _onWillPop() async {
    return profileController.showBottomSheet.value
        ? profileController.showBottomSheet.value = false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    profileController.updateProfileLoaderShow.value = false;
    profileController.imagePathNew = '';
    profileController.isCameraOrGallery.value = '';
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.White,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              backgroundColor: AppColors.AppColorGrad2,
              elevation: 0,
              title: Text(Utils.getString(context, 'settings')),
              centerTitle: true,
            ),
            backgroundColor: AppColors.White,
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Stack(
                      children: [
                        Container(
                          height: 38,
                          color: AppColors.AppColorGrad2,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 15,
                            width: Get.width,
                            decoration: CommonUi.commonBoxDecoration(
                                24.0, AppColors.White),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ImageOptionChooserProfile().showChooser(context);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.only(top: 25),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.redBorder2,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 25),
                                    child: Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.redBorder1,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Obx(
                                        () => ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                          child: profileController.profileData
                                                          .value.profileImage
                                                          .toString() ==
                                                      '' &&
                                                  profileController
                                                          .isCameraOrGallery
                                                          .value !=
                                                      '1'
                                              ? SvgPicture.asset(
                                                  CommonUi.setSvgImage(
                                                      'default_image'),
                                                  // fit: BoxFit.cover,
                                                )
                                              : profileController
                                                          .isCameraOrGallery
                                                          .value ==
                                                      '1'
                                                  ? Image.file(
                                                      File(profileController
                                                          .imagePath.value),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      width: 1000.0,
                                                      imageUrl:
                                                          profileController
                                                              .profileData
                                                              .value
                                                              .profileImage!,
                                                      placeholder: (context,
                                                              url) =>
                                                          SizedBox(
                                                              width: Get.width,
                                                              child:
                                                                  const Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color:
                                                                      AppColors
                                                                          .White,
                                                                ),
                                                              )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                          CommonUi.setSvgImage('profile_edit')),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(Utils.getString(context, 'name'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interMedium,
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.Black,
                                    TextDecoration.none)),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                textCapitalization: TextCapitalization.words,
                                controller: TextEditingController()
                                  ..text =
                                      profileController.profileData.value.name!,
                                onChanged: (text) =>
                                    {profileController.userName.value = text},
                                cursorColor: AppColors.textFieldsHint,
                                decoration: CommonUi.textFieldDecoration(
                                    Utils.getString(context, 'enter_name')),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.Black,
                                    TextDecoration.none)),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(Utils.getString(context, 'email'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interMedium,
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.Black,
                                    TextDecoration.none)),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value != null || value!.isNotEmpty) {
                                    if (CommonUi.emailValid(profileController
                                            .emailController.value
                                            .trim()) ==
                                        false) {
                                      return 'Please enter valid email';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return 'Please enter email';
                                  }
                                  // return null;
                                },
                                controller: TextEditingController()
                                  ..text = profileController
                                      .profileData.value.email!,
                                onChanged: (text) => {
                                      profileController.emailController.value =
                                          text
                                    },
                                cursorColor: AppColors.textFieldsHint,
                                decoration: CommonUi.textFieldDecoration(
                                    Utils.getString(context, 'email_hint')),
                                style: CommonUi.customTextStyle1(
                                  Fonts.interRegular,
                                  12.0,
                                  FontWeight.w400,
                                  AppColors.Black,
                                  TextDecoration.none,
                                )),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                                Utils.getString(context, 'mobile_number'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interMedium,
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.Black,
                                    TextDecoration.none)),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Mobile Number';
                                  } else if (value != null ||
                                      value.isNotEmpty) {
                                    if (profileController.phoneController.value
                                                .trim()
                                                .length <
                                            9 ||
                                        profileController.phoneController.value
                                                .trim()
                                                .length >
                                            12) {
                                      return 'Please Enter Valid Phone Number';
                                    }
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                controller: TextEditingController()
                                  ..text = profileController
                                      .profileData.value.mobileNumber!,
                                onChanged: (text) => {
                                      profileController.phoneController.value =
                                          text
                                    },
                                keyboardType: TextInputType.phone,
                                cursorColor: AppColors.textFieldsHint,
                                decoration: CommonUi.textFieldDecoration(
                                    Utils.getString(context, 'mobile_hint')),
                                style: CommonUi.customTextStyle1(
                                  Fonts.interRegular,
                                  12.0,
                                  FontWeight.w400,
                                  AppColors.Black,
                                  TextDecoration.none,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(Utils.getString(context, 'dob'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interMedium,
                                          14.0,
                                          FontWeight.w500,
                                          AppColors.Black,
                                          TextDecoration.none)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                      Utils.getString(context, 'gender'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interMedium,
                                          14.0,
                                          FontWeight.w500,
                                          AppColors.Black,
                                          TextDecoration.none)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    CommonUi.hideKeyBoard(context);
                                    profileController.addAccountItems(
                                        profileController.accountDetail[0].name,
                                        true,
                                        profileController.accountDetail[1].name,
                                        false);
                                    if (Platform.isAndroid) {
                                      pickDateDialog(context);
                                    } else if (Platform.isIOS) {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(
                                              DateTime.now().year - 100),
                                          maxTime: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day),
                                          onChanged: (date) {},
                                          onCancel: () {}, onConfirm: (date) {
                                        profileController.onDobSelection(date);
                                      },
                                          currentTime: profileController
                                                      .accountDetail[0].name !=
                                                  'Date of Birth'
                                              ? DateTime.parse(profileController
                                                  .accountDetail[0].name)
                                              : DateTime.now(),
                                          locale: LocaleType.en);
                                    }
                                  },
                                  child: Obx(
                                    () => DOBText(
                                        textValue:
                                            profileController.accountDetail[0]),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  decoration: BoxDecoration(
                                      color: AppColors.textFieldsMain,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 8, right: 20),
                                  child: Center(
                                    child: Obx(
                                      ()=> DropdownButtonFormField<String>(
                                        value:   profileController.genderValue.value,
                                        isExpanded: true,
                                        onTap: () {
                                          CommonUi.hideKeyBoard(context);
                                          profileController.addAccountItems(
                                              profileController
                                                  .accountDetail[0].name,
                                              false,
                                              profileController
                                                  .accountDetail[1].name,
                                              true);
                                        },

                                        // underline: Container(),
                                        decoration:
                                            CommonUi.dropDownButtonDecoration,
                                        hint: Text(
                                            Utils.getString(
                                                context, 'gender_hint'),
                                            style: CommonUi.customTextStyle1(
                                              Fonts.interRegular,
                                              12.0,
                                              FontWeight.w400,
                                              AppColors.Black,
                                              TextDecoration.none,
                                            )),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.textFieldsHint,
                                        ),
                                        style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.textFieldsHint,
                                          TextDecoration.none,
                                        ),

                                        onChanged: (String? newValue) {
                                          CommonUi.hideKeyBoard(context);
                                          profileController.genderValue.value =
                                              newValue!;
                                        },
                                        items: <String>['Male', 'Female', 'Other']
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: CommonUi.customTextStyle1(
                                                Fonts.interRegular,
                                                12.0,
                                                FontWeight.w400,
                                                AppColors.Black,
                                                TextDecoration.none,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        profileController.updateProfileLoaderShow.value = true;
                        profileController.updateProfile();
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(Utils.getString(context, 'update_profile'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interMedium,
                                14.0,
                                FontWeight.w500,
                                AppColors.White,
                                TextDecoration.none)),
                      ),
                      height: 50,
                      width: Get.width,
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, top: 20, bottom: 24),
                      decoration: CommonUi.shadowRoundedContainer,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      profileController.showBottomSheet.value = true;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        Utils.getString(context, 'change_password'),
                        style: CommonUi.customTextStyle1(
                            Fonts.interRegular,
                            14.0,
                            FontWeight.w400,
                            AppColors.redEdit,
                            TextDecoration.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(() => profileController.showBottomSheet.value
              ? BottomSheetChangePassword()
              : Container()),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(() => profileController.updateProfileLoaderShow.value
                ? SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.AppColorGrad2,
                      ),
                    ),
                  )
                : Container()),
          ),
        ],
      ),
    );
  }

  void pickDateDialog(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        // <- this
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.AppColorGrad2,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.AppColorGrad2,
                ),
              ),
            ),
            child: child!,
          );
        }).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      profileController.onDobSelection(pickedDate);
    });
  }
}
