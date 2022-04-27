import 'dart:io';

import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'settings/SettingsMainView.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  var profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.AppColorGrad2,
            elevation: 0,
            title: Text(Utils.getString(context, 'profile')),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(SettingsMainView());
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  child: SvgPicture.asset(
                    CommonUi.setSvgImage('settings_icon'),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: AppColors.White,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.redBorder2,
                                    width: 2,
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
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.redBorder1,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    // child: Obx(
                                    //       () => ClipRRect(
                                    //     borderRadius: const BorderRadius.all(
                                    //         Radius.circular(100)),
                                    //     child: signUpController.imagePath.value == ''
                                    //         ? SvgPicture.asset(
                                    //       CommonUi.setSvgImage('default_image'),
                                    //       // fit: BoxFit.cover,
                                    //     )
                                    //         : Image.file(
                                    //       File(signUpController.imagePath.value),
                                    //       fit: BoxFit.cover,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                              // Positioned(
                              //     left: 0,
                              //     right: 0,
                              //     bottom: 0,
                              //     child: SizedBox(
                              //       width: 24,
                              //       height: 24,
                              //       child: SvgPicture.asset(
                              //           CommonUi.setSvgImage('profile_edit')),
                              //     ))
                            ],
                          ),
                          Container(
                            // width: Get.width,
                            margin: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'David William',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interSemiBold,
                                      18.0,
                                      FontWeight.w600,
                                      AppColors.Black,
                                      TextDecoration.none),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Current Level: LEVEL 1',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      14.0,
                                      FontWeight.w500,
                                      AppColors.Black,
                                      TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Stack(
                                  children: [
                                    LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      width: 200,
                                      animation: true,
                                      lineHeight: 32.0,
                                      animationDuration: 2500,
                                      percent: 0.5,
                                      barRadius: const Radius.circular(30),
                                      progressColor: AppColors.home_progress,
                                      backgroundColor: AppColors.blackLight,
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 18.0),
                                            child: Text(
                                              '50' + '/100',
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interMedium,
                                                  12.0,
                                                  FontWeight.w500,
                                                  AppColors.Black,
                                                  TextDecoration.none),
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 18.0),
                                          child: Text('Level2',
                                              // Utils.getString(context, 'partners_around_you'),
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interMedium,
                                                  12.0,
                                                  FontWeight.w500,
                                                  AppColors.Black,
                                                  TextDecoration.none)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  color: Colors.amber,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          CommonUi.setSvgImage('edit_profile')),
                                      Text(
                                        'Edit',
                                        style: CommonUi.customTextStyle1(
                                            Fonts.interRegular,
                                            12.0,
                                            FontWeight.w400,
                                            AppColors.redEdit,
                                            TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24,),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          'Your badges',
                          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                              FontWeight.w600, AppColors.Black, TextDecoration.none),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          SvgPicture.asset(CommonUi.setSvgImage('bronze_medal')),
                          SvgPicture.asset(CommonUi.setSvgImage('bronze_medal')),
                          SvgPicture.asset(CommonUi.setSvgImage('bronze_medal')),
                          SvgPicture.asset(CommonUi.setSvgImage('bronze_medal')),
                        ],
                      ),
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Check-ins',
                            style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                                FontWeight.w600, AppColors.Black, TextDecoration.none),
                          ),
                          Text(
                            'View All',
                            style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                                FontWeight.w400, AppColors.Black, TextDecoration.none),
                          ),
                        ],
                      ),
                    ],
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
          child: Obx(() => profileController.loaderProfile.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.AppColorGrad2,
                ))
              : Container()),
        ),
      ],
    );
  }
}
