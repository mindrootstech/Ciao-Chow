import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/MyCarouselSlider.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventTicketsListItem.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:ciao_chow/dashboard/events/eventMain/UpcomingEventsListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'viewAll/AllMyEventsView.dart';

class EventsView extends StatelessWidget {
  var eventsController = Get.put(EventsController());

  EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseCrashlytics.instance.crash();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.AppColorGrad2,
          extendBody: true,
          body: Obx(
            () => eventsController.arrayEventTicket.isNotEmpty ||
                    eventsController.arrayUpcomingEvents.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.AppColorGrad2,
                          height: 48,
                        ),
                        Container(
                          width: Get.width,
                          color: AppColors.AppColorGrad2,
                          child: Text(
                            Utils.getString(context, 'events'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interSemiBold,
                                22.0,
                                FontWeight.w600,
                                AppColors.White,
                                TextDecoration.none),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          color: AppColors.AppColorGrad2,
                          height: 29,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: Get.height - 150,
                              color: Colors.white,
                            ),
                            Column(
                              children: [
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
                                          decoration:
                                              CommonUi.commonBoxDecoration(
                                                  24.0, AppColors.White),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 175,
                                          width: Get.width,
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Obx(
                                                () => MyCarouselSlider(
                                                  options: CarouselOptions(
                                                    viewportFraction: 0.9,
                                                    initialPage: 0,
                                                    enableInfiniteScroll: false,
                                                    reverse: false,
                                                    enlargeCenterPage: true,
                                                  ),
                                                  items: eventsController
                                                      .imageSliders.value,
                                                ),
                                              ))),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: AppColors.White,
                                  child: Column(
                                    children: [
                                      eventsController
                                              .arrayEventTicket.isNotEmpty
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20),
                                                  child: Text(
                                                    Utils.getString(context,
                                                        'my_event_tickets'),
                                                    style: CommonUi
                                                        .customTextStyle1(
                                                            Fonts.interSemiBold,
                                                            18.0,
                                                            FontWeight.w600,
                                                            AppColors.Black,
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(AllMyEventsView());
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Text(
                                                      Utils.getString(
                                                          context, 'view_all'),
                                                      style: CommonUi
                                                          .customTextStyle1(
                                                              Fonts
                                                                  .interRegular,
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .textFieldsHint,
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                      eventsController
                                              .arrayEventTicket.isNotEmpty
                                          ? Container(
                                              height: 192,
                                              margin: const EdgeInsets.only(
                                                  left: 20, top: 14),
                                              child: Obx(
                                                () => ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: eventsController
                                                      .arrayEventTicket.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return EventTicketsListItem(
                                                        index);
                                                  },
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),



                                      eventsController.isLoaded.value
                                            ? Container(
                                        margin: const EdgeInsets.only(
                                            top: 20),
                                              width: eventsController.adWidth,
                                              height: 150,
                                              child: AdWidget(
                                                ad: eventsController
                                                    .inlineAdaptiveAd!,
                                              ),
                                            )
                                          : const SizedBox(),
                                      eventsController
                                              .arrayUpcomingEvents.isNotEmpty
                                          ? Container(
                                              width: Get.width,
                                              margin: const EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: Text(
                                                Utils.getString(
                                                    context, 'upcoming_events'),
                                                style:
                                                    CommonUi.customTextStyle1(
                                                        Fonts.interSemiBold,
                                                        18.0,
                                                        FontWeight.w600,
                                                        AppColors.Black,
                                                        TextDecoration.none),
                                              ),
                                            )
                                          : const SizedBox(),
                                      eventsController
                                              .arrayUpcomingEvents.isNotEmpty
                                          ? Container(
                                              margin: const EdgeInsets.only(
                                                  left: 16, right: 16, top: 15),
                                              child: Obx(
                                                () => GridView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 120),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10,
                                                            mainAxisSpacing: 12,
                                                            mainAxisExtent:
                                                                180),
                                                    itemCount: eventsController
                                                        .arrayUpcomingEvents
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return UpcomingEventsListItem(
                                                          index,
                                                          eventsController);
                                                    }),
                                              ),
                                            )
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: Get.height,
                    color: AppColors.White,
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.AppColorGrad2,
                          height: 48,
                        ),
                        Container(
                          width: Get.width,
                          color: AppColors.AppColorGrad2,
                          child: Text(
                            Utils.getString(context, 'events'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interSemiBold,
                                20.0,
                                FontWeight.w600,
                                AppColors.White,
                                TextDecoration.none),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Stack(
                            children: [
                              Container(
                                height: 100 / 2 + 20,
                                color: AppColors.AppColorGrad2,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height: 100 / 2,
                                  width: Get.width,
                                  decoration: CommonUi.commonBoxDecoration(
                                      24.0, AppColors.White),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 480,
                          margin: const EdgeInsets.only(left: 34, right: 34),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  CommonUi.setSvgImage('no_events')),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'No Events Found',
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    18.0,
                                    FontWeight.w600,
                                    AppColors.Black,
                                    TextDecoration.none),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Lorem lupsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum.',
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.textFieldsHint,
                                    TextDecoration.none),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() => eventsController.eventsMainLoader.value
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
}
