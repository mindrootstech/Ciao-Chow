import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/BusinessMainModel.dart'
    as gt;
import 'package:ciao_chow/dashboard/home/viewAllScreens/businessNearAll/BusinessMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PartnersAllNearController extends GetxController {
  final _apiProvider = ApiProvider();
  List<BusinessList> arrayBusinessList = <gt.BusinessList>[].obs;
  var imageSliders = <Widget>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var parentAllLoaderShow = false.obs;
  var scrollController = ScrollController();
  var searchBusiness = TextEditingController().obs;
  var page = 1;
  var pageLoader = false.obs;
  var totalBusinessItems = 0;
  var searchTxt = ''.obs;
  AdSize? adSize;
  AdManagerBannerAd? inlineAdaptiveAdList;
  var isLoadedList = false.obs;
  AdSize? adSizeList;
  static const _insets = 16.0;
  double get adWidth => MediaQuery.of(Get.context!).size.width - (2 * _insets);


  @override
  void onInit() {
    super.onInit();
    loadAd();
  }

  void getAllBusinessList() {
    parentAllLoaderShow.value = true;
    _apiProvider
        .getAllBusiness(
            page.toString(), searchBusiness.value.text.toString().trim())
        .then((value) {
      var response = businessMainModelFromJson(value);
      arrayBusinessList.clear();
      bannerList.clear();
      bannerList.addAll(response.data!.banners!);
      addBannerList(bannerList);
      totalBusinessItems = response.data!.businessCount!;
      searchTxt.value = searchBusiness.value.text.toString().trim();
      parentAllLoaderShow.value = false;
      arrayBusinessList.addAll(response.data!.businessList!);

      // if (isLoadedList.value == true) {
        var model = gt.BusinessList();
        for (int i = 0; i <= arrayBusinessList.length - 1; i++) {
          if ((i + 1) % 4 == 0) {
            model.id = -1;
            arrayBusinessList.insert(i, model);
          }
        }
      // }
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSlidersWithName(bannerList, imageSliders);
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

  @override
  void dispose() {
    inlineAdaptiveAdList!.dispose();
  }
}
