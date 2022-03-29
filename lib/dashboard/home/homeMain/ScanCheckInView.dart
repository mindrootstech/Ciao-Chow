
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanCheckInView extends StatelessWidget{
  ScanCheckInView({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.White,
      child:  QRView(
        key: qrKey,
        onQRViewCreated: homeController.onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 0,
          borderWidth: 4,
          borderLength: 40,
          borderColor: AppColors.White,
          cutOutSize: Get.width - 50,
        ),
      ),

    );
  }

}