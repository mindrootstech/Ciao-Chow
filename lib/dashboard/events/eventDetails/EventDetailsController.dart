import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AddCardMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AllCardsMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailsController extends GetxController {

  var showBottomSheet = false.obs;
  var whichSheet = ''.obs;
  final _apiProvider = ApiProvider();
  var isChecked = false.obs;
  var imageSliders =  <Widget>[].obs;
  List<String> arrayImages = <String>[].obs;
  var currentSliderValue = 0.0.obs;
  var eventDetails = Event().obs;
  var businessDetails = Business().obs;
  var allCardsList = <Datum>[].obs;
  var nameOnCardController = TextEditingController().obs;
  var cardNumberController = TextEditingController().obs;
  var expiryDateController = TextEditingController().obs;
  var cvvTxtController = TextEditingController().obs;
  var eventLoaderShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    eventLoaderShow.value = true;
    getAllCards();
  }

  void getEventDetails(String eventId) {
    _apiProvider.getEventDetailsData(eventId).then((value) {
      var response = eventDetailsMainModelFromJson(value);
      eventDetails.value = response.data!.event!;
      businessDetails.value = response.data!.event!.business!;
      arrayImages.clear();
      arrayImages.addAll(response.data!.event!.business!.images!);
      addBannerList(arrayImages);
      eventLoaderShow.value = false;
    });
  }

  void getAllCards() {
    _apiProvider.getAllCards().then((value) {
      var response = allCardsMainModelFromJson(value);
      allCardsList.clear();
      allCardsList.addAll(response.data!);
    });
  }

  void addCardToTheStripe() {
    var cardNumber = cardNumberController.value.text.replaceAll(' ', '');
    var cvvNo = cvvTxtController.value.text;
    var cardName = nameOnCardController.value.text;
    var expDate = expiryDateController.value.text;
    var expMonth = '';
    var expYear = '';

    if (expDate.isNotEmpty) {
      var date = expDate.split('/');
      expMonth = date[0];
      if (date.length == 2) {
        expYear = date[1];
      }
    }

    _apiProvider
        .getAddCard(cardNumber, cvvNo, cardName, expMonth, expYear)
        .then((value) {
      var response = addCardMainModelFromJson(value);
      if (response.id!.isNotEmpty) {
        _apiProvider.fetchCard(response.id!).then((value) {
          _apiProvider.getAllCards().then((value) {
            var responseAll = allCardsMainModelFromJson(value);
            whichSheet.value = '2';
            allCardsList.clear();
            allCardsList.addAll(responseAll.data!);
          });
        });
      }
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSlidersDetails(bannerList,imageSliders);
  }
}
