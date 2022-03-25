import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/home/HomeController.dart';
import 'package:flutter/material.dart';

class LatestCheckInListItem extends StatelessWidget {
  var index;
  HomeController homeController;

  LatestCheckInListItem(this.index, this.homeController, {Key? key})
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
                    imageUrl: homeController.arrayLatestCheckIns[index].image,
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
                  homeController.arrayLatestCheckIns[index].placeName , style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                  FontWeight.w500, AppColors.Black, TextDecoration.none),overflow: TextOverflow.ellipsis,maxLines: 1,
                ),

                const SizedBox(height: 4,),

                Text(
                  homeController.arrayLatestCheckIns[index].placeAddress,
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  homeController.arrayLatestCheckIns[index].date,
                  style: CommonUi.customTextStyle1(
                      Fonts.interRegular,
                      12.0,
                      FontWeight.w400,
                      AppColors.textFieldsHint,
                      TextDecoration.none),
                ),
                const SizedBox(height: 4,),
                Text(
                  homeController.arrayLatestCheckIns[index].time,
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
