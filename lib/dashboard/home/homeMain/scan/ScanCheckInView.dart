import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
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
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                    Text(
                      'Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum. Lorem lipsum is simply dummy text of the printing and typesetting industry. lorem lipsum.',
                      style: CommonUi.customTextStyle1(
                          Fonts.interMedium,
                          14.0,
                          FontWeight.w500,
                          AppColors.White,
                          TextDecoration.none),
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
