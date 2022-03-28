import 'package:ciao_chow/dashboard/events/ModelEventTickets.dart';
import 'package:ciao_chow/dashboard/events/ModelUpcomingEvents.dart';
import 'package:get/get.dart';

class EventsController extends GetxController{

  List<ModelEventTickets> arrayEventTicket = <ModelEventTickets>[];
  List<ModelUpcomingEvents> arrayUpcomingEvents = <ModelUpcomingEvents>[];


  @override
  void onInit() {
    super.onInit();
    arrayEventTicket = <ModelEventTickets>[];
    arrayUpcomingEvents = <ModelUpcomingEvents>[];
    // arrayLatestCheckIns = <ModelLatestCheckIns>[];
  }


}