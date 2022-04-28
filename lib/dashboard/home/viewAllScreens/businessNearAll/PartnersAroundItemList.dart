
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/home/detailPage/BusinessDetailsView.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/PartnersAllNearController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnersAroundItemList extends StatelessWidget{
  var index;
  PartnersAllNearController partnersAllNearController;

  PartnersAroundItemList(this.index, this.partnersAllNearController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BusinessDetailsView(partnersAllNearController.arrayBusinessList[index].id.toString()));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              height: 180,
              fit: BoxFit.cover,
              imageUrl: partnersAllNearController.arrayBusinessList[index].featuredImageUrl!,
              placeholder: (context, url) =>  Container(
                  width: Get.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.White,
                    ),
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),


          Positioned(child: Container(
            height: 180,
            decoration: CommonUi.commonBoxDecorationAllOverlay(10.0),

          )),


          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      partnersAllNearController.arrayBusinessList[index].businessName!,
                      textAlign: TextAlign.start,
                      style: CommonUi.customTextStyle1(
                          Fonts.interMedium,
                          14.0,
                          FontWeight.w500,
                          AppColors.White,
                          TextDecoration.none),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      partnersAllNearController.arrayBusinessList[index].address!,
                      style: CommonUi.customTextStyle1(
                          Fonts.interRegular,
                          12.0,
                          FontWeight.w400,
                          AppColors.White,
                          TextDecoration.none),
                    ),
                  ),

                  partnersAllNearController.arrayBusinessList[index].distance.toString() != '' ?
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    child: Row(
                      children: [
                        Image.asset(CommonUi.setPngImage('location_miles')),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          partnersAllNearController.arrayBusinessList[index].distance!+ ' miles away',
                          style: CommonUi.customTextStyle1(
                              Fonts.interItalic,
                              8.0,
                              FontWeight.w400,
                              AppColors.White,
                              TextDecoration.none),
                        ),
                      ],
                    ),
                  ) : const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}