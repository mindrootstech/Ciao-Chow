import 'package:ciao_chow/authentication/forgot/ForgotPasswordView.dart';
import 'package:ciao_chow/authentication/signIn/SignInController.dart';
import 'package:ciao_chow/authentication/signUp/SignupView.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  var signInController = Get.put(SignInController());

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
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        decoration: CommonUi.commonBoxDecoration(24.0,AppColors.White),
                        margin: const EdgeInsets.only(top:30),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(Utils.getString(context, 'email'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      14.0,
                                      FontWeight.w500,
                                      AppColors.Black,
                                      TextDecoration.none)),
                            ),

                            const SizedBox(height: 10),
                            TextFormField(
                                validator: (value) {
                                  if (value != null || value!.isNotEmpty) {
                                    if (CommonUi.emailValid(signInController
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
                                },
                                controller: signInController.emailController.value,
                                cursorColor: AppColors.textFieldsHint,
                                decoration: CommonUi.textFieldDecoration(
                                    Utils.getString(context, 'enter_email')),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.Black,
                                    TextDecoration.none)),

                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(Utils.getString(context, 'password'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      14.0,
                                      FontWeight.w500,
                                      AppColors.Black,
                                      TextDecoration.none)),
                            ),

                            const SizedBox(height: 10),

                            Obx(
                              () => Stack(
                                children: [
                                  TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter password';
                                        }
                                        return null;
                                      },
                                      obscureText : signInController
                                          .passwordVisibleLogin.value,
                                      controller: signInController.passwordController.value,
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
                                          signInController.passwordVisibleLogin
                                              .value ==
                                              true
                                              ? signInController
                                              .passwordVisibleLogin
                                              .value = false
                                              : signInController
                                              .passwordVisibleLogin
                                              .value = true;
                                        },
                                        child: Container(
                                          color: AppColors.transparent,
                                          padding: const EdgeInsets.all(20),
                                          child: signInController
                                              .passwordVisibleLogin.value ==
                                              true
                                              ? SvgPicture.asset(
                                              CommonUi.setSvgImage(
                                                  'password_hide'))
                                              : SvgPicture.asset(
                                              CommonUi.setSvgImage(
                                                  'password_show')),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(ForgotPasswordView());
                                },
                                child: Text(Utils.getString(context, 'forgot_password'),
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none)),
                              ),
                            ),
                            const Expanded(
                                child: SizedBox(
                              height: 1,
                            )),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()){
                                  if (signInController.passwordController.value.text.length < 6 ) {
                                    CommonUi.showToast("password is too short.");
                                    return;
                                  }

                                  signInController.logInImplementation(
                                    signInController.emailController.value.text.trim(),
                                    signInController.passwordController.value.text.trim()).
                                  then((value) {
                                    if (value.status!) {
                                      signInController.getStorage.write('token', value.data!.token);
                                      signInController.getStorage.write("stripeCustomerId", value.data!.stripeId);
                                      signInController.loginLoaderShow.value = false;
                                      signInController.getStorage.write('isRegisterOrLoggedIn', true);

                                      Get.off(DashBoardView());
                                      signInController.emailController.value.text = '';
                                      signInController.passwordController.value.text = '';
                                      // showToast(value.message);
                                    } else {
                                      CommonUi.showToast(value.message!);
                                      signInController.loginLoaderShow.value = false;
                                    }
                                  });
                                  signInController.loginLoaderShow.value = true;

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
                                    left: 20, right: 20, top: 40, bottom: 24),
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
                                    const EdgeInsets.only(top: 10, bottom: 80),
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

              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Obx(() => signInController.loginLoaderShow.value
                    ? const Center(child: CircularProgressIndicator(color: AppColors.AppColorGrad2,))
                    : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
