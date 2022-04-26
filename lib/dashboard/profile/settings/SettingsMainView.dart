import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingsListItem.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMainView extends StatelessWidget {
  ProfileController profileController = Get.find();
  SettingsMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    profileController.arraySettingList = <SettingsModel>[].obs;

    var modelSettings = SettingsModel();
    modelSettings.iconSetting = 'contact_support';
    modelSettings.titleSetting = 'Contact Support';
    profileController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'share_app';
    modelSettings.titleSetting = 'Share the app';
    profileController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'rate_app';
    modelSettings.titleSetting = 'Rate the app';
    profileController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'privacy_policy';
    modelSettings.titleSetting = 'Privacy policy';
    profileController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'terms_of_use';
    modelSettings.titleSetting = 'Terms of use';
    profileController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'delete';
    modelSettings.titleSetting = 'Delete account';
    profileController.arraySettingList.add(modelSettings);


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
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profileController.arraySettingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SettingsListItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
