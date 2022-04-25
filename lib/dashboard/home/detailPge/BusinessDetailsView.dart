import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/MyCarouselSlider.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/detailPge/BusinessDetailsController.dart';
import 'package:ciao_chow/dashboard/home/detailPge/OpeningHoursItem.dart';
import 'package:ciao_chow/dashboard/home/detailPge/UpcomingEventBusinessItem.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BusinessDetailsView extends StatelessWidget {
  String id;

  BusinessDetailsView(this.id, {Key? key}) : super(key: key);
  var businessDetailsController = Get.put(BusinessDetailsController());

  @override
  Widget build(BuildContext context) {
    apiImplementation();

    return Stack(
      children: [
        Scaffold(
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            centerTitle: true,
            title: Obx(
              () => businessDetailsController.getBusiness.value.businessName
                          .toString() !=
                      'null'
                  ? Text(
                      businessDetailsController.getBusiness.value.businessName!,
                      style: CommonUi.customTextStyle1(
                          Fonts.interSemiBold,
                          18.0,
                          FontWeight.w600,
                          AppColors.White,
                          TextDecoration.none),
                    )
                  : const SizedBox(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 200 / 2 + 30,
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
                          // margin: const EdgeInsets.only(left: 20, right: 20),
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              child: Obx(
                                () => MyCarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 0.9,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    enlargeCenterPage: true,
                                  ),
                                  items: businessDetailsController
                                      .imageSliders.value,
                                ),
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
                      Obx(
                        () => businessDetailsController
                                    .getBusiness.value.businessName
                                    .toString() !=
                                'null'
                            ? Text(
                                businessDetailsController
                                    .getBusiness.value.businessName!,
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    18.0,
                                    FontWeight.w600,
                                    AppColors.Black,
                                    TextDecoration.none),
                              )
                            : const SizedBox(),
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
                            child: Obx(
                              () => businessDetailsController
                                          .getBusiness.value.address
                                          .toString() !=
                                      'null'
                                  ? Text(
                                      businessDetailsController
                                          .getBusiness.value.address!,
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.textFieldsHint,
                                          TextDecoration.none),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Obx(
                          () => businessDetailsController
                                      .getBusiness.value.distance
                                      .toString() !=
                                  'null'
                              ? Text(
                                  businessDetailsController
                                          .getBusiness.value.distance! +
                                      ' miles away',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interItalic,
                                      12.0,
                                      FontWeight.w400,
                                      AppColors.textFieldsHint,
                                      TextDecoration.none),
                                )
                              : const SizedBox(),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              CommonUi.setSvgImage('email_details')),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Obx(
                              () => businessDetailsController
                                          .getBusiness.value.emailAddress
                                          .toString() !=
                                      'null'
                                  ? Text(
                                      businessDetailsController
                                          .getBusiness.value.emailAddress!,
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.textFieldsHint,
                                          TextDecoration.none),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              CommonUi.setSvgImage('phone_details')),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Obx(
                              () => businessDetailsController
                                          .getBusiness.value.contactNumber
                                          .toString() !=
                                      'null'
                                  ? Text(
                                      businessDetailsController
                                          .getBusiness.value.contactNumber!,
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interRegular,
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.textFieldsHint,
                                          TextDecoration.none),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(CommonUi.setSvgImage('timings')),
                          Obx(
                            () => businessDetailsController
                                    .openingHours.value.isNotEmpty
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        scrollDirection: Axis.vertical,
                                        itemCount: businessDetailsController
                                            .getBusiness
                                            .value
                                            .openingHours!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return OpeningHoursItem(index);
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: AppColors.dividerClr,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      Obx(
                        () => businessDetailsController
                                    .getBusiness.value.description
                                    .toString() !=
                                'null'
                            ? ExpandableText(
                                businessDetailsController
                                    .getBusiness.value.description!,
                                expandText: '\n' +
                                    Utils.getString(context, 'read_more'),
                                collapseText: '\n' +
                                    Utils.getString(context, 'read_less'),
                                maxLines: 3,
                                linkColor: AppColors.AppColorGrad2,
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.textFieldsHint,
                                    TextDecoration.none),
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 120,
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
                                Obx(
                                  () => businessDetailsController
                                              .getBusiness.value.totalCheckins
                                              .toString() !=
                                          'null'
                                      ? Text(
                                          businessDetailsController
                                              .getBusiness.value.totalCheckins!,
                                          style: CommonUi.customTextStyle1(
                                              Fonts.interSemiBold,
                                              36.0,
                                              FontWeight.w600,
                                              AppColors.White,
                                              TextDecoration.none),
                                        )
                                      : const SizedBox(),
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
                                Obx(
                                  () => businessDetailsController.userCheckIn
                                              .toString() !=
                                          'null'
                                      ? Text(
                                          businessDetailsController
                                              .userCheckIn.value,
                                          style: CommonUi.customTextStyle1(
                                              Fonts.interSemiBold,
                                              36.0,
                                              FontWeight.w600,
                                              AppColors.White,
                                              TextDecoration.none),
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => businessDetailsController.upcomingEvents.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => businessDetailsController.upcomingEvents.isNotEmpty
                      ? Container(
                          height: 140,
                          margin: const EdgeInsets.only(left: 20, top: 14),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                businessDetailsController.upcomingEvents.length,
                            itemBuilder: (BuildContext context, int index) {
                              return UpcomingEventBusinessItem(index);
                            },
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(
              () => businessDetailsController.businessDetailsLoaderShow.value
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

  void apiImplementation() {
    businessDetailsController.businessDetailsLoaderShow.value = true;
    businessDetailsController.getBusinessDetails(id);
  }
}
