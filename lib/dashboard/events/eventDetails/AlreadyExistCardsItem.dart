import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlreadyExistCardsItem extends StatelessWidget {
  var index;
  EventsController eventsController;

  AlreadyExistCardsItem(this.index, this.eventsController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card: xxxx xxxx xxxx 1423',
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 16.0,
                        FontWeight.w600, AppColors.Black, TextDecoration.none),
                  ),
                   const SizedBox(height: 4,),
                   Text(
                    'Exp: 8/2028',
                    style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                        FontWeight.w500, AppColors.Black, TextDecoration.none),
                  ),
                  const SizedBox(height: 4,),
                   Text(
                    'Card Type: Visa',
                    style: CommonUi.customTextStyle1(Fonts.interMedium, 14.0,
                        FontWeight.w500, AppColors.Black, TextDecoration.none),
                  ),


                ],
              ),
              SizedBox(
                width: 18,height: 18,
                  child: SvgPicture.asset(CommonUi.setSvgImage('')))
            ],
          ),
          const SizedBox(height: 10,),
          Container(height: 1,color: AppColors.dividerClr,),

        ],
      ),
    );
  }
}
