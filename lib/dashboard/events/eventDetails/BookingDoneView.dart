import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingDoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.White,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.Black),
              onPressed: () {
                Get.back();
              },
            ),
            Expanded(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        CommonUi.setSvgImage('booking_successful')),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      Utils.getString(context, 'congratulations'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interSemiBold,
                          18.0,
                          FontWeight.w600,
                          AppColors.Black,
                          TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      Utils.getString(
                          context, 'your_booking_was_successfully_done'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interMedium,
                          14.0,
                          FontWeight.w500,
                          AppColors.Black,
                          TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.off(DashBoardView());
                      },
                      child: Text(
                        Utils.getString(context, 'back_to_home'),
                        style: CommonUi.customTextStyleUnderLine(
                            Fonts.interMedium,
                            14.0,
                            FontWeight.w500,
                            AppColors.Black,
                            TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(
                  child: Text(Utils.getString(context, 'ok'),
                      style: CommonUi.customTextStyle1(
                          Fonts.interSemiBold,
                          18.0,
                          FontWeight.w600,
                          AppColors.White,
                          TextDecoration.none)),
                ),
                height: 50,
                width: Get.width,
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 40, bottom: 24),
                decoration: CommonUi.shadowRoundedContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
