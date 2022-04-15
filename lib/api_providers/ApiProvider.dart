import 'dart:convert';
import 'dart:io';
import 'package:ciao_chow/authentication/forgot/ForgotPasswordModel.dart';
import 'package:ciao_chow/authentication/signIn/SignInModel.dart';
import 'package:ciao_chow/authentication/signUp/SignUpModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends GetConnect {
  final getStorage = GetStorage();

  @override
  var baseUrl = "https://development.mind-roots.com/ciao-chow/api";

  var stripeKey =
      'Bearer sk_test_51KaYKaFweZ0Ebm3nR7s7leYZAKzl1P4ph22hi4AOhsMI2uA8oQ23DqebuvYEwV2ympTOgKb6ud2okrnxZxMS4a5R00TLWyVDF8';

  var stripeUrl = 'https://api.stripe.com/v1/customers/';
  var stripeTokenUrl = 'https://api.stripe.com/v1/tokens';

  Future<SignInModel> getLogIn(
      String emailText, String passwordText, String uid) async {
    var type = '';
    if (Platform.isAndroid) {
      type = '1';
    } else if (Platform.isIOS) {
      type = '2';
    }

    final response = await post("/login", {
      'email': emailText,
      'password': passwordText,
      'register_device_type': type,
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
      String imageName,
      String uid) async {
    var request = http.MultipartRequest('POST', Uri.parse("/register"));
    var response;

    var type = '';
    if (Platform.isAndroid) {
      type = '1';
    } else if (Platform.isIOS) {
      type = '2';
    }

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
        'register_device_type': type,
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

  Future<String> getEventsData() async {
    final response = await post('/view-all-events', {},
        headers: {'Authorization': 'Bearer ${getStorage.read('token')}'});
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<String> getEventDetailsData(eventId) async {
    final response = await post('/event-details', {
      'event_id': eventId,
    }, headers: {
      'Authorization': 'Bearer ${getStorage.read('token')}'
    });
    if (response.status.hasError) {
      return 'error';
    } else {
      return json.encode(response.body);
    }
  }

  Future<String> getAllCards() async {
    final response = await http.get(
        Uri.parse(
            (stripeUrl + getStorage.read('stripeCustomerId')) + '/sources'),
        headers: {
          'Authorization': stripeKey,
          'Content-Type': 'application/json'
        });
    if (response.statusCode != 200) {
      return 'error';
    } else {
      return (response.body).toString();
    }
  }

  Future<String> getAddCard(String cardNumber, String cvvNo, String cardName,
      String expMonth, String expYear) async {
    final response = await http.post(
        Uri.parse(stripeTokenUrl +
            '?' +
            'card[number]=' +
            cardNumber +
            '&card[cvc]=' +
            cvvNo +
            '&card[name]=' +
            cardName +
            '&card[exp_month]=' +
            expMonth +
            '&card[exp_year]=' +
            expYear),
        headers: {
          'Authorization': stripeKey,
          'Content-Type': 'application/json'
        });
    if (response.statusCode != 200) {
      return 'error';
    } else {
      return (response.body).toString();
    }
  }

  Future<String> fetchCard(String id) async {
    final response = await http
        .post(Uri.parse(stripeUrl + getStorage.read('stripeCustomerId') + '/sources?' + 'source=' + id), headers: {
      'Authorization': stripeKey,
      'Content-Type': 'application/json'
    });
    if (response.statusCode != 200) {
      return 'error';
    } else {
      return (response.body).toString();
    }
  }
}
