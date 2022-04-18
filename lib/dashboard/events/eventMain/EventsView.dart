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
import 'package:get/get.dart';

class EventsView extends StatelessWidget {
  var eventsController = Get.put(EventsController());

  EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          body: SingleChildScrollView(
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
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 20.0,
                        FontWeight.w600, AppColors.White, TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: AppColors.AppColorGrad2,
                  height: 15,
                ),
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
                              CommonUi.commonBoxDecoration(24.0, AppColors.White),
                        ),
                      ),
                      SizedBox(
                          height: 175,
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Obx(
                                () => MyCarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 0.9,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    enlargeCenterPage: true,
                                  ),
                                  items: eventsController.imageSliders.value,
                                ),
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
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              Utils.getString(context, 'my_event_tickets'),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  18.0,
                                  FontWeight.w600,
                                  AppColors.Black,
                                  TextDecoration.none),
                            ),
                          ),
                          Container(
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
                        ],
                      ),
                      Container(
                        height: 192,
                        margin: const EdgeInsets.only(left: 20, top: 14),
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: eventsController.arrayEventTicket.length,
                            itemBuilder: (BuildContext context, int index) {
                              return EventTicketsListItem(index, eventsController);
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          Utils.getString(context, 'upcoming_events'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interSemiBold,
                              18.0,
                              FontWeight.w600,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
                        child: Obx(
                          () => GridView.builder(
                            padding: const EdgeInsets.only(top: 0,bottom: 120),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 12,
                                      mainAxisExtent: 180),
                              itemCount:
                                  eventsController.arrayUpcomingEvents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return UpcomingEventsListItem(
                                    index, eventsController);
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
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
