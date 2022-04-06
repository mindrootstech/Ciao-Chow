import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/detailPge/BusinessDetailsMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController{

  final _apiProvider = ApiProvider();
  var imageSliders = <Widget>[].obs;
  List<String> arrayImages = <String>[].obs;

  void getBusinessDetails() {

    _apiProvider.getBusinessDetails().then((value)
    {
      var response = businessDetailsMainModelFromJson(value);
      arrayImages.clear();
      arrayImages.addAll(response.data!.getBusiness!.images!);
      addBannerList(arrayImages);
      // loaderLatest.value = false;

    });


  }


  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList, imageSliders);
  }


}