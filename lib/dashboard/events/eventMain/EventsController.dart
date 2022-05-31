import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/ModelCards.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsMainModel.dart'
    as gt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class EventsController extends GetxController {
  var arrayEventTicket = <gt.MyEventsTicket>[].obs;
  var eventsMainLoader = false.obs;
  var loaderEvents = false.obs;
  var arrayUpcomingEvents = <gt.Event>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var isChecked = false.obs;
  final _apiProvider = ApiProvider();
  var arrayCards = <ModelCards>[];
  var imageSliders = <Widget>[].obs;
  var isLoadedFluid = false.obs;
  AdSize? adSize;
  FluidAdManagerBannerAd? fluidAd;

  @override
  void onInit() {
    super.onInit();
    eventsMainLoader.value = true;
    getAllEventsData();
    loadAd();
  }

  @override
  void dispose() {
    fluidAd!.dispose();
  }

  void getAllEventsData() {
    _apiProvider.getEventsData().then((value) {
      var response = gt.eventsMainModelFromJson(value);
      if (response.status == true) {
        bannerList.clear();
        arrayEventTicket.clear();
        arrayUpcomingEvents.clear();
        arrayEventTicket.addAll(response.data!.myEventsTickets!);
        bannerList.addAll(response.data!.banners!);
        addBannerList(bannerList);
        arrayUpcomingEvents.addAll(response.data!.upcomingEvents!);
        if (isLoadedFluid.value == true) {
          var model = gt.Event();
          for (int i = 0; i <= arrayUpcomingEvents.length - 1; i++) {
            if ((i + 1) % 5 == 0) {
              model.id = -1;
              arrayUpcomingEvents.insert(i, model);
            }
          }
        }
        eventsMainLoader.value = false;
      } else {
        if (response.message! == "Your account has been deactivated. Please email us at info@ciaochow.com for further information.") {
          CommonUi.alertLogout(Get.context!,response.message!);
        } else {
          CommonUi.showToast(response.message!);
        }
      }
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList, imageSliders);
  }

  void loadAd() {
    fluidAd = FluidAdManagerBannerAd(
      adUnitId: '/6499/example/APIDemo/Fluid',
      request: AdManagerAdRequest(nonPersonalizedAds: true),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$fluidAd loaded.');
          isLoadedFluid.value = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$fluidAd failedToLoad: $error');
          isLoadedFluid.value = false;
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$fluidAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$fluidAd onAdClosed.'),
      ),
    )..load();
  }
}
