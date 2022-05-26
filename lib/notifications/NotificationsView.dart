import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/notifications/NotificationController.dart';
import 'package:ciao_chow/notifications/NotificationItemView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  var fromWhere;

  NotificationsView(this.fromWhere, {Key? key}) : super(key: key);

  var notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppColorGrad2,
        leading: Builder(
          builder: (BuildContext context) {
            return fromWhere == 1
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  )
                : const SizedBox();
          },
        ),
        centerTitle: true,
        title: Text(
          Utils.getString(context, 'notifications'),
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
                    height: 48,
                    color: AppColors.AppColorGrad2,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 25,
                      width: Get.width,
                      decoration:
                          CommonUi.commonBoxDecoration(24.0, AppColors.White),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => notificationController.loaderNotification.value
                  ? Container(
                      height: 500,
                      width: Get.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.AppColorGrad2,
                      )),
                    )
                  : notificationController.notificationsArray.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              notificationController.notificationsArray.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NotificationItemView(index);
                          },
                        )
                      : SizedBox(
                          width: Get.width,
                          height: Get.height / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  CommonUi.setSvgImage('no_notification')),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                Utils.getString(context, 'no_notifications'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    18.0,
                                    FontWeight.w600,
                                    AppColors.Black,
                                    TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
