import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/detailPge/BusinessDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnersHomeListItem extends StatelessWidget {
  var index;
  HomeController homeController;

  PartnersHomeListItem(this.index, this.homeController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BusinessDetailsView(homeController.arrayPartners[index].id!.toString()));
      },
      child: Stack(
        children: [
          Container(
              // height: double.maxFinite,
              width: 150,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  height: 200,
                  fit: BoxFit.cover,
                  imageUrl: homeController.arrayPartners[index].featuredImageUrl!,
                  placeholder: (context, url) => Transform.scale(
                      scale: 0.2,
                      child: const CircularProgressIndicator(
                        strokeWidth: 10.5,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )),

          Positioned(child: Container(
            width: 150,
            margin: const EdgeInsets.only(right: 10),
            decoration: CommonUi.commonBoxDecorationAllOverlay(10.0),

          )),

          // Image.network(homeController.arrayPartners[index].image,fit: BoxFit.cover,))),

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
                      Utils.getString(context,
                          homeController.arrayPartners[index].businessName),
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
                      Utils.getString(context,
                          homeController.arrayPartners[index].address),
                      style: CommonUi.customTextStyle1(
                          Fonts.interRegular,
                          12.0,
                          FontWeight.w400,
                          AppColors.White,
                          TextDecoration.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    child: Row(
                      children: [
                        Image.asset(CommonUi.setPngImage('location_miles')),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          Utils.getString(
                              context,
                              homeController
                                  .arrayPartners[index].distance! + ' miles away'),
                          style: CommonUi.customTextStyle1(
                              Fonts.interItalic,
                              8.0,
                              FontWeight.w400,
                              AppColors.White,
                              TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
