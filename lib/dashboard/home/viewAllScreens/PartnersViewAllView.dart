import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/PartnersAroundItemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartnersViewAllView extends StatelessWidget {
  PartnersViewAllView({Key? key}) : super(key: key);
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
            );
          },
        ),
        centerTitle: true,
        title: Text(
          Utils.getString(context, 'featured_partners'),
          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
              FontWeight.w600, AppColors.White, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.AppColorGrad2,
              child: Column(
                children: [
                  Container(
                    decoration: CommonUi.commonBoxDecorationAllSides(
                        50, AppColors.White),
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(CommonUi.setSvgImage('search_icon')),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.transparent),
                                  //  when the TextFormField in unfocused
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.transparent),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.transparent),
                                  //  when the TextFormField in unfocused
                                ),
                                hintStyle: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    14.0,
                                    FontWeight.w400,
                                    AppColors.textFieldsHint,
                                    TextDecoration.none),
                                hintText: "Type in your text",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      Utils.getString(context, 'featured_partners'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interSemiBold,
                          18,
                          FontWeight.w600,
                          AppColors.White,
                          TextDecoration.none),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
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
                          color: AppColors.AppColorGrad2,
                          child: Container(
                            width: Get.width,
                            decoration: CommonUi.commonBoxDecoration(
                                24.0, AppColors.White),
                          ),
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
              margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Utils.getString(context, 'partners_around_you'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interSemiBold,
                          18,
                          FontWeight.w600,
                          AppColors.Black,
                          TextDecoration.none),
                    ),
                  ),
                  const SizedBox(height: 14,),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,mainAxisExtent: 200,
                              mainAxisSpacing: 12,),
                      itemCount: homeController.arrayPartners.length,
                      itemBuilder: (BuildContext context, int index) {
                        // return PartnersViewAllListItem(index, homeController);
                        return PartnersAroundItemList(index, homeController);
                      }),

                  const SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
