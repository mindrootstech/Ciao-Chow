import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsView.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventTicketsListItem extends StatelessWidget {
  var index;
  EventsController eventsController;

  EventTicketsListItem(this.index, this.eventsController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(EventDetailsView('purchased',eventsController.arrayEventTicket[index].eventId!.toString()));
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        height: double.maxFinite,
        decoration: CommonUi.commonBoxDecorationAllSides(
            10.0, AppColors.eventTicketsBackground),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        height: 142,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: eventsController
                              .arrayEventTicket[index].event!.featuredImageUrl!,
                          placeholder: (context, url) => Transform.scale(
                              scale: 0.2,
                              child: const CircularProgressIndicator(
                                strokeWidth: 10.5,
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),

                    Positioned(child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: CommonUi.commonBoxDecorationAllOverlay(10.0),

                    )),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, bottom: 6),
                        child: Text(
                          eventsController
                              .arrayEventTicket[index].event!.eventName!,
                          textAlign: TextAlign.start,
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              14.0,
                              FontWeight.w500,
                              AppColors.White,
                              TextDecoration.none),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(left: 10, top: 8),
              child: Text(
                CommonUi.dateFormat(eventsController
                    .arrayEventTicket[index].event!.eventStartDate!),
                textAlign: TextAlign.start,
                style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                    FontWeight.w400, AppColors.Black, TextDecoration.none),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eventsController.arrayEventTicket[index].event!
                                .availableTickets! ==
                            '1'
                        ?  eventsController.arrayEventTicket[index].event!.availableTickets! + ' Ticket'
                        : eventsController.arrayEventTicket[index].event!.availableTickets! + ' Tickets',
                    textAlign: TextAlign.start,
                    style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                        FontWeight.w400, AppColors.Black, TextDecoration.none),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$' + eventsController.arrayEventTicket[index].ticketPrice!,
                    textAlign: TextAlign.start,
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 12.0,
                        FontWeight.w600, AppColors.Black, TextDecoration.none),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
