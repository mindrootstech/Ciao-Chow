import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BottomSheetMainView.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EventDetailsView extends StatelessWidget {

  String eventId;
  String fromWhere;
  EventDetailsView(this.fromWhere, this.eventId, {Key? key}) : super(key: key);
  var eventDetailsController = Get.put(EventDetailsController(eventId));

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return eventDetailsController.showBottomSheet.value
          ? eventDetailsController.showBottomSheet.value = false
          : true;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
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
              title: Text(
                'JW Marriott',
                style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                    FontWeight.w600, AppColors.White, TextDecoration.none),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: Stack(
                      children: [
                        Container(
                          height: 180 / 2 + 30,
                          color: AppColors.AppColorGrad2,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 180 / 2,
                            width: Get.width,
                            decoration:
                            CommonUi.commonBoxDecoration(24.0, AppColors.White),
                          ),
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
                                    viewportFraction: 0.83,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    enlargeCenterPage: true,
                                  ),
                                  items: imageSliders,
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                  'Magik culture ll Dj Night Magik culture ll Dj Night',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interSemiBold,
                                      18.0,
                                      FontWeight.w600,
                                      AppColors.Black,
                                      TextDecoration.none)),
                            ),
                            Text('\$20',
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    24.0,
                                    FontWeight.w600,
                                    AppColors.AppColorGrad2,
                                    TextDecoration.none))
                          ],
                        ),
                        const SizedBox(
                          height: 14,
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
                        Container(
                          height: 1,
                          color: AppColors.dividerClr,
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(CommonUi.setSvgImage('overview')),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getString(
                                        context, 'overview'),
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
                                  Text(
                                    'Lorem ipsum is simply dummy text of the printing',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: AppColors.dividerClr,
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                CommonUi.setSvgImage('start_end_date')),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getString(
                                        context, 'start_end_date'),
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
                                  Text(
                                    '23,Jan,2022 - 29,Jan,2022',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Lorem ipsum is simply dummy text of the printing',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: AppColors.dividerClr,
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                CommonUi.setSvgImage('associated_business')),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getString(
                                        context, 'associated_business'),
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
                                  Text(
                                    'JW Marriott',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: AppColors.dividerClr,
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                CommonUi.setSvgImage('passes_available')),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getString(
                                        context, 'passes_available'),
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
                                  Text(
                                    '100 / 500',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: AppColors.dividerClr,
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                        ),
                        Row(
                          children: [
                            Image.asset(
                                CommonUi.setPngImage('terms_conditions')),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getString(
                                        context, 'terms_and_conditions'),
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
                                  Text(
                                    'Lorem ipsum is simply dummy text of the printing',
                                    style: CommonUi.customTextStyle1(
                                        Fonts.interRegular,
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.textFieldsHint,
                                        TextDecoration.none),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(BottomSheetGuestView());
                            eventDetailsController.showBottomSheet.value = true;
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                  Utils.getString(context, 'buy_tickets'),
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      14.0,
                                      FontWeight.w500,
                                      AppColors.White,
                                      TextDecoration.none)),
                            ),
                            height: 50,
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 60, bottom: 24),
                            decoration: CommonUi.shadowRoundedContainer,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => eventDetailsController.showBottomSheet.value
              ? BottomSheetGuestView()
              :  Container())
        ],
      ),
    );
  }
}

