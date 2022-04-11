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
            child: Obx(
              () => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      eventsController.showBottomSheet.value = false;
                    },
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                              CommonUi.setSvgImage('white_cross_sheet'))),
                    ),
                  ),
                  eventsController.whichSheet.value == '1'
                      ? Container(
                          width: Get.width,
                          decoration: CommonUi.commonBoxDecoration(
                              20.0, AppColors.White),
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
                                    Utils.getString(
                                        context, 'select_your_guest_range'),
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
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
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
                                  onTap: () {
                                    eventsController.whichSheet.value = '2';
                                    // Get.to(BookingDoneView());
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                          Utils.getString(
                                              context, 'buy_tickets'),
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
                                        left: 20,
                                        right: 20,
                                        top: 90,
                                        bottom: 90),
                                    decoration: CommonUi.shadowRoundedContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: Get.width,
                          decoration: CommonUi.commonBoxDecoration(
                              20.0, AppColors.White),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(top: 25),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.whiteBorder,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      // child: signUpController.imagePath.value == ''
                                      //     ? SvgPicture.asset(
                                      //         CommonUi.setSvgImage('default_image'),
                                      //         // fit: BoxFit.cover,
                                      //       )
                                      //     : Image.file(
                                      //         File(signUpController.imagePath.value),
                                      //         fit: BoxFit.cover,
                                      //       ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'JW Marriott',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interSemiBold,
                                      18.0,
                                      FontWeight.w600,
                                      AppColors.Black,
                                      TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Magikk culture ll Dj Night',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interRegular,
                                      12.0,
                                      FontWeight.w400,
                                      AppColors.textFieldsHint,
                                      TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Sector-35, chandigarh india',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interRegular,
                                      12.0,
                                      FontWeight.w400,
                                      AppColors.textFieldsHint,
                                      TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration:
                                      CommonUi.commonPaymentBoxGrad(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Payment Method',
                                            style: CommonUi.customTextStyle1(
                                                Fonts.interMedium,
                                                16.0,
                                                FontWeight.w500,
                                                AppColors.Black,
                                                TextDecoration.none),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'No Card  Added',
                                            style: CommonUi.customTextStyle1(
                                                Fonts.interMedium,
                                                12.0,
                                                FontWeight.w500,
                                                AppColors.redPayment,
                                                TextDecoration.none),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              CommonUi.setSvgImage('add_card')),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Add Card',
                                            style: CommonUi.customTextStyle1(
                                                Fonts.interSemiBold,
                                                16.0,
                                                FontWeight.w700,
                                                AppColors.redPayment,
                                                TextDecoration.none),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.all(20.0),
                                  decoration:
                                      CommonUi.commonPaymentBoxGrad(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date & Time:',
                                        style: CommonUi.customTextStyle1(
                                            Fonts.interSemiBold,
                                            16.0,
                                            FontWeight.w600,
                                            AppColors.blackLight,
                                            TextDecoration.none),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '12th Jan, 2021 05:00pm',
                                        style: CommonUi.customTextStyle1(
                                            Fonts.interMedium,
                                            14.0,
                                            FontWeight.w500,
                                            AppColors.blackLight,
                                            TextDecoration.none),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Lorem lupsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text.',
                                        style: CommonUi.customTextStyle1(
                                            Fonts.interRegular,
                                            12.0,
                                            FontWeight.w400,
                                            AppColors.textFieldsHint,
                                            TextDecoration.none),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interMedium,
                                          18.0,
                                          FontWeight.w500,
                                          AppColors.Black,
                                          TextDecoration.none),
                                    ),
                                    Text(
                                      '\$100',
                                      style: CommonUi.customTextStyle1(
                                          Fonts.interSemiBold,
                                          24.0,
                                          FontWeight.w600,
                                          AppColors.redPrice,
                                          TextDecoration.none),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                // CheckboxListTile(
                                //   title: const Text(
                                //       "I understand and accept the deal's terms and\nconditions."),
                                //   value: eventsController.isChecked.value,
                                //   onChanged: (newValue) {
                                //     eventsController.isChecked.value == false
                                //         ? eventsController.isChecked.value =
                                //             true
                                //         : eventsController.isChecked.value =
                                //             false;
                                //   },
                                // )
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
