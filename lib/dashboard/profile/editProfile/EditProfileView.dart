import 'dart:io';

import 'package:ciao_chow/authentication/signUp/ImageOptionChooser.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key}) : super(key: key);

  HomeController homeController = Get.find();
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.White,
              ),
              onPressed: () {
                Get.back();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: AppColors.AppColorGrad2,
        elevation: 0,
        title: Text(Utils.getString(context, 'settings')),
        centerTitle: true,
      ),
      backgroundColor: AppColors.White,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Stack(
                children: [
                  Container(
                    height: 38,
                    color: AppColors.AppColorGrad2,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 15,
                      width: Get.width,
                      decoration:
                      CommonUi.commonBoxDecoration(24.0, AppColors.White),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                ImageOptionChooser().showChooser(context);
              },
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.whiteBorder,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
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
                        child: Obx(
                              () => ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(100)),
                            child: profileController.imagePath.value == ''
                                ? SvgPicture.asset(
                              CommonUi.setSvgImage('default_image'),
                              // fit: BoxFit.cover,
                            )
                                : Image.file(
                              File(profileController.imagePath.value),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                            CommonUi.setSvgImage('profile_edit')),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
