import 'package:ciao_chow/dashboard/home/homeMain/ModelLatestCheckIns.dart';
import 'package:ciao_chow/dashboard/home/homeMain/ModelPartners.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController {
  List<ModelPartners> arrayPartners = <ModelPartners>[];
  List<ModelLatestCheckIns> arrayLatestCheckIns = <ModelLatestCheckIns>[];
  Barcode? result;
  QRViewController? controller;


  @override
  void onInit() {
    super.onInit();
    arrayPartners = <ModelPartners>[];
    arrayLatestCheckIns = <ModelLatestCheckIns>[];
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }
}
