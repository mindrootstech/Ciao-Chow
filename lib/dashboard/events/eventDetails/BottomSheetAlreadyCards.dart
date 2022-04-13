import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AlreadyExistCardsItem.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/ModelCards.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAlreadyCards extends StatelessWidget {

  EventsController eventsController = Get.find();
  BottomSheetAlreadyCards({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    eventsController.arrayCards = <ModelCards>[];

    var model = ModelCards();
    model.cardLast4 = "Social";
    model.cardExp = "28 OCT 2021 10:00 AM";
    model.cardBrand = "5 Tickets";
    model.isSelected = false;
    eventsController.arrayCards.add(model);

    model = ModelCards();
    model.cardLast4 = "Social";
    model.cardExp = "28 OCT 2021 10:00 AM";
    model.cardBrand = "5 Tickets";
    model.isSelected = false;
    eventsController.arrayCards.add(model);

    model = ModelCards();
    model.cardLast4 = "Social";
    model.cardExp = "28 OCT 2021 10:00 AM";
    model.cardBrand = "5 Tickets";
    model.isSelected = false;
    eventsController.arrayCards.add(model);


    return Container(
      width: Get.width,
      decoration: CommonUi.commonBoxDecoration(
          20.0, AppColors.White),
      padding : const EdgeInsets.only(
          left: 20, right: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            Utils.getString(
              context,
              'choose_other_cards',
            ),
            style: CommonUi.customTextStyle1(
                Fonts.interSemiBold,
                18.0,
                FontWeight.w600,
                AppColors.Black,
                TextDecoration.none),
          ),


          const SizedBox(height: 24,),

          ListView.builder(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: eventsController.arrayCards.length,
            itemBuilder:
                (BuildContext context, int index) {
              return AlreadyExistCardsItem(index, eventsController);
            },
          ),


        ],
      ),

    );
  }

}