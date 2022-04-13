
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BookingDoneView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAddCard extends StatelessWidget{
  const BottomSheetAddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     width: Get.width,
     decoration: CommonUi.commonBoxDecoration(
         20.0, AppColors.White),
     padding : const EdgeInsets.only(
         left: 20, right: 20),
     child: Material(
       child: Container(
         color: AppColors.White,
         child: Column(
           children: [
             const SizedBox(
               height: 25,
             ),
             Text(
               Utils.getString(
                 context,
                 'add_new_card',
               ),
               style: CommonUi.customTextStyle1(
                   Fonts.interSemiBold,
                   18.0,
                   FontWeight.w600,
                   AppColors.Black,
                   TextDecoration.none),
             ),
             const SizedBox(
               height: 15,
             ),
             Text(
               Utils.getString(
                 context,
                 'please_fill_details',
               ),
               style: CommonUi.customTextStyle2(
                 Fonts.interLight,
                 14.0,
                 FontWeight.w300,
                 AppColors.lightBlack,
                 TextDecoration.none,
               ),
             ),
             const SizedBox(
               height: 24,
             ),
             TextFormField(
               // validator: (value) {
               //   if (value == null || value.isEmpty) {
               //     return 'Please enter name';
               //   }
               //   return null;
               // },
               // controller: signUpController.userName.value,
                 cursorColor: AppColors.textFieldsHint,
                 decoration:
                 CommonUi.textFieldDecorationCard(
                     Utils.getString(
                         context, 'name_on_card')),
                 style: CommonUi.customTextStyle1(
                     Fonts.interMedium,
                     15.0,
                     FontWeight.w500,
                     AppColors.Black,
                     TextDecoration.none)),
             const SizedBox(
               height: 24,
             ),
             TextFormField(
               // validator: (value) {
               //   if (value == null || value.isEmpty) {
               //     return 'Please enter name';
               //   }
               //   return null;
               // },
               // controller: signUpController.userName.value,
                 cursorColor: AppColors.textFieldsHint,
                 decoration:
                 CommonUi.textFieldDecorationCard(
                     Utils.getString(
                         context, 'card_number')),
                 style: CommonUi.customTextStyle1(
                     Fonts.interMedium,
                     15.0,
                     FontWeight.w500,
                     AppColors.Black,
                     TextDecoration.none)),
             const SizedBox(
               height: 24,
             ),
             Row(
               mainAxisAlignment:
               MainAxisAlignment.spaceAround,
               children: [
                 Expanded(
                   flex: 2,
                   child: TextFormField(

                     // validator: (value) {
                     //   if (value == null || value.isEmpty) {
                     //     return 'Please enter name';
                     //   }
                     //   return null;
                     // },
                     // controller: signUpController.userName.value,
                       cursorColor:
                       AppColors.textFieldsHint,
                       decoration: CommonUi
                           .textFieldDecorationCard(
                           Utils.getString(context,
                               'expiry_date')),
                       style:
                       CommonUi.customTextStyle1(
                           Fonts.interMedium,
                           15.0,
                           FontWeight.w500,
                           AppColors.Black,
                           TextDecoration.none)),
                 ),

                 const SizedBox(width: 30,),

                 Expanded(
                   flex: 1,
                   child: TextFormField(
                     // validator: (value) {
                     //   if (value == null || value.isEmpty) {
                     //     return 'Please enter name';
                     //   }
                     //   return null;
                     // },
                     // controller: signUpController.userName.value,
                       cursorColor:
                       AppColors.textFieldsHint,
                       decoration: CommonUi
                           .textFieldDecorationCard(
                           Utils.getString(context,
                               'cvv')),
                       style:
                       CommonUi.customTextStyle1(
                           Fonts.interMedium,
                           15.0,
                           FontWeight.w500,
                           AppColors.Black,
                           TextDecoration.none)),
                 ),
               ],
             ),

             GestureDetector(
               onTap: () {
                Get.off(BookingDoneView());
               },
               child: Container(
                 child: Center(
                   child: Text(
                       Utils.getString(
                           context, 'done'),
                       style:
                       CommonUi.customTextStyle1(
                           Fonts.interMedium,
                           14.0,
                           FontWeight.w500,
                           AppColors.White,
                           TextDecoration.none)),
                 ),
                 height: 50,
                 width: Get.width,
                 margin: const EdgeInsets.only(
                     left: 40,
                     right: 40,
                     top: 90,
                     bottom: 70),
                 decoration:
                 CommonUi.shadowRoundedContainer,
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }

}