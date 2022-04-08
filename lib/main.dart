import 'dart:async';

import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Language.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/splash/SplashView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(EasyLocalization(
      path: 'assets/langs',
      saveLocale: true,
      startLocale: CommonUi.defaultLanguage.toLocale(),
      supportedLocales: getSupportedLanguages(),
      child: MyApp())
  );
}

List<Locale> getSupportedLanguages() {
  final List<Locale> localeList = <Locale>[];
  for (final Language lang in CommonUi.psSupportedLanguageList) {
    localeList.add(Locale(lang.languageCode, lang.countryCode));
  }
  print('Loaded Languages');
  return localeList;
}

class MyApp extends StatelessWidget {
  Completer<ThemeData>? themeDataCompleter;

  MyApp({Key? key}) : super(key: key);

  Future<ThemeData> getSharePerference(
      EasyLocalization provider, dynamic data) {
    Utils.psPrint('>> get share perference');
    if (themeDataCompleter == null) {
      Utils.psPrint('init completer');
      themeDataCompleter = Completer<ThemeData>();
    }

    return themeDataCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashView(),
    );
  }
}
