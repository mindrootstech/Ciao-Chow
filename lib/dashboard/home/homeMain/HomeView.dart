import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/DashBoardController.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/LatestCheckInListItem.dart';
import 'package:ciao_chow/dashboard/home/homeMain/PartnersHomeListItem.dart';
import 'package:ciao_chow/dashboard/home/homeMain/scan/ScanCheckInView.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInViewAllView.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/PartnersViewAllView.dart';
import 'package:ciao_chow/notifications/NotificationsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:location/location.dart' as gt;
import 'package:percent_indicator/percent_indicator.dart';
import '../../../constants/MyCarouselSlider.dart';

class HomeView extends StatelessWidget {
  var homeController = Get.put(HomeController());

  // final HomeController homeController = Get.isRegistered<HomeController>()?
  // Get.find<HomeController>() : Get.put(HomeController());
  final gt.Location location = gt.Location();

  // gt.LocationData? locationData;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeController.registerNotification();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.White,
          extendBody: true,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: Platform.isIOS ? 105 : 80),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    color: AppColors.AppColorGrad2,
                    padding: const EdgeInsets.fromLTRB(20, 38, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => homeController.profileData.value.name
                                      .toString() !=
                                  "null"
                              ? Text(
                                  'Hi ' +
                                      homeController.profileData.value.name
                                          .toString(),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interSemiBold,
                                      24.0,
                                      FontWeight.w600,
                                      AppColors.White,
                                      TextDecoration.none),
                                )
                              : const SizedBox(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(NotificationsView(1));
                          },
                          child: SvgPicture.asset(
                            CommonUi.setSvgImage('notification_home'),
                          ),
                        )
                      ],
                    ),
                  ),
                  // edited by Abhijeet Sir(29 Mar 2021)
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          height: 200 / 2 + 20,
                          color: AppColors.AppColorGrad2,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 200 / 2,
                            width: Get.width,
                            decoration: CommonUi.commonBoxDecoration(
                                24.0, AppColors.White),
                          ),
                        ),
                        SizedBox(
                            height: 175,
                            width: Get.width,
                            child: Obx(
                              () => MyCarouselSlider(
                                options: CarouselOptions(
                                  // viewportFraction: 0.9,
                                  viewportFraction: 0.9,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  enlargeCenterPage: true,
                                ),
                                items: homeController.imageSliders.value,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    // height: double.maxFinite,
                    color: AppColors.White,
                    child: Column(
                      children: [
                        Obx(() => Column(children: [
                              homeController.viewShowHide.value == ''
                                  ? GestureDetector(
                                      onTap: () {
                                        homeController.request_permission1();
                                        // getLocation();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 25),
                                        padding: const EdgeInsets.all(12),
                                        width: Get.width,
                                        decoration:
                                            CommonUi.commonBorderDecoration(
                                                34.0, AppColors.AppColorGrad2),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                CommonUi.setSvgImage(
                                                    'current_location')),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'To see Partners around you, please enable\nLocation Permissions',
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interRegular,
                                                  12.0,
                                                  FontWeight.w400,
                                                  AppColors.Black,
                                                  TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container()
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                Utils.getString(context, 'partners_around_you'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    18.0,
                                    FontWeight.w600,
                                    AppColors.Black,
                                    TextDecoration.none),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(PartnersViewAllView());
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 20, top: 0),
                                child: Text(
                                  Utils.getString(context, 'view_all'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interRegular,
                                      12.0,
                                      FontWeight.w400,
                                      AppColors.textFieldsHint,
                                      TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 180,
                          margin: const EdgeInsets.only(left: 20, top: 14),
                          child: Obx(
                            () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController.arrayPartners.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (homeController.arrayPartners[index].id!
                                        .toInt() ==
                                    -1) {
                                  homeController.loadAdsList();
                                }
                                return PartnersHomeListItem(
                                    index, homeController);
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // final DashBoardController dashboardController =
                            //     Get.isRegistered<DashBoardController>()
                            //         ? Get.find<DashBoardController>()
                            //         : Get.put(DashBoardController());

                            try {
                              DashBoardController dashboardController =
                                  Get.find();
                              dashboardController.selectedValue.value = 3;
                              Get.to(DashBoardView(
                                  dashboardController.selectedValue.value));
                            } catch (Exception) {
                              var a = 0;
                            }
                          },
                          child: Container(
                            // color: Colors.transparent,
                            padding: const EdgeInsets.all(15),
                            decoration: CommonUi.commonBoxDecorationAllSides(
                                10.0, AppColors.buttonColor1),
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Utils.getString(
                                          context, 'profile_overview'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interSemiBold,
                                          18.0,
                                          FontWeight.w600,
                                          AppColors.White,
                                          TextDecoration.none),
                                    ),
                                    Text(
                                      Utils.getString(
                                          context, 'view_complete_profile'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.White,
                                          TextDecoration.none),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Utils.getString(
                                          context, 'current_badges'),
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interSemiBold,
                                          14.0,
                                          FontWeight.w600,
                                          AppColors.White,
                                          TextDecoration.none),
                                    ),
                                    Obx(
                                      () => homeController.resLevel.value
                                              .levelNumber.isNotEmpty
                                          ? Text(
                                              'Current Level: LEVEL ' +
                                                  (int.parse(homeController
                                                              .resLevel
                                                              .value
                                                              .levelNumber) -
                                                          1)
                                                      .toString(),
                                              // Utils.getString(context, 'partners_around_you'),
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interMedium,
                                                  12.0,
                                                  FontWeight.w500,
                                                  AppColors.White,
                                                  TextDecoration.none),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => homeController
                                              .arrayBadges.isNotEmpty
                                          ? Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: CachedNetworkImage(
                                                  imageUrl: homeController
                                                      .arrayBadges[
                                                          homeController
                                                                  .arrayBadges
                                                                  .length -
                                                              1]
                                                      .badgeImage!,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: AppColors.White,
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            )
                                          : Text(
                                              Utils.getString(
                                                  context, 'no_badges'),
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interRegular,
                                                  12.0,
                                                  FontWeight.w500,
                                                  AppColors.White,
                                                  TextDecoration.none),
                                            ),
                                    ),
                                    Stack(
                                      children: [
                                        Obx(
                                          () => LinearPercentIndicator(
                                            padding: const EdgeInsets.all(0),
                                            width: 200,
                                            animation: true,
                                            lineHeight: 32.0,
                                            animationDuration: 2500,
                                            percent: homeController.profileData
                                                        .value.totalPoints !=
                                                    null
                                                ?
                                                (homeController.profileData
                                                                .value.totalPoints!
                                                                .toInt() /
                                                            10) /
                                                        (homeController.resLevel
                                                                .value.points /
                                                            10)
                                                : 0.0,
                                            barRadius:
                                                const Radius.circular(30),
                                            progressColor:
                                                AppColors.home_progress,
                                            backgroundColor: AppColors.White,
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Obx(
                                            () => homeController
                                                    .arrayLevels.isNotEmpty
                                                ? Center(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 18.0),
                                                        child: Text(
                                                          homeController
                                                                  .profileData
                                                                  .value
                                                                  .totalPoints
                                                                  .toString() +
                                                              "/" +
                                                              homeController
                                                                  .resLevel
                                                                  .value
                                                                  .points
                                                                  .toString(),
                                                          style: CommonUi
                                                              .customTextStyle1(
                                                                  Fonts
                                                                      .interMedium,
                                                                  12.0,
                                                                  FontWeight
                                                                      .w500,
                                                                  AppColors
                                                                      .Black,
                                                                  TextDecoration
                                                                      .none),
                                                        )),
                                                  )
                                                : const SizedBox(),
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
                                                () => Text(
                                                    "Level " +
                                                        homeController.resLevel
                                                            .value.levelNumber,
                                                    style: CommonUi
                                                        .customTextStyle1(
                                                            Fonts.interMedium,
                                                            12.0,
                                                            FontWeight.w500,
                                                            AppColors.Black,
                                                            TextDecoration
                                                                .none)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Obx(
                          () => homeController.isLoaded.value
                              ? SizedBox(
                                  width: homeController.adWidth,
                                  height: 150,
                                  child: AdWidget(
                                    ad: homeController.inlineAdaptiveAd!,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Obx(
                          () => homeController.arrayLatestCheckIns.isNotEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        Utils.getString(
                                            context, 'latest_check_ins'),
                                        style: CommonUi.customTextStyle1(
                                            Fonts.interSemiBold,
                                            18.0,
                                            FontWeight.w600,
                                            AppColors.redLatest,
                                            TextDecoration.none),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(LatestCheckInViewAllView());
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          Utils.getString(context, 'view_all'),
                                          style: CommonUi.customTextStyle1(
                                              Fonts.interRegular,
                                              12.0,
                                              FontWeight.w400,
                                              AppColors.textFieldsHint,
                                              TextDecoration.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                        Obx(
                          () => homeController.arrayLatestCheckIns.isNotEmpty
                              ? Container(
                                  color: AppColors.White,
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 20),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: homeController
                                        .arrayLatestCheckIns.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return LatestCheckInListItem(
                                          index,
                                          homeController
                                              .arrayLatestCheckIns[index]);
                                    },
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            decoration: CommonUi.commonBoxDecorationGradient(100.0),
            child: FloatingActionButton(
                elevation: 40.0,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(CommonUi.setSvgImage('scan_home')),
                onPressed: () {
                  homeController.getStorage.read('lat') == ''
                      ? _showMyDialog(context)
                      : Get.to(ScanCheckInView());
                }),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: BottomAppBar(
            shape: AutomaticNotchedShape(
                RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(100)),
                const StadiumBorder()),
            child: Row(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() => homeController.homeLoaderShow.value
              ? Container(
                  width: Get.width,
                  color: AppColors.White,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.AppColorGrad2,
                    ),
                  ))
              : Container()),
        ),
      ],
    );
  }

  Future<void> goToSettings() async {}

  _showMyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title:  Text('AlertDialog Title',style: CommonUi.customTextStyle1(Fonts.interSemiBold, 14.0, FontWeight.w500, AppColors.Black, TextDecoration.none),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You haven\'t allow your location permissions yet. Please allow your location permission to Check-In.',
                  style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                      FontWeight.w400, AppColors.Black, TextDecoration.none),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: CommonUi.customTextStyle1(
                    Fonts.interSemiBold,
                    14.0,
                    FontWeight.w500,
                    AppColors.AppColorGrad2,
                    TextDecoration.none),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
