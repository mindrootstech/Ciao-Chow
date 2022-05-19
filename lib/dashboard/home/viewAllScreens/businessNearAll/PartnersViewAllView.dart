import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/MyCarouselSlider.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/PartnersAllNearController.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/PartnersAroundItemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartnersViewAllView extends StatelessWidget {
  PartnersViewAllView({Key? key}) : super(key: key);
  var partnersAllNearController = Get.put(PartnersAllNearController());

  @override
  Widget build(BuildContext context) {
    partnersAllNearController.searchBusiness.value.text = '';
    partnersAllNearController.searchTxt.value = '';
    partnersAllNearController.getAllBusinessList();
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
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              color: AppColors.AppColorGrad2,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: CommonUi.commonBoxDecorationAllSides(
                            50, AppColors.White),
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                CommonUi.setSvgImage('search_icon')),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextField(
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) {
                                    partnersAllNearController
                                        .getAllBusinessList();
                                  },
                                  controller: partnersAllNearController
                                      .searchBusiness.value,
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.transparent),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.transparent),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.transparent),
                                    ),
                                    hintStyle: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    hintText: Utils.getString(
                                        context, 'search_by_name'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(
                        () => partnersAllNearController
                                .searchTxt.value.isNotEmpty
                            ? const SizedBox()
                            : Container(
                                width: Get.width,
                                margin:
                                    const EdgeInsets.only(left: 20, top: 20),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Obx(
                    () => SizedBox(
                      height:
                          partnersAllNearController.searchBusiness.value.text !=
                                  ''
                              ? 25
                              : 200,
                      child: Stack(
                        children: [
                          Container(
                            height: partnersAllNearController
                                        .searchBusiness.value.text !=
                                    ''
                                ? 0
                                : 200 / 2 + 25,
                            color: AppColors.AppColorGrad2,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: partnersAllNearController
                                          .searchBusiness.value.text !=
                                      ''
                                  ? 15
                                  : 200 / 2,
                              width: Get.width,
                              decoration: CommonUi.commonBoxDecoration(
                                  24.0, AppColors.White),
                            ),
                          ),
                          SizedBox(
                            height: partnersAllNearController
                                        .searchBusiness.value.text !=
                                    ''
                                ? 0
                                : 175,
                            width: Get.width,
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: MyCarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 0.9,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    enlargeCenterPage: true,
                                    // autoPlay: false,
                                    // aspectRatio: 2.0,
                                    // enlargeCenterPage: false,
                                  ),
                                  items: partnersAllNearController
                                      .imageSliders.value,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.White,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(
                            () => Text(
                              partnersAllNearController
                                      .searchTxt.value.isNotEmpty
                                  ? Utils.getString(context, 'filtered_results')
                                  : Utils.getString(
                                      context, 'partners_around_you'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  18,
                                  FontWeight.w600,
                                  AppColors.Black,
                                  TextDecoration.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Obx(
                          () => GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 180,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: partnersAllNearController
                                  .arrayBusinessList.length,
                              itemBuilder: (BuildContext context, int index) {
                                // return PartnersViewAllListItem(index, homeController);
                                return PartnersAroundItemList(
                                    index, partnersAllNearController);
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
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
              child:
                  Obx(() => partnersAllNearController.parentAllLoaderShow.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.AppColorGrad2,
                        ))
                      : Container()),
            ),
          ],
        ),
      ),
    );
  }
}
