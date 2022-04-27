import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/home/detailPage/BusinessDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpeningHoursItem extends StatelessWidget {
  var index;
  OpeningHoursItem(this.index);
  BusinessDetailsController businessDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          businessDetailsController
              .getBusiness.value.openingHours![index].day.toString() != 'null' ?
          Expanded(
            flex: 1,
            child: Text(
              businessDetailsController
                  .getBusiness.value.openingHours![index].day! ,
              style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
                  FontWeight.w400, AppColors.textFieldsHint, TextDecoration.none),
            ),
          ): const SizedBox(),

          const SizedBox(width: 15,),

          businessDetailsController
              .getBusiness.value.openingHours![index].opening.toString() != 'null' ?
          Expanded(
            flex: 2,
            child: Text(
              businessDetailsController
                  .getBusiness.value.openingHours![index].dayoff! == 0 ?

              businessDetailsController
                  .getBusiness.value.openingHours![index].opening! +
              '-' +
              businessDetailsController
                  .getBusiness.value.openingHours![index].closing! : 'Closed',
              style: CommonUi.customTextStyle1(Fonts.interRegular, 12.0,
              FontWeight.w400, AppColors.textFieldsHint, TextDecoration.none),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}
