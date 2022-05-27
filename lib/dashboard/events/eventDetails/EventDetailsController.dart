import 'package:ciao_chow/api_providers/ApiProvider.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AddCardMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/AllCardsMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/BookingDoneView.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/EventDetailsMainModel.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/ModelMainSingleCard.dart';
import 'package:ciao_chow/dashboard/events/eventDetails/PurchaseMainModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailsController extends GetxController {
  var showBottomSheet = false.obs;
  var whichSheet = ''.obs;
  final _apiProvider = ApiProvider();
  var isChecked = false.obs;
  var imageSliders = <Widget>[].obs;
  List<String> arrayImages = <String>[].obs;
  var currentSliderValue = 0.0.obs;
  var eventDetails = Event().obs;
  var eventSale = EventSale().obs;
  var businessDetails = Business().obs;
  var allCardsList = <Datum>[].obs;
  var nameOnCardController = TextEditingController().obs;
  var cardNumberController = TextEditingController().obs;
  var expiryDateController = TextEditingController().obs;
  var cvvTxtController = TextEditingController().obs;
  var eventLoaderShow = false.obs;
  var showPaymentDone = false.obs;
  var showAddCardLoader = false.obs;
  var eventIdd = '';
  var sliderValue = 0.0;
  var modelCard = Datum().obs;
  var redemeedDate = DateTime(2022).obs;

  @override
  void onInit() {
    super.onInit();
    showAddCardLoader.value = false;
    getAllCards();
  }

  void getEventDetails(String eventId, String saleId) {
    eventLoaderShow.value = true;
    _apiProvider.getEventDetailsData(eventId, saleId).then((value) {
      eventIdd = eventId;
      var response = eventDetailsMainModelFromJson(value);
      if (response.status == true) {
        eventDetails.value = response.data!.event!;
        eventSale.value = response.data!.eventSale!;
        businessDetails.value = response.data!.event!.business!;
        arrayImages.clear();
        arrayImages.addAll(response.data!.event!.business!.images!);
        addBannerList(arrayImages);
        getSliderValue();

        if (eventSale.value.redeemDate!.isNotEmpty) {
          redemeedDate.value = DateFormat("yyyy-MM-dd hh:mm:ss")
              .parse(eventSale.value.redeemDate!);
        }
      } else {
        if (response.message! == "Your account has been deactivated. Please email us at info@ciaochow.com for further information.") {
          CommonUi.alertLogout(Get.context!,response.message!);
        } else {
          CommonUi.showToast(response.message!);
        }
      }

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
      if (value == 'error') {
        CommonUi.showToast('Please enter correct card details to continue.');
        showAddCardLoader.value = false;
        return;
      } else {
        var response = addCardMainModelFromJson(value);
        if (response.id!.isNotEmpty) {
          _apiProvider.fetchCard(response.id!).then((value) {
            var responseSingle = modelMainSingleCardFromJson(value);
            _apiProvider.getAllCards().then((value) {
              var responseAll = allCardsMainModelFromJson(value);
              whichSheet.value = '2';
              allCardsList.clear();
              allCardsList.addAll(responseAll.data!);
              for (int i = 0; i < allCardsList.length; i++) {
                if (allCardsList[i].isSelected == true) {
                  allCardsList[i].isSelected = false;
                }
                modelCard.value.id = responseSingle.id;
                modelCard.value.last4 = responseSingle.last4;
                modelCard.value.name = responseSingle.name;
                modelCard.value.expYear = responseSingle.expYear;
                modelCard.value.expMonth = responseSingle.expMonth;
                modelCard.value.isSelected = true;
              }
              showAddCardLoader.value = false;
            });
          });
        }
      }
    });
  }

  void addBannerList(List<dynamic> bannerList) {
    CommonUi.imageSlidersDetails(bannerList, imageSliders);
  }

  eventPurchaseApi() {
    _apiProvider
        .getEventPurchase(currentSliderValue.value.round().toString(), eventIdd,
            modelCard.value.id!)
        .then((value) {
      if (value == 'error') {
        CommonUi.showToast('Something went wrong!');
        return;
      } else {
        var response = purchaseMainModelFromJson(value);
        if (response.status == false) {
          CommonUi.showToast('Something went wrong!');
          return;
        } else {
          Get.to(BookingDoneView());
        }
      }
      showPaymentDone.value = false;
    });
  }

  void getSliderValue() {
    if (eventDetails.value.availableTickets! <
        int.parse(eventDetails.value.maxTicketsPerCustomer!)) {
      sliderValue = eventDetails.value.availableTickets!.toDouble();
    } else {
      sliderValue =
          int.parse(eventDetails.value.maxTicketsPerCustomer!).toDouble();
    }
  }
}
