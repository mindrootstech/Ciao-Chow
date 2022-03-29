import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/PartnersHomeListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BusinessDetailsView extends StatelessWidget {
  BusinessDetailsView({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 500.0,
                imageUrl: item,
                placeholder: (context, url) => Transform.scale(
                    scale: 0.2,
                    child: const CircularProgressIndicator(
                      strokeWidth: 10.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.White,
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
        centerTitle: true,
        title: Text(
          'JW Marriot',
          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
              FontWeight.w600, AppColors.White, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 250 / 2 + 30,
                    color: AppColors.AppColorGrad2,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 250 / 2,
                      width: Get.width,
                      decoration:
                          CommonUi.commonBoxDecoration(24.0, AppColors.White),
                    ),
                  ),
                  Container(
                      height: 240,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: Get.width,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JW Marriot',
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                        FontWeight.w600, AppColors.Black, TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                          CommonUi.setSvgImage('current_location')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sector-35, chandigarh india',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      '1.5 miles away',
                      style: CommonUi.customTextStyle1(
                          Fonts.interItalic,
                          12.0,
                          FontWeight.w400,
                          AppColors.textFieldsHint,
                          TextDecoration.none),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('email_details')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'jwmarriot@gmail.com',
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
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('phone_details')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '91+748 9867 986',
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
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('phone_details')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '10am - 10:30pm',
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
                    height: 1,
                    color: AppColors.dividerClr,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum.',
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular,
                              12.0,
                              FontWeight.w400,
                              AppColors.textFieldsHint,
                              TextDecoration.none),
                        ),
                        TextSpan(
                            text: '\n' + Utils.getString(context, 'read_more'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interMedium,
                                12.0,
                                FontWeight.w500,
                                AppColors.AppColorGrad2,
                                TextDecoration.none)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 110,
                    decoration: CommonUi.commonBoxDecorationAllSides(
                        10.0, AppColors.buttonColor1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Utils.getString(context, 'total_check_ins'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interMedium,
                                  14.0,
                                  FontWeight.w500,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '30',
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  36.0,
                                  FontWeight.w600,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          color: AppColors.White,
                          height: Get.height,
                          width: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Utils.getString(context, 'your_check_ins'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interMedium,
                                  14.0,
                                  FontWeight.w500,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '5',
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  36.0,
                                  FontWeight.w600,
                                  AppColors.White,
                                  TextDecoration.none),
                            ),
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
                      Text(
                        Utils.getString(context, 'upcoming_events'),
                        style: CommonUi.customTextStyle1(
                            Fonts.interSemiBold,
                            18.0,
                            FontWeight.w600,
                            AppColors.Black,
                            TextDecoration.none),
                      ),
                      Text(
                        Utils.getString(context, 'view_all'),
                        style: CommonUi.customTextStyle1(
                            Fonts.interRegular,
                            12.0,
                            FontWeight.w400,
                            AppColors.textFieldsHint,
                            TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
