import 'package:ciao_chow/dashboard/home/ModelPartners.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List<ModelPartners> arrayPartners = <ModelPartners>[];

  @override
  void onInit() {
    super.onInit();
    arrayPartners = <ModelPartners>[];
  }

}