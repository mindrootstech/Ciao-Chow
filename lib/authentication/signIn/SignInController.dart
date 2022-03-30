import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  final _apiProvider = ApiProvider();
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loginLoaderShow = false.obs;

  // Login Api Implementation
  Future<SignInModel> logInImplementation(
      String email,
      String password,
      ) {
    return _apiProvider.getLogIn(
        email, password);
  }

}