import 'package:ciao_chow/authentication/signUp/SignupView.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20,right: 20),
            height: Get.height,
            child: Column(
              children: [
                Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 100, left: 20),
                    child: Text(Utils.getString(context, 'login_heading'),
                        style: CommonUi.customTextStyle1(Fonts.interSemiBold, 24.0,
                            FontWeight.w600, AppColors.White, TextDecoration.none))),
                Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(Utils.getString(context, 'please_login'),
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
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              cursorColor: AppColors.textFieldsHint,
                              decoration: CommonUi.textFieldDecoration(
                                  Utils.getString(context, 'enter_email')),
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
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
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
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(top: 10, right: 20),
                          child: Text(Utils.getString(context, 'forgot_password'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interRegular,
                                  12.0,
                                  FontWeight.w400,
                                  AppColors.textFieldsHint,
                                  TextDecoration.none),
                              textAlign: TextAlign.right),
                        ),
                        const Expanded(
                            child: SizedBox(
                          height: 1,
                        )),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Container(
                            child: Center(
                              child: Text(Utils.getString(context, 'login_heading'),
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
                                left: 40, right: 40, top: 40, bottom: 24),
                            decoration: CommonUi.shadowRoundedContainer,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SignupView());
                          },
                          child: Container(
                            width: Get.width,
                            margin:
                                const EdgeInsets.only(top: 10, right: 20, bottom: 80),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: Utils.getString(
                                          context, 'dont_have_account'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interSemiBold,
                                          14.0,
                                          FontWeight.w600,
                                          AppColors.Black,
                                          TextDecoration.none)),
                                  TextSpan(
                                      text: Utils.getString(context, 'sign_up'),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
