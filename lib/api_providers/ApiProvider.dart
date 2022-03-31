import 'package:ciao_chow/authentication/forgot/ForgotPasswordModel.dart';
import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect{

  @override
  var baseUrl = "https://development.mind-roots.com/ciao-chow/api";


  Future<SignInModel> getLogIn(String emailText, String passwordText) async {
    final response = await post("/login", {
      'email': emailText,
      'password': passwordText,
      'register_device_type': '1',
      'firebase_id': 'abc',
      'time_zone': 'india/kolkata'
    });
      if (response.status.hasError) {
        var errorResponce = loginModelFromJson(response.bodyString!);
        return errorResponce;
      } else {
        var responce = loginModelFromJson(response.bodyString!);
        return responce;
      }
  }

  Future<ForgotPasswordModel> getForgotPassword(String email) async {
    final response = await post("/forgot-password", {
      'email': email
    });
    if (response.status.hasError) {
      var errorResponce = forgotModelFromJson(response.bodyString!);
      return errorResponce;
    } else {
      var responce = forgotModelFromJson(response.bodyString!);
      return responce;
    }
  }

}
