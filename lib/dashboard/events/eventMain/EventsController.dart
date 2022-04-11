import 'package:ciao_chow/dashboard/events/eventMain/ModelEventTickets.dart';
import 'package:ciao_chow/dashboard/events/eventMain/ModelUpcomingEvents.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  List<ModelEventTickets> arrayEventTicket = <ModelEventTickets>[];
  List<ModelUpcomingEvents> arrayUpcomingEvents = <ModelUpcomingEvents>[];
  var showBottomSheet = false.obs;
  var whichSheet = ''.obs;
  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    arrayEventTicket = <ModelEventTickets>[];
    arrayUpcomingEvents = <ModelUpcomingEvents>[];
    // arrayLatestCheckIns = <ModelLatestCheckIns>[];
  }
}
