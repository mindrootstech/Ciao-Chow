import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/notifications/NotificationsMainModel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

  var loaderNotification = false.obs;
  var notificationsArray = <Notification>[].obs;
  final _apiProvider = ApiProvider();


  @override
  void onInit() {
    super.onInit();
    loaderNotification.value = true;
    getNotifications();
  }

  void getNotifications() {
    _apiProvider.getNotification().then((value)
    {
      var response = notificationsMainModelFromJson(value);
      notificationsArray.clear();
      notificationsArray.addAll(response.data!.notifications!);
      loaderNotification.value = false;

    });

  }



}