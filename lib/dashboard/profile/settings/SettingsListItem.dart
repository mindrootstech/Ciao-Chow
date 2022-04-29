import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsListItem extends StatelessWidget {
  var index;

  SettingsListItem(this.index, {Key? key}) : super(key: key);
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    var model = profileController.arraySettingList[index];
    return GestureDetector(
      onTap: () {
        if (index == 5) {
          profileController.loaderLogout.value = true;
          profileController.getAccountDelete();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(top: 15),
        decoration: CommonUi.shadowWhiteContainer,
        child: Row(
          children: [
            SizedBox(
                width: 16,
                child:
                    SvgPicture.asset(CommonUi.setSvgImage(model.iconSetting))),
            const SizedBox(
              width: 10,
            ),
            Text(
              model.titleSetting,
              style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                  FontWeight.w500, AppColors.Black, TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
