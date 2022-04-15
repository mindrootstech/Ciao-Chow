import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BottomSheetAddCard.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BottomSheetAlreadyCards.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BottomSheetPaymentView.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BottomSheetSelectAge.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetGuestView extends StatelessWidget {
  BottomSheetGuestView({Key? key}) : super(key: key);

  EventDetailsController eventsController = Get.find();
  int valueHolder = 20;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.transparent,
      body : Container(
        color: AppColors.transparentSheet,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:
                 Obx(()=> Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                          eventsController.whichSheet.value == '4' ? eventsController.whichSheet.value = '2':
                          eventsController.whichSheet.value == '3' ? eventsController.whichSheet.value = '2':
                          // eventsController.whichSheet.value == '2' ? eventsController.whichSheet.value = '1':


                          eventsController.showBottomSheet.value = false;

                          eventsController.cardNumberController.value.text ='';
                          eventsController.nameOnCardController.value.text ='';
                          eventsController.expiryDateController.value.text ='';
                          eventsController.cvvTxtController.value.text ='';
                          // eventsController.whichSheet.value = '1';
                        },
                        child: Container(
                          margin: const EdgeInsets.all(14),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                  CommonUi.setSvgImage('white_cross_sheet'))),
                        ),
                      ), eventsController.whichSheet.value == '1' ? BottomSheetSelectAge()
                            : eventsController.whichSheet.value == '2' ? BottomSheetPaymentView()
                            : eventsController.whichSheet.value == '3' ? BottomSheetAddCard()
                            : eventsController.whichSheet.value == '4' ? BottomSheetAlreadyCards():const SizedBox(),

                    ],
                ),
                 ),

            ),
          ],
        ),
      ),
    );
  }
}
