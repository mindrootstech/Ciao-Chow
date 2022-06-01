import 'dart:async';
import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart' as gt;
import 'package:ciao_chow/dashboard/home/homeMain/ModelLevel.dart';
import 'package:ciao_chow/dashboard/home/homeMain/scan/LatestCheckInModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:location/location.dart' as gt;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scan/CheckInConfirmationView.dart';
import 'scan/CheckInMainModel.dart';

class HomeController extends GetxController {
  List<gt.Business> arrayPartners = <gt.Business>[].obs;
  List<gt.Badge> arrayBadges = <gt.Badge>[].obs;
  List<gt.UserCheckin> arrayLatestCheckIns = <gt.UserCheckin>[].obs;
  List<gt.Level> arrayLevels = <gt.Level>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var imageSliders = <Widget>[].obs;
  var profileData = gt.Profile().obs;
  Barcode? result;
  QRViewController? controller;
  final _apiProvider = ApiProvider();
  final getStorage = GetStorage();
  var viewShowHide = ''.obs;
  var homeLoaderShow = false.obs;
  var checkInLoader = false.obs;
  late AndroidNotificationChannel channel;
  late FirebaseMessaging messaging;
  var resLevel = ModelLevel().obs;
  var isError = false.obs;

  static const _insets = 16.0;
  AdManagerBannerAd? inlineAdaptiveAd;
  var isLoaded = false.obs;
  var isLoadedFluid = false.obs;
  AdSize? adSize;
  FluidAdManagerBannerAd? fluidAd;

  double get adWidth => MediaQuery.of(Get.context!).size.width - (2 * _insets);

  @override
  void onInit() {
    super.onInit();
    homeLoaderShow.value = true;

    getLocation();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.pauseCamera();
      getScannedData(result!.code.toString());
      checkInLoader.value = true;
    });
  }

  getHomeData(String latitude, String longitude) {
    _apiProvider.getHomeData(latitude, longitude).then((value) {
      var response = gt.homeMainModelFromJson(value);
      loadAdsList();
      loadAd();
      if (response.status == true) {
        arrayBadges.clear();
        bannerList.clear();
        arrayPartners.clear();
        arrayLatestCheckIns.clear();
        arrayLevels.clear();
        bannerList.addAll(response.data!.banners!);
        addBannerList(bannerList);
        arrayLatestCheckIns.addAll(response.data!.userCheckins!);
        arrayLevels.addAll(response.data!.levels!);
        arrayBadges.addAll(response.data!.badges!);
        profileData.value = response.data!.profile!;
        viewShowHide.value = latitude;
        arrayPartners.addAll(response.data!.businessList!);


        resLevel.value =
            CommonUi.getUserLevels(arrayLevels, profileData.value.totalPoints!);

        // if (isLoadedFluid.value == true) {
          var model = gt.Business();
          model.id = -1;
          arrayPartners.insert(2, model);
          arrayPartners.insert(5, model);
        // }
      } else {
        if (response.message! ==
            "Your account has been deactivated. Please email us at info@ciaochow.com for further information.") {
          CommonUi.alertLogout(Get.context!, response.message!);
        } else {
          CommonUi.showToast(response.message!);
        }
      }
      homeLoaderShow.value = false;
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList, imageSliders);
  }

  void getScannedData(String result) {
    _apiProvider.getScannedData(result).then((value) {
      if (value == 'error') {
        CommonUi.showErrorDialog(controller!);
      } else {
        var response = latestCheckInModelFromJson(value);
        if (response.status == false) {
          CommonUi.showErrorDialog(controller!);
        } else {
          var model = checkInMainModelFromJson(value);
          Get.to(CheckInConfirmationView(model.businessName));
          getHomeData(getStorage.read('lat'), getStorage.read('long'));
        }
      }
      checkInLoader.value = false;
    });
  }

  Future<void> request_permission1() async {
    getLocation1();
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      var status = await Permission.locationWhenInUse.status;
      if (status.isGranted) {
        timer.cancel();
        getLocation1();
      }
    });
  }

  Future<void> getLocation() async {
    try {
      Location location = Location();
      gt.PermissionStatus _permissionGranted;
      LocationData locationData;
      locationData = await location.getLocation();

      _permissionGranted =
          (await location.hasPermission()) as gt.PermissionStatus;
      if (_permissionGranted == gt.PermissionStatus.denied ||
          _permissionGranted == gt.PermissionStatus.deniedForever ||
          _permissionGranted == gt.PermissionStatus.grantedLimited) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != gt.PermissionStatus.granted) {
          getHomeData('', '');
          getStorage.write('lat', '');
          getStorage.write('long', '');
          homeLoaderShow.value = true;
        }
      } else {
        getHomeData(locationData.latitude!.toString(),
            locationData.longitude!.toString());

        getStorage.write('lat', locationData.latitude!.toString());
        getStorage.write('long', locationData.longitude!.toString());
        homeLoaderShow.value = true;
      }
    } catch (e) {
      getHomeData('', '');
      getStorage.write('lat', '');
      getStorage.write('long', '');
      homeLoaderShow.value = true;
    }
  }

  Future<void> getLocation1() async {
    Permission location_permission = Permission.location;
    bool location_status = false;
    bool ispermanetelydenied = await location_permission.isPermanentlyDenied;
    var status = await Permission.locationWhenInUse.status;

    if (ispermanetelydenied || !status.isGranted) {
      await openAppSettings();
    } else {
      var location_statu = await location_permission.request();
      location_status = location_statu.isGranted;
      getLocation();
    }
  }

  Future<void> registerNotification() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.high,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    await Firebase.initializeApp();
    FirebaseMessaging.instance.subscribeToTopic("ciaochow");
    messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      FlutterLocalNotificationsPlugin().show(
          event.hashCode,
          event.notification!.title,
          event.notification!.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: initializationSettingsAndroid.defaultIcon,
              ),
              iOS: const IOSNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              )));
    });

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    await Firebase.initializeApp();
    NotificationSettings settingss = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settingss.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted permission------');
    } else if (settingss.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // print('User granted provisional permission');
    } else if (settingss.authorizationStatus == AuthorizationStatus.denied) {
      // print('User declined or has not accepted permission------');
    }
  }


  @override
  void dispose() {
    inlineAdaptiveAd!.dispose();
    fluidAd!.dispose();
  }

  void loadAd() async {
    // await inlineAdaptiveAd!.dispose();
    // inlineAdaptiveAd = null;
    // isLoaded.value = false;

    // Get an inline adaptive size for the current orientation.
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        adWidth.truncate());

    inlineAdaptiveAd = AdManagerBannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/9214589741',
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

  void loadAdsList() {
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
