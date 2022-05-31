import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AllCardsMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AlreadyExistCardsItem.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomSheetAlreadyCards extends StatelessWidget {

  EventDetailsController eventsDetailsController = Get.find();

  BottomSheetAlreadyCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height - 250,
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

           Expanded(
              child:  AlreadyExistCardsItem(),
            ),

          GestureDetector(
              onTap: () {
              for (int i = 0; i < eventsDetailsController.allCardsList.length; i++) {
                if(eventsDetailsController.allCardsList[i].isSelected == true){
                  eventsDetailsController.modelCard.value = eventsDetailsController.allCardsList[i];
                }
              }

              eventsDetailsController.whichSheet.value = '2';

            },
            child: Container(
              child: Center(
                child: Text(Utils.getString(context, 'done'),
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
                  left: 20, right: 20, top: 20, bottom: 70),
              decoration: CommonUi.shadowRoundedContainer,
            ),
          ),


          const SizedBox(height: 24,),
        ],
      ),

    );
  }

}