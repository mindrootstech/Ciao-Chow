import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppColorGrad2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(top: 70, left: 20),
                  child: Text(Utils.getString(context, 'forgot_password_screen'),
                      style: CommonUi.customTextStyle1(Fonts.interSemiBold, 24.0,
                          FontWeight.w600, AppColors.White, TextDecoration.none))),
              Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: Text(Utils.getString(context, 'please_enter_email'),
                    style: CommonUi.customTextStyle1(Fonts.interRegular, 14.0,
                        FontWeight.w400, AppColors.White, TextDecoration.none)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  decoration: CommonUi.commonBoxDecoration(24.0,AppColors.White),
                  margin: const EdgeInsets.only(top: 15),
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

                      const SizedBox(height: 20),
                      const Expanded(
                          child: SizedBox(
                            height: 1,
                          )),
                      Container(
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
                            left: 20, right: 20, top: 40, bottom: 24),
                        decoration: CommonUi.shadowRoundedContainer,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
