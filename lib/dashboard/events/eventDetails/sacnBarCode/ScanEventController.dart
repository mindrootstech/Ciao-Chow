import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/sacnBarCode/EventScanConfirmationView.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/sacnBarCode/ScanEventMainModel.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanEventController extends GetxController{

  Barcode? result;
  QRViewController? controller;
  var scanEventLoader = false.obs;
  var eventname = ''.obs;
  final _apiProvider = ApiProvider();


  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.pauseCamera();
      getScannedData(result!.code.toString());
      scanEventLoader.value = true;
    });
  }

  void getScannedData(String result) {
    _apiProvider.getScannedEvent(result).then((value) {
      if (value == 'error') {
        CommonUi.showErrorDialog(controller!);
      }else {
        var response = scanEventMainModelFromJson(value);
        if (response.status == false) {
          CommonUi.showErrorDialog(controller!);
        } else {
          Get.to(EventScanConfirmationView(eventname.toString()));
          // getHomeData(getStorage.read('lat'), getStorage.read('long'));
        }
      }
      scanEventLoader.value = false;
    });
  }
}