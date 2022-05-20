import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
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
      if(response.status == true) {
        notificationsArray.clear();
        notificationsArray.addAll(response.data!.notifications!);
        loaderNotification.value = false;
      }else {
        if (response.message! == "Your account has been deactivated. Please email us at info@ciaochow.com for further information.") {
          CommonUi.alertLogout(Get.context!,response.message!);
        } else {
          CommonUi.showToast(response.message!);
        }
      }

    });

  }



}