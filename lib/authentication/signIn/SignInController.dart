import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController{

  final _apiProvider = ApiProvider();
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loginLoaderShow = false.obs;
  final getStorage = GetStorage();
  late FirebaseMessaging messaging;

  // Login Api Implementation
  Future<SignInModel> logInImplementation(
      String email,
      String password,
      ) async {

    messaging = FirebaseMessaging.instance;
    await messaging.getToken().then((token) {
      getStorage.write('firebaseToken', token);
    });

    return _apiProvider.getLogIn(
        email, password,getStorage.read('firebaseToken'));
  }

}