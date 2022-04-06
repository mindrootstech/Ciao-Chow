import 'package:ciao_chow/authentication/forgot/ForgotPasswordController.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,color: AppColors.White,),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 40, left: 20),
                        child: Text(
                            Utils.getString(context, 'forgot_password_screen'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interSemiBold, 24.0,
                                FontWeight.w600, AppColors.White,
                                TextDecoration.none))),
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(Utils.getString(context, 'please_enter_email'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular, 14.0,
                              FontWeight.w400, AppColors.White,
                              TextDecoration.none)),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration:
                            CommonUi.commonBoxDecoration(24.0, AppColors.White),
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            TextFormField(
                                validator: (value) {
                                  if (value != null || value!.isNotEmpty) {
                                    if (CommonUi.emailValid(
                                            forgotPasswordController
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
                                controller: forgotPasswordController
                                    .emailController.value,
                                cursorColor: AppColors.textFieldsHint,
                                decoration: CommonUi.textFieldDecoration(
                                    Utils.getString(context, 'enter_email')),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.Black,
                                    TextDecoration.none)),
                            const Expanded(
                                child: SizedBox(
                              height: 1,
                            )),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                    forgotPasswordController
                                        .forgotApiImplementation(
                                            forgotPasswordController
                                                .emailController.value.text
                                                .trim())
                                        .then((value) {
                                      if (value.status!) {
                                        forgotPasswordController
                                            .forgotLoaderShow.value = false;
                                        CommonUi.showToast(value.text!);
                                      } else {
                                        CommonUi.showToast(value.text!);
                                        forgotPasswordController
                                            .forgotLoaderShow.value = false;
                                      }
                                    });
                                    forgotPasswordController
                                        .forgotLoaderShow.value = true;
                                }
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                      Utils.getString(context, 'done'),
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
                                    left: 20, right: 20, top: 40, bottom: 24),
                                decoration: CommonUi.shadowRoundedContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Obx(() => forgotPasswordController.forgotLoaderShow.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.AppColorGrad2,
                      ))
                    : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
