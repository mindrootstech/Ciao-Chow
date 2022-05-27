import 'package:ciao_chow/dashboard/profile/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOptionChooserProfile {

  ProfileController profileController = Get.find();

  void  showChooser(context) {
      Get.bottomSheet(
        Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text(
                'Take a picture from Camera',
                // style: CommonUi.customTextStyle1(Fonts.PoppinsRegular, 18, FontWeight.w500, ColorRes.textBlack),
              ),
              onTap: () {
                profileController.getCameraImage();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text(
                'Select from Phone Gallery',
                // style: CommonUi.customTextStyle1(Fonts.PoppinsRegular, 18, FontWeight.w500, ColorRes.textBlack),
              ),
              onTap: () {
                profileController.getGalleryImage().then((value){
                  profileController.imagePathNew = value;
                  profileController.isCameraOrGallery.value = '1';
                  return profileController.imagePathNew;
                });
                Get.back();
             //
              },
            )
          ],
        ),
        backgroundColor: Colors.white
    );
  }
}