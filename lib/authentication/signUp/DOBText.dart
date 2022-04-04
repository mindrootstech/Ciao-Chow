import 'package:ciao_chow/authentication/signUp/ModelText.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DOBText extends StatelessWidget {
  final ModelText textValue;
  const DOBText({Key? key, required this.textValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(top: 20,left: 20),
      height: 50,
      decoration: CommonUi.commonBoxDecorationAllSides(10.0,AppColors.textFieldsMain),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textValue.name,
            style: CommonUi.customTextStyle1(Fonts.interRegular,
              12.0,
              FontWeight.w400,
              AppColors.Black,
              TextDecoration.none,),
          ),
          const Icon(Icons.keyboard_arrow_down,color: AppColors.textFieldsHint,)


          // !textValue.showIcon
          //     ? Container()
          //     : SizedBox(
          //     height: 20,
          //     width: 20,
          //     child: SvgPicture.asset(CommonUi.setSvgImage("blue_check")))
        ],
      ),
    );
  }
}