import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/DashBoardController.dart';
import 'package:ciao_chow/dashboard/DashBoardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingDoneView extends StatelessWidget {
  DashBoardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.White,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 24,top: 36),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.Black),
              onPressed: () {
                try {
                  dashboardController.selectedValue.value = 1;
                }catch(Exception){
                  var a = 0;
                }
                Get.offAll(() => DashBoardView(dashboardController.selectedValue.value));
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
                        try {
                          dashboardController.selectedValue.value = 0;
                        }catch(Exception){
                          var a = 0;
                        }
                        Get.offAll(() => DashBoardView(dashboardController.selectedValue.value));

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
               // edited by Abhijeet Sir 27 April
                try {
                  dashboardController.selectedValue.value = 1;
                }catch(Exception){
                  var a = 0;
                }
                Get.offAll(() => DashBoardView(dashboardController.selectedValue.value));
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
