import 'dart:convert';

import 'package:ciao_chow/authentication/forgot/ForgotPasswordModel.dart';
import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:ciao_chow/authentication/signUp/SignUpModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends GetConnect {
  final getStorage = GetStorage();


  @override
  var baseUrl = "https://development.mind-roots.com/ciao-chow/api";

  Future<SignInModel> getLogIn(String emailText, String passwordText, String uid) async {

    final response = await post("/login", {
      'email': emailText,
      'password': passwordText,
      'register_device_type': '1',
      'firebase_id': uid,
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

  Future<SignUpModel> getSignUp(
      String userName,
      String phoneNumber,
      String email,
      String password,
      String gender,
      String dateOfBirth,
      String imagePath,
      String imageName, String uid) async {
    var request = http.MultipartRequest('POST', Uri.parse("/register"));
    var response;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    if (imagePath.isNotEmpty) {
      request.files
          .add(await http.MultipartFile.fromPath('profile_image', imagePath));
      response = await post("/register", {
        'name': userName,
        'mobile_number': phoneNumber,
        'email': email,
        'password': password,
        'gender': gender,
        'dob': dateOfBirth,
        'register_device_type': '1',
        'firebase_id': uid,
        'time_zone': 'india/kolkata'
      });
    } else {
      response = await post("/register", {
        'name': userName,
        'mobile_number': phoneNumber,
        'email': email,
        'password': password,
        'gender': gender,
        'dob': dateOfBirth,
        'register_device_type': '1',
        'firebase_id': uid,
        'time_zone': 'india/kolkata',
      });
    }
    if (response.status.hasError) {
      var errorResponce = signUpModelFromJson(response.bodyString!);
      return errorResponce;
    } else {
      var responce = signUpModelFromJson(response.bodyString!);
      return responce;
    }
  }

  Future<String> getHomeData(String latitude, String longitude) async {
    final response = await post('/home', {
      'lat': latitude,
      'long': longitude,
    }, headers: {
      'Authorization': 'Bearer ${getStorage.read('token')}'
    });
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<String> getLatestCheckIns(String page) async {
    final response = await post('/view-all-user-checkins', {'page_no': page},
        headers: {'Authorization': 'Bearer ${getStorage.read('token')}'});
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<String> getAllBusiness(String page) async {
    final response = await post('/view-all-business', {
      'page_no': page,
      'lat': getStorage.read('lat'),
      'long': getStorage.read('long')
    }, headers: {
      'Authorization': 'Bearer ${getStorage.read('token')}'
    });
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<ForgotPasswordModel> getForgotPassword(String email) async {
    final response = await post("/forgot-password", {'email': email});
    if (response.status.hasError) {
      var errorResponce = forgotPasswordModelFromJson(response.bodyString!);
      return errorResponce;
    } else {
      var responce = forgotPasswordModelFromJson(response.bodyString!);
      return responce;
    }
  }

  Future<String> getScannedData(String result) async {
    final response = await post('/user-checkin', {
      'business_identifier': result,
      'user_lat': getStorage.read('lat'),
      'user_long': getStorage.read('long')
    }, headers: {
      'Authorization': 'Bearer ${getStorage.read('token')}'
    });
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<String> getBusinessDetails(String id) async {
    final response = await post('/business-details', {
      'business_id': id,
      'lat': getStorage.read('lat'),
      'long': getStorage.read('long')
    }, headers: {
      'Authorization': 'Bearer ${getStorage.read('token')}'
    });
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }
}
