import 'package:ciao_chow/dashboard/home/homeMain/ModelLatestCheckIns.dart';
import 'package:ciao_chow/dashboard/home/homeMain/ModelPartners.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List<ModelPartners> arrayPartners = <ModelPartners>[];
  List<ModelLatestCheckIns> arrayLatestCheckIns = <ModelLatestCheckIns>[];

  @override
  void onInit() {
    super.onInit();
    arrayPartners = <ModelPartners>[];
    arrayLatestCheckIns = <ModelLatestCheckIns>[];
  }

}