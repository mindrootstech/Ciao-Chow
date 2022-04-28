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
    // notificationController.notificationsArray.value = [];
    //
    // var notificationModel = NotificationsMainModel();
    // notificationModel.imageUrl =
    //     'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3N8ZW58MHx8MHx8&w=1000&q=80';
    // notificationModel.title = 'PlayBoy';
    // notificationModel.notificationTime = '1m ago.';
    // notificationModel.description =
    //     'Play boy has added new event that might you be intersted.';
    // notificationController.notificationsArray.add(notificationModel);
    //
    // notificationModel = NotificationsMainModel();
    // notificationModel.imageUrl =
    //     'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3N8ZW58MHx8MHx8&w=1000&q=80';
    // notificationModel.title = 'PlayBoy';
    // notificationModel.notificationTime = '1m ago.';
    // notificationModel.description =
    //     'Play boy has added new event that might you be intersted.';
    // notificationController.notificationsArray.add(notificationModel);
    //
    //
    // notificationModel = NotificationsMainModel();
    // notificationModel.imageUrl =
    //     'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3N8ZW58MHx8MHx8&w=1000&q=80';
    // notificationModel.title = 'PlayBoy';
    // notificationModel.notificationTime = '1m ago.';
    // notificationModel.description =
    //     'Play boy has added new event that might you be intersted.';
    // notificationController.notificationsArray.add(notificationModel);
    //
    //
    // notificationModel = NotificationsMainModel();
    // notificationModel.imageUrl =
    //     'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3N8ZW58MHx8MHx8&w=1000&q=80';
    // notificationModel.title = 'PlayBoy';
    // notificationModel.notificationTime = '1m ago.';
    // notificationModel.description =
    //     'Play boy has added new event that might you be intersted.';
    // notificationController.notificationsArray.add(notificationModel);


    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.White,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.AppColorGrad2,
            leading: Builder(
              builder: (BuildContext context) {
                return fromWhere == 1 ?
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ) : const SizedBox();
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
                          decoration: CommonUi.commonBoxDecoration(
                              24.0, AppColors.White),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () =>
                  notificationController.notificationsArray.isNotEmpty ?
                      ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        notificationController.notificationsArray.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NotificationItemView(index);
                    },
                  ) : SizedBox(
                    width: Get.width,
                    height: Get.height/2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(CommonUi.setSvgImage('no_notification')),
                        const SizedBox(height: 25,),
                        Text(
                          Utils.getString(context, 'no_notifications'),
                          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                              FontWeight.w600, AppColors.Black, TextDecoration.none),
                        ),
                      ],
                    ),
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
          child: Obx(() => notificationController.loaderNotification.value
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
