import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/notifications/NotificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItemView extends StatelessWidget {
  var index;

  NotificationItemView(this.index, {Key? key}) : super(key: key);
  NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    var model = notificationController.notificationsArray[index];

    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
              const SizedBox(
                width:10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.title,
                          textAlign: TextAlign.start,
                          style: CommonUi.customTextStyle1(
                              Fonts.interMedium,
                              14.0,
                              FontWeight.w500,
                              AppColors.Black,
                              TextDecoration.none),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          model.notificationTime,
                          textAlign: TextAlign.start,
                          style: CommonUi.customTextStyle1(
                              Fonts.interRegular,
                              12.0,
                              FontWeight.w600,
                              AppColors.Black,
                              TextDecoration.none),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 4,
                    ),

                    Text(model.description,
                        style: CommonUi.customTextStyle1(
                            Fonts.interRegular,
                            12.0,
                            FontWeight.w400,
                            AppColors.textFieldsHint,
                            TextDecoration.none)),


                  ],
                ),
              ),
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
