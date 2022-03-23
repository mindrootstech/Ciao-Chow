import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/HomeController.dart';
import 'package:ciao_chow/dashboard/home/ModelPartners.dart';
import 'package:ciao_chow/dashboard/home/PartnersHomeListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  var homeController = Get.put(HomeController());

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    homeController.arrayPartners = <ModelPartners>[];

    var model = ModelPartners();
    model.placeName = "Social";
    model.placeAddress = "Sector-7,chandigarh";
    model.placeDistance = "0.3 miles away";
    model.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    homeController.arrayPartners.add(model);

    model = ModelPartners();
    model.placeName = "JW marriott";
    model.placeAddress = "Sector-35,chandigarh";
    model.placeDistance = "0.9 miles away";
    model.image =
    "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
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


    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
              ),
            ))
        .toList();

    return Scaffold(
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
            // const SizedBox(height: 34),
            SizedBox(
              height: 180,
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
                          decoration: CommonUi.whiteBoxDecoration,
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: SizedBox(
                    height: 140,
                    width: Get.width,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          // autoPlay: false,
                          // aspectRatio: 2.0,
                          // enlargeCenterPage: false,
                          ),
                      items: imageSliders,
                    ),
                  )

                      // Container(
                      //   height: 140,
                      //     margin: const EdgeInsets.only(left: 20, right: 20),
                      //     width: Get.width,
                      //     child: ClipRRect(
                      //       borderRadius: const BorderRadius.all(Radius.circular(10)),
                      //       child: Image.asset(
                      //         CommonUi.setPngImage('slider_image'),
                      //         fit: BoxFit.cover,
                      //       ),
                      //     )),
                      ),
                ],
              ),
            ),
            Container(
              color: AppColors.White,
              // decoration:  CommonUi.whiteBoxDecoration,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
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
                    height: 140,margin: const EdgeInsets.only(left: 10,top: 14),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.arrayPartners.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PartnersHomeListItem(index,homeController);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
