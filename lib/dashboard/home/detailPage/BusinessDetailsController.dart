import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BusinessDetailsMainModel.dart';

class BusinessDetailsController extends GetxController{

  final _apiProvider = ApiProvider();
  var imageSliders = <Widget>[].obs;
  List<String> arrayImages = <String>[].obs;
  var openingHours = <OpeningHour>[].obs;
  var getBusiness = GetBusiness().obs;
  var upcomingEvents = <UpcomingEvent>[].obs;
  var userCheckIn = ''.obs;
  var businessDetailsLoaderShow = false.obs;

  void getBusinessDetails(String id) {
    _apiProvider.getBusinessDetails(id).then((value)
    {
      var response = businessDetailsMainModelFromJson(value);
      arrayImages.clear();
      upcomingEvents.clear();
      arrayImages.addAll(response.data!.getBusiness!.images!);
      getBusiness.value = response.data!.getBusiness!;
      userCheckIn.value = response.data!.usersCheckins!;
      openingHours.addAll(response.data!.getBusiness!.openingHours!);
      upcomingEvents.addAll(response.data!.upcomingEvents!);
      addBannerList(arrayImages);
      businessDetailsLoaderShow.value = false;
    });
  }


  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSlidersDetails(bannerList, imageSliders);
  }


}