import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/EventTicketsListItem.dart';
import 'package:ciao_chow/dashboard/events/EventsController.dart';
import 'package:ciao_chow/dashboard/events/ModelEventTickets.dart';
import 'package:ciao_chow/dashboard/events/ModelUpcomingEvents.dart';
import 'package:ciao_chow/dashboard/events/UpcomingEventsListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsView extends StatelessWidget {
  var eventsController = Get.put(EventsController());

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    eventsController.arrayEventTicket = <ModelEventTickets>[];
    eventsController.arrayUpcomingEvents = <ModelUpcomingEvents>[];

    var model = ModelEventTickets();
    model.eventTitle = "Social";
    model.eventDateTime = "28 OCT 2021 10:00 AM";
    model.numberOfTickets = "5 Tickets";
    model.ticketPrice = "500.00";
    model.eventImage =
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80';
    eventsController.arrayEventTicket.add(model);

    model = ModelEventTickets();
    model.eventTitle = "Social";
    model.eventDateTime = "28 OCT 2021 10:00 AM";
    model.numberOfTickets = "5 Tickets";
    model.ticketPrice = "500.00";
    model.eventImage =
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80";
    eventsController.arrayEventTicket.add(model);

    model = ModelEventTickets();
    model.eventTitle = "Social";
    model.eventDateTime = "28 OCT 2021 10:00 AM";
    model.numberOfTickets = "5 Tickets";
    model.ticketPrice = "500.00";
    model.eventImage =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    eventsController.arrayEventTicket.add(model);

    model = ModelEventTickets();
    model.eventTitle = "Social";
    model.eventDateTime = "28 OCT 2021 10:00 AM";
    model.numberOfTickets = "5 Tickets";
    model.ticketPrice = "500.00";
    model.eventImage =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    eventsController.arrayEventTicket.add(model);

    model = ModelEventTickets();
    model.eventTitle = "Social";
    model.eventDateTime = "28 OCT 2021 10:00 AM";
    model.numberOfTickets = "5 Tickets";
    model.ticketPrice = "500.00";
    model.eventImage =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    eventsController.arrayEventTicket.add(model);

    var modelUpcoming = ModelUpcomingEvents();
    modelUpcoming.placeName = "Social";
    modelUpcoming.placeAddress = "Sector-7,chandigarh";
    modelUpcoming.image =
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80';
    eventsController.arrayUpcomingEvents.add(modelUpcoming);

    modelUpcoming = ModelUpcomingEvents();
    modelUpcoming.placeName = "JW marriott";
    modelUpcoming.placeAddress = "Sector-35,chandigarh";
    modelUpcoming.image =
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80";
    eventsController.arrayUpcomingEvents.add(modelUpcoming);

    modelUpcoming = ModelUpcomingEvents();
    modelUpcoming.placeName = "Brew Bros";
    modelUpcoming.placeAddress = "Sector-7,chandigarh";
    modelUpcoming.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    eventsController.arrayUpcomingEvents.add(modelUpcoming);

    modelUpcoming = ModelUpcomingEvents();
    modelUpcoming.placeName = "Culture";
    modelUpcoming.placeAddress = "Sector-26,chandigarh";
    modelUpcoming.image =
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80";
    eventsController.arrayUpcomingEvents.add(modelUpcoming);

    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 500.0,
                imageUrl: item,
                placeholder: (context, url) => Transform.scale(
                    scale: 0.2,
                    child: const CircularProgressIndicator(
                      strokeWidth: 10.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ))
        .toList();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppColorGrad2,
        centerTitle: true,
        title: Text(
          'Events',
          style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
              FontWeight.w600, AppColors.White, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.AppColorGrad2,
              height: 16,
            ),
            SizedBox(
              height: 170,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColors.AppColorGrad2,
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: AppColors.AppColorGrad2,
                          child: Container(
                            width: Get.width,
                            decoration: CommonUi.commonBoxDecoration(
                                24.0, AppColors.White),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 165,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: Get.width,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              // autoPlay: false,
                              // aspectRatio: 2.0,
                              // enlargeCenterPage: false,
                            ),
                            items: imageSliders,
                          ))),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    // Utils.getString(context, 'partners_around_you'),
                    'My Event Tickets',
                    style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                        FontWeight.w600, AppColors.Black, TextDecoration.none),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Text(
                    Utils.getString(context, 'view_all'),
                    style: CommonUi.customTextStyle1(
                        Fonts.interRegular,
                        12.0,
                        FontWeight.w400,
                        AppColors.textFieldsHint,
                        TextDecoration.none),
                  ),
                ),
              ],
            ),
            Container(
              height: 192,
              margin: const EdgeInsets.only(left: 20, top: 14),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventsController.arrayEventTicket.length,
                itemBuilder: (BuildContext context, int index) {
                  return EventTicketsListItem(index, eventsController);
                },
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                // Utils.getString(context, 'partners_around_you'),
                'My Event Tickets',
                style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                    FontWeight.w600, AppColors.Black, TextDecoration.none),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 200
                  ),
                  itemCount: eventsController.arrayUpcomingEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UpcomingEventsListItem(index, eventsController);
                  }),
            ),

            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
