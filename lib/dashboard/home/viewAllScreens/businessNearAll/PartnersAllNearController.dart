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
  var scrollController = ScrollController();
  var searchBusiness = TextEditingController().obs;
  var page = 1;
  var pageLoader = false.obs;
  var totalBusinessItems = 0;
  var searchTxt = ''.obs;

  @override
  void onInit() {
    super.onInit();
    parentAllLoaderShow.value = true;
    getAllBusinessList();
  }

  void getAllBusinessList() {
    _apiProvider.getAllBusiness(page.toString(),searchBusiness.value.text.toString().trim()).then((value)
    {
      var response = businessMainModelFromJson(value);
      arrayBusinessList.clear();
      bannerList.clear();
      arrayBusinessList.addAll(response.data!.businessList!);
      bannerList.addAll(response.data!.banners!);
      addBannerList(bannerList);
      totalBusinessItems = response.data!.businessCount!;
      searchTxt.value = searchBusiness.value.text.toString().trim();
      parentAllLoaderShow.value = false;

    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList,imageSliders);
  }


  void pagination() {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      page = page + 1;
      if (totalBusinessItems > arrayBusinessList.length) {
        pageLoader.value = true;
        getAllBusinessList();
      } else {
        pageLoader.value = false;
        page = 0;
      }
    }
  }


}