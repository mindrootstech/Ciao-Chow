import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

mixin Utils {
  static String getString(BuildContext context, String? key) {
    if (key != '') {
      return tr(key!);
    } else {
      return '';
    }
  }

  static DateTime? previous;
  static void psPrint(String? msg) {
    final DateTime now = DateTime.now();
    int min = 0;
    if (previous == null) {
      previous = now;
    } else {
      min = now.difference(previous!).inMilliseconds;
      previous = now;
    }

    print('$now ($min)- $msg');
  }

}