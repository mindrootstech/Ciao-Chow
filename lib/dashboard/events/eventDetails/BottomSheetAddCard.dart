import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

class BottomSheetAddCard extends StatelessWidget {
  BottomSheetAddCard({Key? key}) : super(key: key);

  EventDetailsController eventDetailsController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: Get.width,
        decoration: CommonUi.commonBoxDecoration(20.0, AppColors.White),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Material(
          child: Container(
            color: AppColors.White,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  Utils.getString(
                    context,
                    'add_new_card',
                  ),
                  style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                      FontWeight.w600, AppColors.Black, TextDecoration.none),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  Utils.getString(
                    context,
                    'please_fill_details',
                  ),
                  style: CommonUi.customTextStyle2(
                    Fonts.interLight,
                    14.0,
                    FontWeight.w300,
                    AppColors.lightBlack,
                    TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    controller: eventDetailsController.nameOnCardController.value,
                    keyboardType: TextInputType.name,
                    cursorColor: AppColors.textFieldsHint,
                    decoration: CommonUi.textFieldDecorationCard(
                        Utils.getString(context, 'name_on_card')),
                    style: CommonUi.customTextStyle1(Fonts.interMedium, 15.0,
                        FontWeight.w500, AppColors.Black, TextDecoration.none)),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter card number';
                      } else if (value.length < 16) {
                        return 'Please enter 16 digit card number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    controller: eventDetailsController.cardNumberController.value,
                    cursorColor: AppColors.textFieldsHint,
                    decoration: CommonUi.textFieldDecorationCard(
                        Utils.getString(context, 'card_number')),
                    style: CommonUi.customTextStyle1(Fonts.interMedium, 15.0,
                        FontWeight.w500, AppColors.Black, TextDecoration.none)),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter expiry date';
                            }

                            // else if (value != CreditCardExpirationDateFormatter()) {
                            //   return 'Please enter correct expiry date';
                            // }
                            return null;
                          },
                          inputFormatters: [
                            CreditCardExpirationDateFormatter(),
                          ],
                          controller: eventDetailsController.expiryDateController.value,
                          cursorColor: AppColors.textFieldsHint,
                          decoration: CommonUi.textFieldDecorationCard(
                              Utils.getString(context, 'expiry_date')),
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              15.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none)),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return 'Enter cvv';
                            }else if (
                                value.length < 3) {
                              return 'Enter 3 digit cvv';
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                          ],
                          controller: eventDetailsController.cvvTxtController.value,
                          cursorColor: AppColors.textFieldsHint,
                          decoration: CommonUi.textFieldDecorationCard(
                              Utils.getString(context, 'cvv')),
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              15.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none)),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    CommonUi.hideKeyBoard(context);

                    if (_formKey.currentState!.validate()) {
                      eventDetailsController.addCardToTheStripe();
                    }
                    // Get.off(BookingDoneView());
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
                        left: 40, right: 40, top: 90, bottom: 70),
                    decoration: CommonUi.shadowRoundedContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
