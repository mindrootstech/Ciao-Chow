import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'settings/SettingsMainView.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  var profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.AppColorGrad2,
            elevation: 0,
            title: Text(Utils.getString(context, 'profile')),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(SettingsMainView());
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  child: SvgPicture.asset(
                    CommonUi.setSvgImage('settings_icon'),
                  ),
                ),
              )
            ],
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
                          decoration: CommonUi.commonBoxDecoration(
                              24.0, AppColors.White),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() => profileController.loaderProfile.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.AppColorGrad2,
                ))
              : Container()),
        ),
      ],
    );
  }
}
