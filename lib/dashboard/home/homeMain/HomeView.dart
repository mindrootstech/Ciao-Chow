import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/LatestCheckInListItem.dart';
import 'package:ciao_chow/dashboard/home/homeMain/PartnersHomeListItem.dart';
import 'package:ciao_chow/dashboard/home/homeMain/ScanCheckInView.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInViewAllView.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/PartnersViewAllView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as gt;
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  var homeController = Get.put(HomeController());
  final gt.Location location = gt.Location();

  // gt.LocationData? locationData;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeController.homeLoaderShow.value = true;
    getLocation();

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.AppColorGrad2,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 38, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi William',
                        style: CommonUi.customTextStyle1(
                            Fonts.interSemiBold,
                            24.0,
                            FontWeight.w600,
                            AppColors.White,
                            TextDecoration.none),
                      ),
                      SvgPicture.asset(
                        CommonUi.setSvgImage('notification_home'),
                      )
                    ],
                  ),
                ),

                Container(
                  color: AppColors.AppColorGrad2,
                  height: 15,
                ),

                // edited by Abhijeet Sir(29 Mar 2021)

                SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      Container(
                        height: 190 / 2 + 20,
                        color: AppColors.AppColorGrad2,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 190 / 2,
                          width: Get.width,
                          decoration: CommonUi.commonBoxDecoration(
                              24.0, AppColors.White),
                        ),
                      ),
                      Container(
                          height: 165,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Obx(
                                () => CarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    enlargeCenterPage: true,

                                    // autoPlay: false,
                                    // aspectRatio: 2.0,
                                    // enlargeCenterPage: false,
                                  ),
                                  items: homeController.imageSliders.value,
                                ),
                              ))),
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
                                      getLocation();
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
                                          SvgPicture.asset(CommonUi.setSvgImage(
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
                              margin: const EdgeInsets.only(right: 20, top: 0),
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
                        height: 142,
                        margin: const EdgeInsets.only(left: 20, top: 14),
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.arrayPartners.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PartnersHomeListItem(
                                  index, homeController);
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: CommonUi.commonBoxDecorationAllSides(
                            10.0, AppColors.buttonColor1),
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Utils.getString(context, 'profile_overview'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Utils.getString(context, 'current_badges'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interSemiBold,
                                      14.0,
                                      FontWeight.w600,
                                      AppColors.White,
                                      TextDecoration.none),
                                ),
                                Obx(
                                  () => Text(
                                    'Current Level: LEVEL ' +
                                        homeController.profileData.value.level
                                            .toString(),
                                    // Utils.getString(context, 'partners_around_you'),
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interMedium,
                                        12.0,
                                        FontWeight.w500,
                                        AppColors.White,
                                        TextDecoration.none),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    CommonUi.setSvgImage('bronze_medal')),
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
                                            ? homeController
                                                .profileData.value.totalPoints!
                                                .toDouble()
                                            : 0.0,
                                        barRadius: const Radius.circular(30),
                                        progressColor: AppColors.home_progress,
                                        backgroundColor: AppColors.White,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Obx(
                                        () => Center(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                homeController.profileData.value
                                                        .totalPoints
                                                        .toString() +
                                                    '/100',
                                                style:
                                                    CommonUi.customTextStyle1(
                                                        Fonts.interMedium,
                                                        12.0,
                                                        FontWeight.w500,
                                                        AppColors.White,
                                                        TextDecoration.none),
                                              )),
                                        ),
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
                                          child: Text('LEVEL 1',
                                              // Utils.getString(context, 'partners_around_you'),
                                              style: CommonUi.customTextStyle1(
                                                  Fonts.interMedium,
                                                  12.0,
                                                  FontWeight.w500,
                                                  AppColors.grey_level,
                                                  TextDecoration.none)),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              Utils.getString(context, 'latest_check_ins'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  18.0,
                                  FontWeight.w600,
                                  AppColors.home_progress,
                                  TextDecoration.none),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(LatestCheckInViewAllView());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
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
                      Obx(
                        () => Container(
                          color: AppColors.White,
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 100),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                homeController.arrayLatestCheckIns.length,
                            itemBuilder: (BuildContext context, int index) {
                              return LatestCheckInListItem(
                                  index, homeController);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: Container(
            decoration: CommonUi.commonBoxDecorationGradient(100.0),
            child: FloatingActionButton(
                elevation: 40.0,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(CommonUi.setSvgImage('scan_home')),
                onPressed: () {
                  Get.to(ScanCheckInView());
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

  Future<void> getLocation() async {
    try {
      gt.Location location = gt.Location();

      bool _serviceEnabled;
      gt.PermissionStatus _permissionGranted;
      gt.LocationData locationData;

      // _serviceEnabled = await location.serviceEnabled();
      // if (!_serviceEnabled) {
      //   _serviceEnabled = await location.requestService();
      //   if (!_serviceEnabled) {
      //     return;
      //   }
      // }

      locationData = await location.getLocation();
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == gt.PermissionStatus.denied ||
          _permissionGranted == gt.PermissionStatus.deniedForever) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != gt.PermissionStatus.granted) {
          homeController.getHomeData('', '');
          homeController.getStorage.write('lat', '');
          homeController.getStorage.write('long', '');
          homeController.homeLoaderShow.value = true;
        }
      } else {
        homeController.getHomeData(locationData.latitude!.toString(),
            locationData.longitude!.toString());

        homeController.getStorage
            .write('lat', locationData.latitude!.toString());
        homeController.getStorage
            .write('long', locationData.longitude!.toString());
        homeController.homeLoaderShow.value = true;
      }
    } catch (e) {
      homeController.getHomeData('', '');
      homeController.getStorage.write('lat', '');
      homeController.getStorage.write('long', '');
      homeController.homeLoaderShow.value = true;
    }
  }

  void goToSettings() {}
}
