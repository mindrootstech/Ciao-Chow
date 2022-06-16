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
  AdSize? adSize;
  static const _insets = 16.0;
  AdManagerBannerAd? inlineAdaptiveAd;
  var isLoaded = false.obs;
  AdManagerBannerAd? inlineAdaptiveAdList;
  var isLoadedList = false.obs;
  AdSize? adSizeList;
  double get adWidth => MediaQuery.of(Get.context!).size.width - (2 * _insets);

  @override
  void onInit() {
    super.onInit();
    eventsMainLoader.value = true;
    getAllEventsData();
    loadAd();
    loadInlineAd();
  }

  @override
  void dispose() {
    inlineAdaptiveAdList!.dispose();
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
        if (arrayUpcomingEvents.isNotEmpty) {
          var model = gt.Event();
          for (int i = 0; i <= arrayUpcomingEvents.length - 1; i++) {
            if ((i + 1) % 4 == 0) {
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

  Future<void> loadAd() async {
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        adWidth.truncate());
    inlineAdaptiveAdList = AdManagerBannerAd(
      adUnitId: 'ca-app-pub-9350047529795137/7885394490',
      sizes: [size],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) async {
          print('Inline adaptive banner loaded: ${ad.responseInfo}');
          AdManagerBannerAd bannerAd = (ad as AdManagerBannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();
          if (size == null) {
            print('Error: getPlatformAdSize() returned null for $bannerAd');
            return;
          }
          inlineAdaptiveAdList = bannerAd;
          isLoadedList.value = true;
          adSizeList = size;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Inline adaptive banner failedToLoad: $error');
          isLoadedList.value = false;
          ad.dispose();
        },
      ),
    );
    await inlineAdaptiveAdList!.load();
  }

  Future<void> loadInlineAd() async {
    // await inlineAdaptiveAd!.dispose();
    // inlineAdaptiveAd = null;
    // isLoaded.value = false;

    // Get an inline adaptive size for the current orientation.
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        adWidth.truncate());

    inlineAdaptiveAd = AdManagerBannerAd(
      adUnitId: 'ca-app-pub-9350047529795137/7885394490',
      sizes: [size],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) async {
          print('Inline adaptive banner loaded: ${ad.responseInfo}');

          // After the ad is loaded, get the platform ad size and use it to
          // update the height of the container. This is necessary because the
          // height can change after the ad is loaded.
          AdManagerBannerAd bannerAd = (ad as AdManagerBannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();
          if (size == null) {
            print('Error: getPlatformAdSize() returned null for $bannerAd');
            return;
          }

          inlineAdaptiveAd = bannerAd;
          isLoaded.value = true;
          adSize = size;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Inline adaptive banner failedToLoad: $error');
          isLoaded.value = false;
          ad.dispose();
        },
      ),
    );
    await inlineAdaptiveAd!.load();


  }
}
