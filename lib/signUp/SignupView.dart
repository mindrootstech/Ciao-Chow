
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      body: Column(
        children: [
          Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 100, left: 20),
              child: Text('Login',
                  style: CommonUi.customTextStyle1(Fonts.interSemiBold, 24.0,
                      FontWeight.w600, AppColors.White, TextDecoration.none))),
          Container(
            width: Get.width,
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: Text('Please login to continue to access our app',
                style: CommonUi.customTextStyle1(Fonts.interRegular, 14.0,
                    FontWeight.w400, AppColors.White, TextDecoration.none)),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.0),
                      topLeft: Radius.circular(24.0))),
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    child: Text('Email',
                        style: CommonUi.customTextStyle1(
                            Fonts.interMedium,
                            14.0,
                            FontWeight.w500,
                            AppColors.Black,
                            TextDecoration.none)),
                  ),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: TextFormField(
                        cursorColor: AppColors.textFieldsHint,
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle:
                          const TextStyle(color: AppColors.textFieldsHint),
                          filled: true,
                          fillColor: AppColors.textFieldsMain,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFieldsMain),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFieldsMain),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                    child: Text('Password',
                        style: CommonUi.customTextStyle1(
                            Fonts.interMedium,
                            14.0,
                            FontWeight.w500,
                            AppColors.Black,
                            TextDecoration.none)),
                  ),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: TextFormField(
                        cursorColor: AppColors.textFieldsHint,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle:
                          const TextStyle(color: AppColors.textFieldsHint),
                          filled: true,
                          fillColor: AppColors.textFieldsMain,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFieldsMain),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFieldsMain),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                    margin: const EdgeInsets.only(top: 10, right: 20),
                    child: Text('Forgot Password?',
                        style: CommonUi.customTextStyle1(
                            Fonts.interRegular,
                            12.0,
                            FontWeight.w400,
                            AppColors.textFieldsHint,
                            TextDecoration.none),
                        textAlign: TextAlign.right),
                  ),

                  const Expanded(child: SizedBox(height: 1,)),
                  Container(
                    child: Center(
                      child: Text('Sign up', style: CommonUi.customTextStyle1(
                          Fonts.interMedium,
                          14.0,
                          FontWeight.w500,
                          AppColors.White,
                          TextDecoration.none)),
                    ),
                    height: 50,width: Get.width,margin: const EdgeInsets.only(left: 40,right: 40,top: 40,bottom: 24), decoration: CommonUi.shadowRoundedContainer,
                  ),

                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 10, right: 20,bottom: 80),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Don’t have an account?  ',
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  14.0,
                                  FontWeight.w600,
                                  AppColors.Black,
                                  TextDecoration.none)),
                          TextSpan(
                              text: 'Sign Up',
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

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}