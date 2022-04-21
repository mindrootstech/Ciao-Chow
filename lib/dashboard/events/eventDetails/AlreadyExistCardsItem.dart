import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AlreadyExistCardsItem extends StatefulWidget {
  @override
  State<AlreadyExistCardsItem> createState() => _AlreadyExistCardsItemState();
}


class _AlreadyExistCardsItemState extends State<AlreadyExistCardsItem> {
  EventDetailsController eventsDetailsController = Get.find();

  @override
  void initState() {
    super.initState();
    // for (int i = 0; i < eventsDetailsController.allCardsList.length; i++) {
    //   if (eventsDetailsController.allCardsList[i].isSelected == eventsDetailsController.modelCard.value.isSelected) {
    //     eventsDetailsController.allCardsList[i].isSelected = false;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: eventsDetailsController.allCardsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              for (int i = 0;
                  i < eventsDetailsController.allCardsList.length;
                  i++) {
                eventsDetailsController.allCardsList.value[i].isSelected =
                    false;
              }
              var a = eventsDetailsController.allCardsList.value;
              var model = a[index];
              if (a[index].isSelected == null) {
                model.isSelected = true;
              } else {
                model.isSelected = !model.isSelected!;
              }
              a[index] = model;
              eventsDetailsController.allCardsList.value = a;
            });
          },
          child: Container(
            color: Colors.transparent,
            width: Get.width,
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card: xxxx xxxx xxxx ' +
                              eventsDetailsController
                                  .allCardsList[index].last4!,
                          style: CommonUi.customTextStyle1(
                              Fonts.interSemiBold,
                              16.0,
                              FontWeight.w600,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Exp: ' +
                              eventsDetailsController
                                  .allCardsList[index].expMonth!
                                  .toString() +
                              '/' +
                              eventsDetailsController
                                  .allCardsList[index].expYear!
                                  .toString(),
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              14.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Card Type: ' +
                              eventsDetailsController
                                  .allCardsList[index].brand!,
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              14.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                      ],
                    ),
                    eventsDetailsController
                                    .allCardsList.value[index].isSelected !=
                                null &&
                            eventsDetailsController
                                .allCardsList.value[index].isSelected!
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: SvgPicture.asset(
                                CommonUi.setSvgImage('booking_successful')))
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: AppColors.dividerClr,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
