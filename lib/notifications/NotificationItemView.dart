import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/notifications/NotificationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItemView extends StatelessWidget {
  var index;
  NotificationItemView(this.index, {Key? key}) : super(key: key);
  NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: Obx(() => ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 500.0,
                        imageUrl: notificationController
                            .notificationsArray[index].imageUrl,
                        placeholder: (context, url) => SizedBox(
                            width: Get.width,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.White,
                              ),
                            )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
              ),
              Column(
                children: [
                  Container(
                    color: Colors.amber,
                    width: Get.width -100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Playboy',
                            style: CommonUi.customTextStyle1(
                                Fonts.interMedium,
                                14.0,
                                FontWeight.w600,
                                AppColors.Black,
                                TextDecoration.none)),
                        Text('1m ago.',
                            style: CommonUi.customTextStyle1(
                                Fonts.interRegular,
                                12.0,
                                FontWeight.w400,
                                AppColors.textFieldsHint,
                                TextDecoration.none)),
                      ],
                    ),
                  ),
                  // Text(
                  //     'Play boy has added new event that might you be interested.',
                  //     style: CommonUi.customTextStyle1(
                  //         Fonts.interRegular,
                  //         12.0,
                  //         FontWeight.w400,
                  //         AppColors.textFieldsHint,
                  //         TextDecoration.none)),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            color: AppColors.dividerClr,
            width: Get.width,
            height: 1,
          )
        ],
      ),
    );
  }
}
