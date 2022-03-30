import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect{

  @override
  var baseUrl = 'https://development.mind-roots.com/ciao-chow/api';


  Future<SignInModel> getLogIn(String emailText, String passwordText) async {
    final response = await post('${baseUrl}/login', {
      'email': emailText,
      'password': passwordText,
      'register_device_type': '1',
      'firebase_id': '',
      'time_zone': 'India'
    });
    if (response.status.hasError) {
      var errorResponce = loginModelFromJson(response.bodyString!);
      return errorResponce;
    } else {
      var responce = loginModelFromJson(response.bodyString!);
      return responce;
    }
  }

}
