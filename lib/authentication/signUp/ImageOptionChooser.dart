import 'package:ciao_chow/authentication/signUp/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOptionChooser {

  SignUpController signUpController = Get.find();

  void showChooser(context) {
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
                signUpController.getCameraImage();
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
                signUpController.getGalleryImage();
                Get.back();
              },
            )
          ],
        ),
        backgroundColor: Colors.white
    );
  }


  }
