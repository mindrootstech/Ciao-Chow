import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BookingDoneView.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetGuestView extends StatelessWidget {
  BottomSheetGuestView({Key? key}) : super(key: key);

  EventsController eventsController = Get.find();
  int valueHolder = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
       color: AppColors.transparentSheet,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    eventsController.showBottomSheet.value = false;
                  },
                  child: Container(
                    margin:const EdgeInsets.all(14),
                    child: Align(
                      alignment: Alignment.centerRight,
                        child: SvgPicture.asset(CommonUi.setSvgImage('white_cross_sheet'))),
                  ),
                ),
                Container(
                  width: Get.width,
                  decoration:
                      CommonUi.commonBoxDecoration(20.0, AppColors.White),
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
                          child: Text(Utils.getString(context, 'select_your_guest_range'),
                            style: CommonUi.customTextStyle1(
                                Fonts.interSemiBold,
                                18.0,
                                FontWeight.w600,
                                AppColors.Black,
                                TextDecoration.none),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          Utils.getString(context, 'guests'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              18.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          Utils.getString(context, 'how_many_seats'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular,
                              12.0,
                              FontWeight.w400,
                              AppColors.lightBlack,
                              TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Container()
                          // Material(
                          //   child:

                            // FlutterSlider(
                            //   values: [30, 420],
                            //   rangeSlider: true,
                            //   max: 500,
                            //   min: 0,
                            //   onDragging: (handlerIndex, lowerValue, upperValue) {
                            //     _lowerValue = lowerValue;
                            //     _upperValue = upperValue;
                            //   },
                            // )

                            // Slider(
                            //     value: valueHolder.toDouble(),
                            //     min: 1,
                            //     max: 100,
                            //     divisions: 100,
                            //     activeColor: Colors.green,
                            //     inactiveColor: Colors.grey,
                            //     onChanged: (double newValue) {
                            //       valueHolder = newValue.round();
                            //
                            //     },
                            //     semanticFormatterCallback: (double newValue) {
                            //       return '${newValue.round()}';
                            //     }
                            // )
                          // ),

                          // SeekBar(
                          //   bubbleMargin: 20,
                          //   value: 1.0,
                          //   // onValueChanged: (range) {
                          //   //   try {
                          //   //     _homeController.unConfirmGuestValue.value = range.value.truncate();
                          //   //     _homeController.unConfirmGuestValue2.value = range.value;
                          //   //   } catch (Exception) {
                          //   //     var a = 0;
                          //   //   }
                          //   // },
                          //   backgroundColor: AppColors.seekBarColor,
                          //   progressColor: AppColors.seekBarColor,
                          //   min: 1,
                          //   indicatorRadius: 12,
                          //   max: 1000,
                          // ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(BookingDoneView());
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
