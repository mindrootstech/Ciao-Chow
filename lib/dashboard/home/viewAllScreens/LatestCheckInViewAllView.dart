import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/LatestCheckInListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestCheckInViewAllView extends StatelessWidget {
  LatestCheckInViewAllView({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppColorGrad2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          Utils.getString(context, 'latest_check_ins'),
          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
              FontWeight.w600, AppColors.White, TextDecoration.none),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Container(
                    height: 50 / 2 + 30,
                    color: AppColors.AppColorGrad2,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 100 / 4,
                      width: Get.width,
                      decoration:
                      CommonUi.commonBoxDecoration(24.0, AppColors.White),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 16, right: 16,),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.arrayLatestCheckIns.length,
                itemBuilder: (BuildContext context, int index) {
                  return LatestCheckInListItem(index, homeController);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
