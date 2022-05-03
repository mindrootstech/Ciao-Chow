import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingController.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingsListItem.dart';
import 'package:ciao_chow/dashboard/profile/settings/SettingsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMainView extends StatelessWidget {
  var settingsController = Get.put(SettingController());
  SettingsMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    settingsController.loaderLogout.value = false;
    settingsController.arraySettingList = <SettingsModel>[].obs;

    var modelSettings = SettingsModel();
    modelSettings.iconSetting = 'contact_support';
    modelSettings.titleSetting = 'Contact Support';
    settingsController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'share_app';
    modelSettings.titleSetting = 'Share the app';
    settingsController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'rate_app';
    modelSettings.titleSetting = 'Rate the app';
    settingsController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'privacy_policy';
    modelSettings.titleSetting = 'Privacy policy';
    settingsController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'terms_of_use';
    modelSettings.titleSetting = 'Terms of use';
    settingsController.arraySettingList.add(modelSettings);

    modelSettings = SettingsModel();
    modelSettings.iconSetting = 'delete';
    modelSettings.titleSetting = 'Delete account';
    settingsController.arraySettingList.add(modelSettings);


    return Stack(
      children: [
        Scaffold(
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
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                          itemCount: settingsController.arraySettingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SettingsListItem(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  settingsController.loaderLogout.value = true;
                  settingsController.getLogout();
                },
                child: Container(
                  child: Center(
                    child: Text(Utils.getString(context, 'log_out'),
                        style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                            FontWeight.w500, AppColors.White, TextDecoration.none)),
                  ),
                  height: 50,
                  width: Get.width,
                  margin:
                  const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 24),
                  decoration: CommonUi.shadowRoundedContainer,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() => settingsController.loaderLogout.value
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
