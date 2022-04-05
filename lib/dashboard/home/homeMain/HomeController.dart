import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart' as gt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController {
  List<gt.BusinessList> arrayPartners = <gt.BusinessList>[].obs;
  List<gt.UserCheckin> arrayLatestCheckIns = <gt.UserCheckin>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var imageSliders = <Widget>[].obs;
  var profileData = gt.Profile().obs;
  Barcode? result;
  QRViewController? controller;
  final _apiProvider = ApiProvider();
  final getStorage = GetStorage();


  @override
  void onInit() {
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  getHomeData(double latitude, double longitude) {
    _apiProvider.getHomeData(latitude.toString(),longitude.toString()).then((value)
        {
          var response = gt.homeMainModelFromJson(value);
          bannerList.clear();
          arrayPartners.clear();
          arrayLatestCheckIns.clear();
          bannerList.addAll(response.data.banners);
          addBannerList(bannerList);
          arrayPartners.addAll(response.data.businessList);
          arrayLatestCheckIns.addAll(response.data.userCheckins);
          profileData.value =  response.data.profile;

        });

  }



  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList,imageSliders);
  }


}
