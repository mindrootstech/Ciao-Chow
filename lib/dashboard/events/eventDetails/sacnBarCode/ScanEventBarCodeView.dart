import 'dart:async';

import 'package:ciao_chow/dashboard/events/eventDetails/sacnBarCode/ScanEventController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanEventBarCodeView extends StatelessWidget {

  var scanBarEventController = Get.put(ScanEventController());
  ScanEventBarCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
