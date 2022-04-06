import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/BusinessMainModel.dart' as gt;
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/BusinessMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnersAllNearController extends GetxController{

  final _apiProvider = ApiProvider();
  List<BusinessList> arrayBusinessList = <gt.BusinessList>[].obs;
  var  imageSliders = <Widget>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var parentAllLoaderShow = false.obs;

  void getAllBusinessList() {
    _apiProvider.getAllBusiness().then((value)
    {
      var response = businessMainModelFromJson(value);
      arrayBusinessList.clear();
      bannerList.clear();
      arrayBusinessList.addAll(response.data!.businessList);
      bannerList.addAll(response.data!.banners);
      addBannerList(bannerList);
      parentAllLoaderShow.value = false;

    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList,imageSliders);
  }


}