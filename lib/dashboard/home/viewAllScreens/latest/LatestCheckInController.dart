import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/home/viewAllScreens/latest/LatestCheckInMainModel.dart';
import 'package:get/get.dart';

class LatestCheckInController extends GetxController{

  List<UserCheckin> arrayAllCheckIns = <UserCheckin>[].obs;
  final _apiProvider = ApiProvider();
  var loaderLatest = false.obs;


  getLatestCheckIns() {
    _apiProvider.getLatestCheckIns().then((value)
    {
      var response = latestCheckInMainModelFromJson(value);
      arrayAllCheckIns.clear();
      arrayAllCheckIns.addAll(response.data!.userCheckins);
      loaderLatest.value = false;

    });

  }


}