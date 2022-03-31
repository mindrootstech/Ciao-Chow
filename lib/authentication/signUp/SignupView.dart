import 'dart:io';

import 'package:ciao_chow/authentication/signUp/DOBText.dart';
import 'package:ciao_chow/authentication/signUp/ImageOptionChooser.dart';
import 'package:ciao_chow/authentication/signUp/SignUpController.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  var signUpController = Get.put(SignUpController());

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  SignupView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    signUpController.addAccountItems("Date of Birth", false, "Gender", false);
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: Text(Utils.getString(context, 'create_account'),
                    style: CommonUi.customTextStyle1(
                        Fonts.interSemiBold,
                        24.0,
                        FontWeight.w600,
                        AppColors.White,
                        TextDecoration.none))),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(Utils.getString(context, 'please_register'),
                  style: CommonUi.customTextStyle1(Fonts.interRegular, 14.0,
                      FontWeight.w400, AppColors.White, TextDecoration.none)),
            ),
            GestureDetector(
              onTap: () {
                ImageOptionChooser().showChooser(context);
              },
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.whiteBorder,
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
                            color: AppColors.whiteBorder,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Obx(
                          () => ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: signUpController.imagePath.value == ''
                                ? SvgPicture.asset(
                                    CommonUi.setSvgImage('default_image'),
                                    // fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(signUpController.imagePath.value),
                                    fit: BoxFit.cover,
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
            Expanded(
              child: Container(
                decoration: CommonUi.commonBoxDecoration(24.0, AppColors.White),
                margin: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
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
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                            validator: (value) {
                              if (value != null || value!.isNotEmpty) {
                                if (CommonUi.emailValid(signUpController
                                        .emailController.value.text
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
                            controller: signUpController.emailController.value,
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
                        child: Text(Utils.getString(context, 'mobile_number'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interMedium,
                                14.0,
                                FontWeight.w500,
                                AppColors.Black,
                                TextDecoration.none)),
                      ),
                      Container(
                        width: Get.width,
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Mobile Number';
                              } else if (value != null || value.isNotEmpty) {
                                if (signUpController.phoneController.value.text
                                        .trim()
                                        .length <
                                    10) {
                                  return 'Please Enter Valid Phone Number';
                                }
                              }
                              return null;
                            },
                            controller: signUpController.phoneController.value,
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
                              margin: const EdgeInsets.only(top: 20, left: 20),
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
                              margin: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(Utils.getString(context, 'gender'),
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
                                signUpController.addAccountItems(
                                    signUpController.accountDetail[0].name,
                                    true,
                                    signUpController.accountDetail[1].name,
                                    false);
                                if (Platform.isAndroid) {
                                  pickDateDialog(context);
                                } else if (Platform.isIOS) {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime:
                                          DateTime(DateTime.now().year - 100),
                                      maxTime: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      onChanged: (date) {},
                                      onCancel: () {}, onConfirm: (date) {
                                    signUpController.onDobSelection(date);
                                  },
                                      currentTime: signUpController
                                                  .accountDetail[0].name !=
                                              'Date of Birth'
                                          ? DateTime.parse(signUpController
                                              .accountDetail[0].name)
                                          : DateTime.now(),
                                      locale: LocaleType.en);
                                }
                              },
                              child: Obx(
                                () => DOBText(
                                    textValue:
                                        signUpController.accountDetail[0]),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 16,right: 16),
                              decoration: BoxDecoration(
                                  color: AppColors.textFieldsMain,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 8, right: 20),
                              child: Center(
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  onTap: () {
                                    CommonUi.hideKeyBoard(context);
                                    signUpController.addAccountItems(
                                        signUpController.accountDetail[0].name,
                                        false,
                                        signUpController.accountDetail[1].name,
                                        true);
                                  },

                                  // underline: Container(),
                                  decoration: CommonUi.dropDownButtonDecoration,
                                  hint: Text(
                                      Utils.getString(context, 'gender_hint'),
                                      style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
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
                                    signUpController.genderValue.value =
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
                        ],
                      ),

                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(Utils.getString(context, 'password'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interMedium,
                                14.0,
                                FontWeight.w500,
                                AppColors.Black,
                                TextDecoration.none)),
                      ),
                      Container(
                        width: Get.width,
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
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
                      ),

                      // Container(
                      //   width: Get.width,
                      //   margin: const EdgeInsets.only(top: 10, right: 20),
                      //   child: Text('Forgot Password?',
                      //       style: CommonUi.customTextStyle1(
                      //           Fonts.interRegular,
                      //           12.0,
                      //           FontWeight.w400,
                      //           AppColors.textFieldsHint,
                      //           TextDecoration.none),
                      //       textAlign: TextAlign.right),
                      // ),

                      // const Expanded(child: SizedBox(height: 1,)),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Get.off(DashBoardView());
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                                Utils.getString(context, 'sign_up_small'),
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
                              left: 40, right: 40, top: 90, bottom: 24),
                          decoration: CommonUi.shadowRoundedContainer,
                        ),
                      ),

                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 70),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: Utils.getString(
                                        context, 'already_have_account'),
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interSemiBold,
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.Black,
                                        TextDecoration.none)),
                                TextSpan(
                                    text: Utils.getString(context, 'signin'),
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interMedium,
                                        14.0,
                                        FontWeight.w500,
                                        AppColors.AppColorGrad2,
                                        TextDecoration.none)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pickDateDialog(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
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
      signUpController.onDobSelection(pickedDate);
    });
  }
}
