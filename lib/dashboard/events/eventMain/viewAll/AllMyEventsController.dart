import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/events/eventMain/viewAll/ModelMainAllEvents.dart';
import 'package:get/get.dart';

class AllMyEventsController extends GetxController{

  final _apiProvider = ApiProvider();
  var allMyEventsList = <MyEventTicket>[].obs;
  var loaderEvents = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderEvents.value = true;
    getAllEventsData();

  }

  void getAllEventsData() {
    _apiProvider.getAllEventsData().then((value) {
      var response = modelMainAllEventsFromJson(value);
      allMyEventsList.clear();
      allMyEventsList.addAll(response.data!.myEventTickets!);
      loaderEvents.value = false;
    });


  }

}