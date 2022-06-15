import 'dart:io';

import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'BusinessDetailsMainModel.dart';

class BusinessDetailsController extends GetxController {
  final _apiProvider = ApiProvider();
  var imageSliders = <Widget>[].obs;
  List<String> arrayImages = <String>[].obs;
  var openingHours = <OpeningHour>[].obs;
  var getBusiness = GetBusiness().obs;
  var upcomingEvents = <UpcomingEvent>[].obs;
  var userCheckIn = ''.obs;
  var businessDetailsLoaderShow = false.obs;
  BannerAd? anchoredAdaptiveAd;
  var isLoaded = false.obs;

  void getBusinessDetails(String id) {
    _apiProvider.getBusinessDetails(id).then((value) {
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


  @override
  void onInit() {
    super.onInit();
    loadAd();
  }

  @override
  void dispose() {
    anchoredAdaptiveAd!.dispose();
  }

  Future<void> loadAd() async {
    await anchoredAdaptiveAd?.dispose();
    anchoredAdaptiveAd = null;
    isLoaded.value = false;

    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(Get.context!).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    anchoredAdaptiveAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-9350047529795137/9710785517'
          : 'ca-app-pub-9350047529795137/6436032716',
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          anchoredAdaptiveAd = ad as BannerAd;
          isLoaded.value = true;
          // });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return anchoredAdaptiveAd!.load();
  }
}
