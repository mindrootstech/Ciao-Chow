
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:ciao_chow/dashboard/profile/editProfile/BottomChangePasswordView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetChangePassword extends StatelessWidget{
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        color: AppColors.transparentSheet,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      profileController.showBottomSheet.value = false;
                    },
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                              CommonUi.setSvgImage('white_cross_sheet'))),
                    ),
                  ),
                      BottomChangePasswordView()

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

}