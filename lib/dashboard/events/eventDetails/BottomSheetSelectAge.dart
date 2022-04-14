import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetSelectAge extends StatelessWidget {
  EventDetailsController eventsController = Get.find();

  BottomSheetSelectAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: CommonUi.commonBoxDecoration(20.0, AppColors.White),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                Utils.getString(context, 'select_your_guest_range'),
                style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                    FontWeight.w600, AppColors.Black, TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              Utils.getString(context, 'guests'),
              style: CommonUi.customTextStyle1(Fonts.interMedium, 18.0,
                  FontWeight.w500, AppColors.Black, TextDecoration.none),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              Utils.getString(context, 'how_many_seats'),
              style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                  FontWeight.w400, AppColors.lightBlack, TextDecoration.none),
            ),
            const SizedBox(
              height: 54,
            ),
            Obx(
              () => Slider(
                value: eventsController.currentSliderValue.value,
                max: 100,
                divisions: 100,
                label:eventsController.currentSliderValue.value.round().toString(),
                activeColor: AppColors.seekBarColor,
                thumbColor: AppColors.seekBarColor,
                inactiveColor: AppColors.seekBarColor,
                onChanged: (double value) {
                  eventsController.currentSliderValue.value = value;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                eventsController.currentSliderValue.value > 0 ?
                eventsController.whichSheet.value = '2' : CommonUi.showToast('Please select seats to continue.');
                // Get.to(BookingDoneView());
              },
              child: Container(
                child: Center(
                  child: Text(Utils.getString(context, 'buy_tickets'),
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
                    left: 20, right: 20, top: 90, bottom: 90),
                decoration: CommonUi.shadowRoundedContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
