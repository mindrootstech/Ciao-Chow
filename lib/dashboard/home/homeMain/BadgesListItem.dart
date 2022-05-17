
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgesListItem extends StatelessWidget{

  var index;
  var arrayBadg;
  BadgesListItem(this.index, this.arrayBadg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: CachedNetworkImage(
        imageUrl:
        arrayBadg.badgeImage!,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.White,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

}