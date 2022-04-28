import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEventsListItem extends StatelessWidget {
  var index;
  EventsController eventsController;

  UpcomingEventsListItem(this.index, this.eventsController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(EventDetailsView('notPurchased',
            eventsController.arrayUpcomingEvents[index].id!.toString()));
      },
      child: Container(
        width: Get.width,
        decoration: CommonUi.commonBoxDecorationAllSides(
            10.0, AppColors.eventTicketsBackground),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 180,
                    fit: BoxFit.cover,
                    imageUrl: eventsController
                        .arrayUpcomingEvents[index].featuredImageUrl!,
                    placeholder: (context, url) => Container(
                        width: Get.width,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.White,
                          ),
                        )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                    child: Container(
                  width: Get.width,
                  height: 180,
                  decoration: CommonUi.commonBoxDecorationAllOverlay(10.0),
                )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          child: eventsController.arrayUpcomingEvents[index]
                                      .business!.businessName !=
                                  'null'
                              ? Text(
                                  eventsController.arrayUpcomingEvents[index]
                                      .business!.businessName!,
                                  textAlign: TextAlign.start,
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      14.0,
                                      FontWeight.w500,
                                      AppColors.White,
                                      TextDecoration.none),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: eventsController.arrayUpcomingEvents[index]
                                      .business!.address !=
                                  'null'
                              ? Text(
                                  eventsController.arrayUpcomingEvents[index]
                                      .business!.address!,
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interRegular,
                                      12.0,
                                      FontWeight.w400,
                                      AppColors.White,
                                      TextDecoration.none),
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // Container(
                        //   margin: const EdgeInsets.only(top: 3),
                        //   child: eventsController.arrayUpcomingEvents[index]
                        //               .business!.address !=
                        //           'null'
                        //       ? Text(
                        //           eventsController.arrayUpcomingEvents[index]
                        //               .business!.address!,
                        //           style: CommonUi.customTextStyle1(
                        //               Fonts.interRegular,
                        //               12.0,
                        //               FontWeight.w400,
                        //               AppColors.White,
                        //               TextDecoration.none),
                        //         )
                        //       : const SizedBox(),
                        // ),

                        eventsController.arrayUpcomingEvents[index].distance.toString() != '' ?
                        Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Row(
                            children: [
                              Image.asset(CommonUi.setPngImage('location_miles')),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                eventsController.arrayUpcomingEvents[index].distance!+ ' miles away',
                                style: CommonUi.customTextStyle1(
                                    Fonts.interItalic,
                                    8.0,
                                    FontWeight.w400,
                                    AppColors.White,
                                    TextDecoration.none),
                              ),
                            ],
                          ),
                        ) : const SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
