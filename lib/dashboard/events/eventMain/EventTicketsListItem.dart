import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsView.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventTicketsListItem extends StatelessWidget {
  var index;
  var arrayEventTicketItem;

  EventTicketsListItem(this.index, this.arrayEventTicketItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(EventDetailsView('purchased',arrayEventTicketItem.eventId!.toString()));
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
                          imageUrl: arrayEventTicketItem.event!.featuredImageUrl!,
                          placeholder: (context, url) =>  Container(
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
                    ),

                    Positioned(child: Container(
                      // width: 160,
                      // margin: const EdgeInsets.only(right: 10),
                      decoration: CommonUi.commonBoxDecorationAllOverlay(10.0),

                    )),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, bottom: 6),
                        child: Text(
                          arrayEventTicketItem.event!.eventName!,
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
                CommonUi.dateFormat(arrayEventTicketItem.event!.eventStartDate!),
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
                    arrayEventTicketItem.numberTickets! == 1
                        ?  arrayEventTicketItem.numberTickets!.toString() + ' Ticket'
                        : arrayEventTicketItem.numberTickets!.toString() + ' Tickets',
                    textAlign: TextAlign.start,
                    style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                        FontWeight.w400, AppColors.Black, TextDecoration.none),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$' + arrayEventTicketItem.totalAmount!,
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
