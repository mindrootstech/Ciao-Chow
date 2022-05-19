import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/BadgesListItem.dart';
import 'package:ciao_chow/dashboard/home/homeMain/LatestCheckInListItem.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInViewAllView.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:ciao_chow/dashboard/profile/editProfile/EditProfileView.dart';
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
                  margin: const EdgeInsets.only(left: 20, right: 20),
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
                                    child: Obx(
                                      () => profileController.profileData.value
                                                  .profileImage
                                                  .toString() !=
                                              'null'
                                          ? ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              child: profileController
                                                          .profileData
                                                          .value
                                                          .profileImage ==
                                                      ''
                                                  ? SvgPicture.asset(
                                                      CommonUi.setSvgImage(
                                                          'default_image'),
                                                      // fit: BoxFit.cover,
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
                                                                  color: AppColors
                                                                      .AppColorGrad2,
                                                                ),
                                                              )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              child: SvgPicture.asset(
                                                CommonUi.setSvgImage(
                                                    'default_image'),
                                                // fit: BoxFit.cover,
                                              )),
                                    ),
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
                          Expanded(
                            child: Container(
                              // width: Get.width,
                              margin: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => profileController
                                                .profileData.value.name
                                                .toString() !=
                                            'null'
                                        ? Text(
                                            profileController
                                                .profileData.value.name!,
                                            style: CommonUi.customTextStyle1(
                                                Fonts.interSemiBold,
                                                18.0,
                                                FontWeight.w600,
                                                AppColors.Black,
                                                TextDecoration.none),
                                            textAlign: TextAlign.start,
                                          )
                                        : const SizedBox(),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Obx(
                                    () => profileController
                                                .profileData.value.level !=
                                            null
                                        ? Text(
                                            'Current Level: LEVEL ' +
                                                (int.parse(profileController
                                                            .resLevel
                                                            .value
                                                            .levelNumber) -
                                                        1)
                                                    .toString(),
                                            style: CommonUi.customTextStyle1(
                                                Fonts.interMedium,
                                                14.0,
                                                FontWeight.w500,
                                                AppColors.Black,
                                                TextDecoration.none),
                                          )
                                        : const SizedBox(),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Stack(
                                    children: [
                                      Obx(
                                        () => Container(
                                          decoration: CommonUi
                                              .shadowWhiteContainerRounded,
                                          child: LinearPercentIndicator(
                                            padding: const EdgeInsets.all(0),
                                            animation: true,
                                            lineHeight: 32.0,
                                            animationDuration: 2500,
                                            percent: profileController
                                                        .profileData
                                                        .value
                                                        .totalPoints !=
                                                    null
                                                ? (profileController.profileData
                                                            .value.totalPoints!
                                                            .toInt() /
                                                        10) /
                                                    (profileController.resLevel
                                                            .value.points /
                                                        10)
                                                : 0.0,
                                            barRadius:
                                                const Radius.circular(30),
                                            progressColor: AppColors.redLatest,
                                            backgroundColor: AppColors.White,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Obx(
                                                () => profileController
                                                            .profileData
                                                            .value
                                                            .totalPoints !=
                                                        null
                                                    ? Text(
                                                        profileController
                                                                .profileData
                                                                .value
                                                                .totalPoints
                                                                .toString() +
                                                            "/" +
                                                            profileController
                                                                .resLevel
                                                                .value
                                                                .points
                                                                .toString(),
                                                        style: CommonUi
                                                            .customTextStyle1(
                                                                Fonts
                                                                    .interMedium,
                                                                12.0,
                                                                FontWeight.w500,
                                                                AppColors.Black,
                                                                TextDecoration
                                                                    .none),
                                                      )
                                                    : const SizedBox(),
                                              )),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 18.0),
                                            child: Obx(
                                              () => profileController
                                                      .resLevel
                                                      .value
                                                      .levelNumber
                                                      .isNotEmpty
                                                  ? Text(
                                                      "Level " +
                                                          profileController
                                                              .resLevel
                                                              .value
                                                              .levelNumber,
                                                      style: CommonUi
                                                          .customTextStyle1(
                                                              Fonts.interMedium,
                                                              12.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .grey_level,
                                                              TextDecoration
                                                                  .none))
                                                  : const SizedBox(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(EditProfileView());
                                    },
                                    child: Container(
                                      width: Get.width,
                                      margin: const EdgeInsets.only(right: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(CommonUi.setSvgImage(
                                              'edit_profile')),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text('Edit',
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interRegular,
                                                  12.0,
                                                  FontWeight.w400,
                                                  AppColors.redEdit,
                                                  TextDecoration.none)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          'Your badges',
                          style: CommonUi.customTextStyle1(
                              Fonts.interSemiBold,
                              18.0,
                              FontWeight.w600,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 30,
                        child: Obx(
                          () => profileController.arrayBadges.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      profileController.arrayBadges.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return BadgesListItem(index,
                                        profileController.arrayBadges[index]);
                                  },
                                )
                              : Text(
                                  Utils.getString(context, 'no_badges'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interRegular,
                                      12.0,
                                      FontWeight.w500,
                                      AppColors.Black,
                                      TextDecoration.none),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => profileController.arrayLatestCheckIns.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Latest Check-ins',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interSemiBold,
                                        18.0,
                                        FontWeight.w600,
                                        AppColors.Black,
                                        TextDecoration.none),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(LatestCheckInViewAllView());
                                    },
                                    child: Text(
                                      'View All',
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.Black,
                                          TextDecoration.none),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                      Obx(
                        () => profileController.arrayLatestCheckIns.isNotEmpty
                            ? Container(
                                color: AppColors.White,
                                margin:
                                    const EdgeInsets.only(top: 16, bottom: 100),
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: profileController
                                      .arrayLatestCheckIns.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return LatestCheckInListItem(
                                        index,
                                        profileController
                                            .arrayLatestCheckIns[index]);
                                  },
                                ),
                              )
                            : const SizedBox(),
                      )
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
              ? Container(
                  width: Get.width,
                  color: AppColors.White,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.AppColorGrad2,
                  )),
                )
              : Container()),
        ),
      ],
    );
  }
}
