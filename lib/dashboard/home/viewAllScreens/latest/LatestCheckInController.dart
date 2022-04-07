import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestCheckInController extends GetxController{

  List<UserCheckin> arrayAllCheckIns = <UserCheckin>[].obs;
  final _apiProvider = ApiProvider();
  var loaderLatest = false.obs;
  var scrollController = ScrollController();
  var page = 1;
  var pageLoader = false.obs;
  var totalLatestCheckInItems = 0;


  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(pagination);
  }

  getLatestCheckIns() {
    _apiProvider.getLatestCheckIns(page.toString()).then((value)
    {
      var response = latestCheckInMainModelFromJson(value);
      arrayAllCheckIns.clear();
      arrayAllCheckIns.addAll(response.data!.userCheckins!);
      totalLatestCheckInItems = 2;
      loaderLatest.value = false;
    });
  }


  void pagination() {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      page = page + 1;
        if (totalLatestCheckInItems > arrayAllCheckIns.length) {
          pageLoader.value = true;
          getLatestCheckIns();
        } else {
          pageLoader.value = false;
          page = 0;
        }
    }
  }


}