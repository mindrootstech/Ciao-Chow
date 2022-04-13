import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsMainModel.dart';
import 'package:get/get.dart';

class EventDetailsController extends GetxController {
  var showBottomSheet = false.obs;
  var whichSheet = ''.obs;
  String eventId;
  final _apiProvider = ApiProvider();

  var isChecked = false.obs;

  EventDetailsController(this.eventId);

  @override
  void onInit() {
    super.onInit();
    showBottomSheet.value = false;
    whichSheet.value = '1';
    getEventDetails();
  }

  void getEventDetails() {
    _apiProvider.getEventDetailsData(eventId).then((value) {
      var response = eventDetailsMainModelFromJson(value);


    });

  }
}
