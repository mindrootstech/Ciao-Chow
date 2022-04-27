import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/detailPage/BusinessDetailsController.dart';
import 'package:ciao_chow/dashboard/home/detailPage/UpcomingEventBusinessItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessUpcomingViewAll extends StatelessWidget{
  BusinessUpcomingViewAll({Key? key}) : super(key: key);
  BusinessDetailsController businessDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Scaffold(
         backgroundColor: AppColors.White,
         appBar: AppBar(
           elevation: 0,
           backgroundColor: AppColors.AppColorGrad2,
           leading: Builder(
             builder: (BuildContext context) {
               return IconButton(
                 icon: const Icon(Icons.arrow_back_ios),
                 onPressed: () {
                   Get.back();
                 },
               );
             },
           ),
           centerTitle: true,
           title: Text(
             Utils.getString(context, 'my_event_tickets'),
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
                     () => Container(
                     margin: const EdgeInsets.only(
                       left: 16,
                       right: 16,
                     ),
                     child: GridView.builder(
                         padding: const EdgeInsets.only(top: 0, bottom: 120),
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         gridDelegate:
                         const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             crossAxisSpacing: 10,
                             mainAxisSpacing: 12,
                             mainAxisExtent: 180),
                         itemCount:
                         businessDetailsController.upcomingEvents.length,
                         itemBuilder: (BuildContext context, int index) {
                           return UpcomingEventBusinessItem(index);
                         })),
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
         child: Obx(() => businessDetailsController.businessDetailsLoaderShow.value
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