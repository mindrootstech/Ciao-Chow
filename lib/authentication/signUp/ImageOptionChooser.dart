import 'package:ciao_chow/authentication/signUp/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOptionChooser {

  SignUpController signUpController = Get.find();

  void showChooser(context) {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(
                  'Take a picture from Camera',
                  // style: CommonUi.customTextStyle1(Fonts.PoppinsRegular, 18, FontWeight.w500, ColorRes.textBlack),
                ),
                onTap: () {
                  signUpController.getCameraImage();
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text(
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
        ),
        backgroundColor: Colors.white
    );
  }


  }
