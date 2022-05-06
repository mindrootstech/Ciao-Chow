import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventTicketsListItem.dart';
import 'package:ciao_chow/dashboard/events/eventMain/viewAll/AllMyEventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMyEventsView extends StatelessWidget {

  var allEventsController = Get.put(AllMyEventsController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.White,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.AppColorGrad2,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                );
              },
            ),
            centerTitle: true,
            title: Text(
              Utils.getString(context, 'my_event_tickets'),
              style: CommonUi.customTextStyle1(Fonts.interSemiBold, 18.0,
                  FontWeight.w600, AppColors.White, TextDecoration.none),
            ),
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      Container(
                        height: 48,
                        color: AppColors.AppColorGrad2,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 25,
                          width: Get.width,
                          decoration: CommonUi.commonBoxDecoration(
                              24.0, AppColors.White),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)),
                    child: Container(
                      color: AppColors.home_progress,
                      height: 40,
                      child: DefaultTabController(
                        length: 2,
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: AppColors.redEdit,
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: 'Upcoming events',
                            ),
                            Tab(
                              text: 'Redeemed events',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 0, bottom: 120),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 12,
                                  mainAxisExtent: 196),
                          itemCount:
                          allEventsController.allMyEventsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EventTicketsListItem(
                                index, allEventsController.allMyEventsList[index]);
                          })),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() => allEventsController.loaderEvents.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.AppColorGrad2,
                ))
              : Container()),
        ),
      ],
    );
  }
}
