import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeMainModel.dart';
import 'package:ciao_chow/dashboard/home/homeMain/ModelLatestCheckIns.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController {
  List<BusinessList> arrayPartners = <BusinessList>[];
  List<ModelLatestCheckIns> arrayLatestCheckIns = <ModelLatestCheckIns>[];
  List<Banner> bannerList = <Banner>[];
  Barcode? result;
  QRViewController? controller;
  final _apiProvider = ApiProvider();


  @override
  void onInit() {
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  getHomeData(double latitude, double longitude) {
    _apiProvider.getHomeData(latitude.toString(),longitude.toString()).then((value)
        {
          var response = homeMainModelFromJson(value);
          bannerList.clear();
          arrayPartners.clear();
          bannerList.addAll(response.data.banners);
          arrayPartners.addAll(response.data.businessList);

        });

  }


}
