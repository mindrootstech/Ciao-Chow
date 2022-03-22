import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// class SignupView extends StatelessWidget with InputValidationMixin {
class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      body: Form(
        child: Column(
          children: [
            Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: Text('Create account',
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 24.0,
                        FontWeight.w600, AppColors.White, TextDecoration.none))),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text('Please register to access our app',
                  style: CommonUi.customTextStyle1(Fonts.interRegular, 14.0,
                      FontWeight.w400, AppColors.White, TextDecoration.none)),
            ),
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 25),
              child: Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.whiteBorder,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: SvgPicture.asset(
                    CommonUi.setSvgImage('default_image'),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.White,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.0),
                        topLeft: Radius.circular(24.0))),
                margin: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(Utils.getString(
                            context, 'name'),
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
                                return 'Please enter email';
                              }
                              return null;
                            },
                            cursorColor: AppColors.textFieldsHint,
                            decoration: CommonUi.textFieldDecoration(Utils.getString(
                                context, 'enter_name')),
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
                        child: Text(Utils.getString(
                            context, 'email'),
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
                                return 'Please enter password';
                              }
                              return null;
                            },
                            cursorColor: AppColors.textFieldsHint,
                            decoration: CommonUi.textFieldDecoration(Utils.getString(
                                context, 'email_hint')),
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
                        child: Text(Utils.getString(
                            context, 'mobile_number'),
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
                            cursorColor: AppColors.textFieldsHint,
                            decoration: CommonUi.textFieldDecoration(Utils.getString(
                                context, 'mobile_hint')),
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
                              child: Text(Utils.getString(
                                  context, 'dob'),
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
                              child: Text(Utils.getString(
                                  context, 'gender'),
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
                            child: Container(
                              margin:
                              const EdgeInsets.only(top: 10, left: 20, right: 8),
                              child: TextFormField(
                                  cursorColor: AppColors.textFieldsHint,
                                  decoration:CommonUi.textFieldDecoration(Utils.getString(
                                      context, 'dob_hint')),
                                  style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.Black,
                                    TextDecoration.none,
                                  )),

                            ),
                          ),

                          Expanded(
                            child: Container(
                              margin:
                              const EdgeInsets.only(top: 10, left: 8, right: 20),
                              child: TextFormField(
                                  cursorColor: AppColors.textFieldsHint,
                                  decoration: CommonUi.textFieldDecoration(Utils.getString(
                                      context, 'gender_hint')),
                                  style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.Black,
                                    TextDecoration.none,
                                  )),
                            ),
                          ),
                        ],
                      ),


                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(Utils.getString(
                            context, 'password'),
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
                            cursorColor: AppColors.textFieldsHint,
                            decoration: CommonUi.textFieldDecoration(Utils.getString(
                                context, 'enter_password')),
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
                      Container(
                        child: Center(
                          child: Text( Utils.getString(
                              context, 'sign_up_small'), style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              14.0,
                              FontWeight.w500,
                              AppColors.White,
                              TextDecoration.none)),
                        ),
                        height: 50,width: Get.width,margin: const EdgeInsets.only(left: 40,right: 40,top: 90,bottom: 24), decoration: CommonUi.shadowRoundedContainer,
                      ),

                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 10, right: 20,bottom: 70),
                        child: GestureDetector(
                          onTap: (){
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
                                    text: Utils.getString(
                                        context, 'signin'),
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
}

// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;
//
//   bool isEmailValid(String email) {
//     Pattern pattern =
//         r '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     return regex.hasMatch(email);
//   }
// }
