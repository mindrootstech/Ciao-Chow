import 'dart:async';
import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart' as gt;
import 'package:ciao_chow/dashboard/home/homeMain/ModelLevel.dart';
import 'package:ciao_chow/dashboard/home/homeMain/scan/LatestCheckInModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart' as gt;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController {
  List<gt.Business> arrayPartners = <gt.Business>[].obs;
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

  @override
  void onInit() {
    super.onInit();
    homeLoaderShow.value = true;
    getLocation();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
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
      bannerList.clear();
      arrayPartners.clear();
      arrayLatestCheckIns.clear();
      bannerList.addAll(response.data!.banners!);
      addBannerList(bannerList);
      arrayPartners.addAll(response.data!.businessList!);
      arrayLatestCheckIns.addAll(response.data!.userCheckins!);
      arrayLevels.addAll(response.data!.levels!);
      profileData.value = response.data!.profile!;
      viewShowHide.value = latitude;
      homeLoaderShow.value = false;
      resLevel.value = CommonUi.getUserLevels(arrayLevels);
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList, imageSliders);
  }

  void getScannedData(String result) {
    _apiProvider.getScannedData(result).then((value) {
      if (value == 'error') {
        CommonUi.showToast('Already Checked In');
        return;
      } else {
        var response = latestCheckInModelFromJson(value);
        if (response.status == false) {
          CommonUi.showToast(response.message!);
          controller!.resumeCamera();
        } else {
          Get.back();
          getHomeData(getStorage.read('lat'), getStorage.read('long'));
        }
      }
      checkInLoader.value = false;
    });
  }

  Future<void> request_permission1() async {
    getLocation1();
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      Permission location_permission = Permission.location;
      bool location_status = false;
      bool ispermanetelydenied = await location_permission.isPermanentlyDenied;
      var status = await Permission.locationWhenInUse.status;
      // bool serviceEnabled;
      // LocationPermission permission;
      //
      // // Test if location services are enabled.
      // serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // if (!serviceEnabled) {
      //   return Future.error('Location services are disabled.');
      // }else {
      //   timer.cancel();
      //   getLocation1();
      // }

      if (status.isGranted) {
        timer.cancel();
        getLocation1();
      }
    });
  }

  Future<void> getLocation() async {
    try {
      Location location = Location();

      bool _serviceEnabled;
      gt.PermissionStatus _permissionGranted;
      LocationData locationData;

      // _serviceEnabled = await location.serviceEnabled();
      // if (!_serviceEnabled) {
      //   _serviceEnabled = await location.requestService();
      //   if (!_serviceEnabled) {
      //     return;
      //   }
      // }

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
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();
    FirebaseMessaging.instance.subscribeToTopic("ciaochow");

    // 2. Instantiate Firebase Messaging
    messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((token) {
    //   // print('firebase token dddd ${token}');
    //   storage.write('firebaseToken', token);
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      // print("message recieved");
      // print(event.notification!.body);

      // var platform = NotificationDetails(
      //     android: AndroidNotificationDetails(
      //       channel.id,
      //       channel.name,
      //       channelDescription: channel.description,
      //     ),
      //     iOS: const IOSNotificationDetails(
      //       presentAlert: true,
      //       presentBadge: true,
      //       presentSound: true,
      //     ),
      //     macOS: null);

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
    var messagingg = FirebaseMessaging.instance;
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
}
