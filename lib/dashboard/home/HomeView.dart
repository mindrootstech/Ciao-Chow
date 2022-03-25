import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/HomeController.dart';
import 'package:ciao_chow/dashboard/home/LatestCheckInListItem.dart';
import 'package:ciao_chow/dashboard/home/ModelLatestCheckIns.dart';
import 'package:ciao_chow/dashboard/home/ModelPartners.dart';
import 'package:ciao_chow/dashboard/home/PartnersHomeListItem.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/PartnersViewAllView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  var homeController = Get.put(HomeController());

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    homeController.arrayPartners = <ModelPartners>[];
    homeController.arrayLatestCheckIns = <ModelLatestCheckIns>[];

    var model = ModelPartners();
    model.placeName = "Social";
    model.placeAddress = "Sector-7,chandigarh";
    model.placeDistance = "0.3 miles away";
    model.image =
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80';
    homeController.arrayPartners.add(model);

    model = ModelPartners();
    model.placeName = "JW marriott";
    model.placeAddress = "Sector-35,chandigarh";
    model.placeDistance = "0.9 miles away";
    model.image =
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80";
    homeController.arrayPartners.add(model);

    model = ModelPartners();
    model.placeName = "Brew Bros";
    model.placeAddress = "Sector-7,chandigarh";
    model.placeDistance = "0.10 miles away";
    model.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayPartners.add(model);

    model = ModelPartners();
    model.placeName = "Culture";
    model.placeAddress = "Sector-26,chandigarh";
    model.placeDistance = "0.5 miles away";
    model.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayPartners.add(model);

    model = ModelPartners();
    model.placeName = "Culture";
    model.placeAddress = "Sector-26,chandigarh";
    model.placeDistance = "0.5 miles away";
    model.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayPartners.add(model);

    var modelLatest = ModelLatestCheckIns();
    modelLatest.placeName = "Social";
    modelLatest.placeAddress = "Sector-7,chandigarh";
    modelLatest.date = "23-Jan-2022";
    modelLatest.time = "10:00PM";
    modelLatest.image =
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80';
    homeController.arrayLatestCheckIns.add(modelLatest);

    modelLatest = ModelLatestCheckIns();
    modelLatest.placeName = "JW marriott";
    modelLatest.placeAddress = "Sector-35,chandigarh";
    modelLatest.date = "23-Jan-2022";
    modelLatest.time = "10:00PM";
    modelLatest.image =
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80";
    homeController.arrayLatestCheckIns.add(modelLatest);

    modelLatest = ModelLatestCheckIns();
    modelLatest.placeName = "Brew Bros";
    modelLatest.placeAddress = "Sector-7,chandigarh";
    modelLatest.date = "23-Jan-2022";
    modelLatest.time = "10:00PM";
    modelLatest.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayLatestCheckIns.add(modelLatest);

    modelLatest = ModelLatestCheckIns();
    modelLatest.placeName = "Culture";
    modelLatest.placeAddress = "Sector-26,chandigarh";
    modelLatest.date = "23-Jan-2022";
    modelLatest.time = "10:00PM";
    modelLatest.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayLatestCheckIns.add(modelLatest);

    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 1000.0,
                imageUrl: item,
                placeholder: (context, url) => Transform.scale(
                    scale: 0.2,
                    child: const CircularProgressIndicator(
                      strokeWidth: 10.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              // Image.network(item, fit: BoxFit.cover, width: 1000.0),
            ))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.AppColorGrad2,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppColorGrad2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi William',
              style: CommonUi.customTextStyle1(Fonts.interSemiBold, 24.0,
                  FontWeight.w600, AppColors.White, TextDecoration.none),
            ),
            SvgPicture.asset(
              CommonUi.setSvgImage('notification_home'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 170,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColors.AppColorGrad2,
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: Get.width,
                          decoration: CommonUi.commonBoxDecoration(
                              24.0, AppColors.White),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 160,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: Get.width,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              // autoPlay: false,
                              // aspectRatio: 2.0,
                              // enlargeCenterPage: false,
                            ),
                            items: imageSliders,
                          ))),
                ],
              ),
            ),
            Container(
              color: AppColors.White,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 0),
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
                          margin: const EdgeInsets.only(right: 20, top: 20),
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
                    height: 140,
                    margin: const EdgeInsets.only(left: 20, top: 14),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.arrayPartners.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PartnersHomeListItem(index, homeController);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: CommonUi.commonBoxDecorationAllSides(
                        10.0, AppColors.buttonColor1),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile Overview',
                              // Utils.getString(context, 'partners_around_you'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  18.0,
                                  FontWeight.w600,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
                            Text(
                              'View Complete profile',
                              // Utils.getString(context, 'partners_around_you'),
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
                              'Current badges',
                              // Utils.getString(context, 'partners_around_you'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  14.0,
                                  FontWeight.w600,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
                            Text(
                              'Current Level: LEVEL 1',
                              // Utils.getString(context, 'partners_around_you'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interMedium,
                                  12.0,
                                  FontWeight.w500,
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
                            SvgPicture.asset(
                                CommonUi.setSvgImage('bronze_medal')),
                            Stack(
                              children: [
                                LinearPercentIndicator(
                                  padding: const EdgeInsets.all(0),
                                  width: 200,
                                  animation: true,
                                  lineHeight: 32.0,
                                  animationDuration: 2500,
                                  percent: 0.9,
                                  barRadius: const Radius.circular(30),
                                  progressColor: AppColors.home_progress,
                                  backgroundColor: AppColors.White,
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
                                          '35/100',
                                          style: CommonUi.customTextStyle1(
                                              Fonts.interMedium,
                                              12.0,
                                              FontWeight.w500,
                                              AppColors.White,
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
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 0),
                        child: Text(
                          Utils.getString(context, 'latest_check_ins'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interSemiBold,
                              18.0,
                              FontWeight.w600,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
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
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.arrayLatestCheckIns.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LatestCheckInListItem(index, homeController);
                      },
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
            onPressed: () {}),
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
    );
  }
}
