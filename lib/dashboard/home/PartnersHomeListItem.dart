import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnersHomeListItem extends StatelessWidget {
  var index;
  HomeController homeController;
  PartnersHomeListItem(this.index, this.homeController, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 150,height: 140,margin: const EdgeInsets.only(left: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(homeController.arrayPartners[index].image,fit: BoxFit.cover,))),

        Positioned(
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.only(left: 20,bottom: 10),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  child: Text(
                    Utils.getString(context, 'csjiudchdlkjcijciucdhufyudyucyfyyefyyfeyyfeuyfuyfuyfufyeufeyuyfeuyfefyi'),
                    style: CommonUi.customTextStyle1(
                        Fonts.interRegular,
                        12.0,
                        FontWeight.w400,
                        AppColors.White,
                        TextDecoration.none),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign:TextAlign.start,
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Text(
                    Utils.getString(context, homeController.arrayPartners[index].placeAddress),
                    style: CommonUi.customTextStyle1(
                        Fonts.interRegular,
                        12.0,
                        FontWeight.w400,
                        AppColors.White,
                        TextDecoration.none),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(CommonUi.setPngImage('location_miles')),
                    Container(
                      width: Get.width,
                      child: Text(
                        Utils.getString(context, homeController.arrayPartners[index].placeDistance),
                        style: CommonUi.customTextStyle1(
                            Fonts.interRegular,
                            12.0,
                            FontWeight.w400,
                            AppColors.White,
                            TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
