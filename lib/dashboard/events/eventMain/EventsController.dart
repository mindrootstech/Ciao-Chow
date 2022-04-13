import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/ModelCards.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsMainModel.dart' as gt;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {

  var arrayEventTicket = <gt.MyEventsTicket>[].obs;
  var eventsMainLoader=false.obs;
  var arrayUpcomingEvents = <gt.Event>[].obs;
  var bannerList = <gt.Banner>[].obs;
  var isChecked = false.obs;
  final _apiProvider = ApiProvider();
  List<ModelCards> arrayCards = <ModelCards>[];
  var imageSliders = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    eventsMainLoader.value = true;
    getAllEventsData();
  }

  void getAllEventsData() {
    _apiProvider.getEventsData().then((value) {
      var response = gt.eventsMainModelFromJson(value);
      bannerList.clear();
      arrayEventTicket.clear();
      arrayUpcomingEvents.clear();

      arrayEventTicket.addAll(response.data!.myEventsTickets!);
      arrayUpcomingEvents.addAll(response.data!.upcomingEvents!);
      bannerList.addAll(response.data!.banners!);
      addBannerList(bannerList);
      eventsMainLoader.value = false;
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSliders(bannerList, imageSliders);
  }
}
