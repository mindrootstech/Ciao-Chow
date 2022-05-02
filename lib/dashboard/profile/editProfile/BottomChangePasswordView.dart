import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomChangePasswordView extends StatelessWidget {
  ProfileController profileController = Get.find();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    profileController.newPasswordConfirmController.value.text ='';
    profileController.newPasswordController.value.text ='';
    profileController.oldPasswordController.value.text ='';

    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            decoration: CommonUi.commonBoxDecoration(20.0, AppColors.White),
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      Utils.getString(context, 'change_password'),
                      style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                          FontWeight.w600, AppColors.Black, TextDecoration.none),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Text(Utils.getString(context, 'old_password'),
                        style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                            FontWeight.w500, AppColors.Black, TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => Stack(
                        children: [
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              obscureText:
                                  profileController.passwordVisibleLogin.value,
                              controller:
                                  profileController.oldPasswordController.value,
                              cursorColor: AppColors.textFieldsHint,
                              decoration: CommonUi.textFieldDecoration(
                                  Utils.getString(context, 'enter_password')),
                              style: CommonUi.customTextStyle1(
                                Fonts.interRegular,
                                12.0,
                                FontWeight.w400,
                                AppColors.Black,
                                TextDecoration.none,
                              )),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                                onTap: () {
                                  profileController.passwordVisibleLogin.value == true
                                      ? profileController.passwordVisibleLogin.value =
                                          false
                                      : profileController.passwordVisibleLogin.value =
                                          true;
                                },
                                child: Container(
                                  color: AppColors.transparent,
                                  padding: const EdgeInsets.all(20),
                                  child:
                                      profileController.passwordVisibleLogin.value ==
                                              true
                                          ? SvgPicture.asset(
                                              CommonUi.setSvgImage('password_hide'))
                                          : SvgPicture.asset(
                                              CommonUi.setSvgImage('password_show')),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Text(Utils.getString(context, 'new_password'),
                        style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                            FontWeight.w500, AppColors.Black, TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => Stack(
                        children: [
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              obscureText:
                                  profileController.newPasswordVisibleLogin.value,
                              controller:
                                  profileController.newPasswordController.value,
                              cursorColor: AppColors.textFieldsHint,
                              decoration: CommonUi.textFieldDecoration(
                                  Utils.getString(context, 'enter_password')),
                              style: CommonUi.customTextStyle1(
                                Fonts.interRegular,
                                12.0,
                                FontWeight.w400,
                                AppColors.Black,
                                TextDecoration.none,
                              )),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                                onTap: () {
                                  profileController.newPasswordVisibleLogin.value ==
                                          true
                                      ? profileController
                                          .newPasswordVisibleLogin.value = false
                                      : profileController
                                          .newPasswordVisibleLogin.value = true;
                                },
                                child: Container(
                                  color: AppColors.transparent,
                                  padding: const EdgeInsets.all(20),
                                  child: profileController
                                              .newPasswordVisibleLogin.value ==
                                          true
                                      ? SvgPicture.asset(
                                          CommonUi.setSvgImage('password_hide'))
                                      : SvgPicture.asset(
                                          CommonUi.setSvgImage('password_show')),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Text(Utils.getString(context, 'confirm_password'),
                        style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                            FontWeight.w500, AppColors.Black, TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => Stack(
                        children: [
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                } else if (value !=
                                    profileController
                                        .newPasswordController.value.text) {
                                  return 'New Password and Confirm Password is not same';
                                }

                                return null;
                              },
                              obscureText: profileController
                                  .newConfirmPasswordVisibleLogin.value,
                              controller: profileController
                                  .newPasswordConfirmController.value,
                              cursorColor: AppColors.textFieldsHint,
                              decoration: CommonUi.textFieldDecoration(
                                  Utils.getString(context, 'enter_password')),
                              style: CommonUi.customTextStyle1(
                                Fonts.interRegular,
                                12.0,
                                FontWeight.w400,
                                AppColors.Black,
                                TextDecoration.none,
                              )),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                                onTap: () {
                                  profileController
                                              .newConfirmPasswordVisibleLogin.value ==
                                          true
                                      ? profileController
                                          .newConfirmPasswordVisibleLogin
                                          .value = false
                                      : profileController
                                          .newConfirmPasswordVisibleLogin
                                          .value = true;
                                },
                                child: Container(
                                  color: AppColors.transparent,
                                  padding: const EdgeInsets.all(20),
                                  child: profileController
                                              .newConfirmPasswordVisibleLogin.value ==
                                          true
                                      ? SvgPicture.asset(
                                          CommonUi.setSvgImage('password_hide'))
                                      : SvgPicture.asset(
                                          CommonUi.setSvgImage('password_show')),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        profileController.loaderChangePassword.value = true;
                        profileController.getPasswordChanged();
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(Utils.getString(context, 'done'),
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
                          left: 40, right: 40, top: 30, bottom: 30),
                      decoration: CommonUi.shadowRoundedContainer,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(() => profileController.loaderChangePassword.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.AppColorGrad2,
                    ))
                : Container()),
          ),
        ],
      ),
    );
  }
}
