import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/authentication/forgot/ForgotPasswordModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  var emailController = TextEditingController().obs;
  final _apiProvider = ApiProvider();
  var forgotLoaderShow = false.obs;


  Future<ForgotPasswordModel> forgotApiImplementation(String email) {
    return _apiProvider.getForgotPassword(email);
  }

}
