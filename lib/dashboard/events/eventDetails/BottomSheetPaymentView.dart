import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetPaymentView extends StatelessWidget {
  EventDetailsController eventsController = Get.find();

  BottomSheetPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height - 150,
      decoration: CommonUi.commonBoxDecoration(20.0, AppColors.White),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Material(
          child: Container(
            color: AppColors.White,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                    Utils.getString(
                      context,
                      'confirm_payment',
                    ),
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                        FontWeight.w600, AppColors.Black, TextDecoration.none)),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 116,
                  height: 116,
                  child: Obx(
                    () => eventsController.eventDetails.value.featuredImageUrl
                                .toString() !=
                            "null"
                        ? ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 500.0,
                              imageUrl: eventsController
                                  .eventDetails.value.featuredImageUrl!,
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
                          )
                        : const SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                eventsController.eventDetails.value.business!.businessName
                            .toString() !=
                        "null"
                    ? Text(
                        eventsController
                            .eventDetails.value.business!.businessName!,
                        style: CommonUi.customTextStyle1(
                            Fonts.interSemiBold,
                            18.0,
                            FontWeight.w600,
                            AppColors.Black,
                            TextDecoration.none),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => eventsController.eventDetails.value.eventName
                              .toString() !=
                          'null'
                      ? Text(
                          eventsController.eventDetails.value.eventName!,
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular,
                              12.0,
                              FontWeight.w400,
                              AppColors.textFieldsHint,
                              TextDecoration.none),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => eventsController.eventDetails.value.business!.address
                              .toString() !=
                          'null'
                      ? Text(
                          eventsController
                              .eventDetails.value.business!.address!,
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular,
                              12.0,
                              FontWeight.w400,
                              AppColors.textFieldsHint,
                              TextDecoration.none),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: CommonUi.commonPaymentBoxGrad(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  eventsController.allCardsList.isNotEmpty
                                      ? eventsController.whichSheet.value = '4'
                                      : false;
                                },
                                child: Text(
                                  eventsController.modelCard.value.id != '' &&
                                          eventsController.modelCard.value.id !=
                                              null
                                      ? ('Card: xxxx xxxx xxxx ' +
                                          eventsController
                                              .modelCard.value.last4!)
                                      : eventsController
                                              .allCardsList.value.isNotEmpty
                                          ? 'Choose other Cards for payment'
                                          : 'No Card  Added',
                                  style: CommonUi.customTextStyle1(
                                      Fonts.interMedium,
                                      12.0,
                                      FontWeight.w500,
                                      eventsController.modelCard.value.id !=
                                                  '' &&
                                              eventsController
                                                      .modelCard.value.id !=
                                                  null
                                          ? AppColors.Black
                                          : AppColors.redPayment,
                                      TextDecoration.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          eventsController.whichSheet.value = '3';
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Row(
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
                          ),
                        ),
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
                  decoration: CommonUi.commonPaymentBoxGrad(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Obx(
                        () => eventsController
                                    .eventDetails.value.business!.createdAt
                                    .toString() !=
                                'null'
                            ? Text(
                                CommonUi.dateFormatOnlyDate(eventsController
                                        .eventDetails
                                        .value
                                        .business!
                                        .createdAt!) +
                                    CommonUi.getDayOfMonthSuffix(int.parse(
                                        CommonUi.dateFormatOnlyDate(
                                            eventsController.eventDetails.value
                                                .business!.createdAt!))) +
                                    " " +
                                    CommonUi.dateFormatWithTime(eventsController
                                        .eventDetails
                                        .value
                                        .business!
                                        .createdAt!),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interMedium,
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.blackLight,
                                    TextDecoration.none),
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => eventsController.eventDetails.value.description
                                    .toString() !=
                                'null'
                            ? Text(
                                eventsController
                                    .eventDetails.value.description!,
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.textFieldsHint,
                                    TextDecoration.none),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Obx(
                      () => eventsController.eventDetails.value.ticketPrice
                                  .toString() !=
                              'null'
                          ? Text(
                              '\$' +
                                  (double.parse(eventsController
                                              .eventDetails.value.ticketPrice
                                              .toString()) *
                                          eventsController
                                              .currentSliderValue.value
                                              .toInt())
                                      .toStringAsFixed(2),
                              style: CommonUi.customTextStyle1(
                                  Fonts.interSemiBold,
                                  24.0,
                                  FontWeight.w600,
                                  AppColors.redPrice,
                                  TextDecoration.none),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          checkColor: AppColors.White,
                          activeColor: AppColors.AppColorGrad2,
                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: eventsController.isChecked.value,
                          onChanged: (bool? value) {
                            eventsController.isChecked.value = value!;
                          }),
                    ),
                    Text(
                      Utils.getString(context, 'i_understand'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interRegular,
                          12.0,
                          FontWeight.w400,
                          AppColors.transparentSheet,
                          TextDecoration.none),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    eventsController.isChecked.value == false
                        ? CommonUi.showToast(
                            'Please agree to terms & conditions')
                        : eventsController.eventPurchaseApi();

                    // eventsController.whichSheet.value = '4';
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
                        left: 40, right: 40, top: 22, bottom: 24),
                    decoration: CommonUi.shadowRoundedContainer,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
