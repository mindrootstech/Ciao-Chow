import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestCheckInListItem extends StatelessWidget {
  var index;
  var userCheckin;

  LatestCheckInListItem(this.index, this.userCheckin, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: CommonUi.shadowWhiteContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                height: 75,
                width: 125,
                margin: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: userCheckin.business!.featuredImageUrl!,
                    placeholder: (context, url) =>  Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userCheckin.business!.businessName! , style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                  FontWeight.w500, AppColors.Black, TextDecoration.none),overflow: TextOverflow.ellipsis,maxLines: 1,
                ),

                const SizedBox(height: 4,),

                Text(
                  userCheckin.business!.address!,
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  CommonUi.dateFormat(userCheckin.createdAt!),
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  CommonUi.timeFormat(userCheckin.createdAt!),
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
