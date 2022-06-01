import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/constants/Fonts.dart';
import 'package:ciao_chow/constants/Utils.dart';
import 'package:ciao_chow/dashboard/events/eventMain/viewAll/AllEventsItem.dart';
import 'package:ciao_chow/dashboard/events/eventMain/viewAll/AllMyEventsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllMyEventsView extends StatelessWidget {
  var allEventsController = Get.put(AllMyEventsController());

  AllMyEventsView({Key? key}) : super(key: key);

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
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: AppColors.home_progress,
                      height: 40,
                      child: DefaultTabController(
                        length: 2,
                        child: TabBar(
                          onTap: (value) {
                            if (value.toString() == '0') {
                              allEventsController.type.value = '1';
                              allEventsController.getAllEventsData();
                              allEventsController.loaderEvents.value = true;
                            } else {
                              allEventsController.type.value = '2';
                              allEventsController.getAllEventsData();
                              allEventsController.loaderEvents.value = true;
                            }
                          },
                          indicator: BoxDecoration(
                              color: AppColors.redEdit,
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: Utils.getString(context, 'upcoming_events'),
                            ),
                            Tab(
                              text: Utils.getString(context, 'redeemed_events'),
                              // child: Container(height: double.maxFinite,width: double.maxFinite,child: Text(Utils.getString(context, 'redeemed_events')),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => allEventsController.allMyEventsList.length > 0
                      ? Container(
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: GridView.builder(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 120),
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
                                return AllEventsItem(index);
                              }))
                      : Container(
                          height: 500,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child:
                          allEventsController.loaderEvents.value == false ?

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  CommonUi.setSvgImage('no_events')),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'No Events Found',
                                style: CommonUi.customTextStyle1(
                                    Fonts.interSemiBold,
                                    18.0,
                                    FontWeight.w600,
                                    AppColors.Black,
                                    TextDecoration.none),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(Utils.getString(context, 'txt_description_events'),
                                style: CommonUi.customTextStyle1(
                                    Fonts.interRegular,
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.textFieldsHint,
                                    TextDecoration.none),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ) : const SizedBox(),
                        ),
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
              ? Container(
            height: Get.height,
                width: Get.width,
                child: const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.AppColorGrad2,
                  )),
              )
              : Container()),
        ),
      ],
    );
  }
}
