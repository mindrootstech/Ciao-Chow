import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInController.dart';
import 'package:flutter/material.dart';

class LatestAllCheckIn extends StatelessWidget {
  var index;
  LatestCheckInController latestCheckInController;

  LatestAllCheckIn(this.index, this.latestCheckInController, {Key? key})
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
                    imageUrl: latestCheckInController.arrayAllCheckIns[index].featuredImage!,
                    placeholder: (context, url) => Transform.scale(
                        scale: 0.2,
                        child: const CircularProgressIndicator(
                          strokeWidth: 10.5,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  latestCheckInController.arrayAllCheckIns[index].businessName! , style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                    FontWeight.w500, AppColors.Black, TextDecoration.none),overflow: TextOverflow.ellipsis,maxLines: 1,
                ),

                const SizedBox(height: 4,),

                Text(
                  latestCheckInController.arrayAllCheckIns[index].address!,
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  CommonUi.dateFormat(latestCheckInController.arrayAllCheckIns[index].createdAt!),
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  CommonUi.timeFormat(latestCheckInController.arrayAllCheckIns[index].createdAt!),
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
