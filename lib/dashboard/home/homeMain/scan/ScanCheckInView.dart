import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanCheckInView extends StatelessWidget {
  ScanCheckInView({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    homeController.checkInLoader.value = false;
    return Container(
      color: AppColors.White,
      child: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: homeController.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderRadius: 0,
              borderWidth: 4,
              borderLength: 40,
              borderColor: AppColors.White,
              cutOutSize: Get.width - 100,
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                              CommonUi.setSvgImage('white_cross_sheet')),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Text(
                        Utils.getString(context,'please_scan'),
                        style: CommonUi.customTextStyle1(
                            Fonts.interMedium,
                            14.0,
                            FontWeight.w500,
                            AppColors.White,
                            TextDecoration.none),textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(() => homeController.checkInLoader.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.AppColorGrad2,
                    ),
                  )
                : Container()),
          ),
        ],
      ),
    );
  }
}
