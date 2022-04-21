import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/sacnBarCode/ScanEventMainModel.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanEventController extends GetxController{

  Barcode? result;
  QRViewController? controller;
  var scanEventLoader = false.obs;
  final _apiProvider = ApiProvider();


  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
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
        CommonUi.showToast('Already Checked In');
        return;
      }else {
        var response = scanEventMainModelFromJson(value);
        if (response.status == false) {
          CommonUi.showToast(response.message!);
        } else {
          Get.back();
          // getHomeData(getStorage.read('lat'), getStorage.read('long'));
        }
      }
      scanEventLoader.value = false;
    });
  }
}