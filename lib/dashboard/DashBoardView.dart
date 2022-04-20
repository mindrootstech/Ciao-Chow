import 'dart:io';

import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/DashBoardController.dart';
import 'package:ciao_chow/dashboard/events/eventMain/EventsView.dart';
import 'package:ciao_chow/dashboard/home/homeMain/HomeView.dart';
import 'package:ciao_chow/dashboard/settings/SettingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashBoardView extends StatelessWidget {

  DashBoardView({Key? key}) : super(key: key);
  var dashboardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height: Platform.isIOS?105:80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.AppColorGrad2,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: dashboardController.selectedValue.value,
              onTap: (value) {
                dashboardController.selectedValue.value = value;
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('home')),
                      const SizedBox(height: 10,),
                      Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.transparent),)
                    ],
                  ),label: '',
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        CommonUi.setSvgImage('home_active'),
                        color: AppColors.White,
                      ),
                      const SizedBox(height: 10,),
                      Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.White),)
                    ],
                  ),
                ),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(CommonUi.setSvgImage('events')),
                        const SizedBox(height: 10,),
                        Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.transparent),)
                      ],
                    ),label: '',
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          CommonUi.setSvgImage('events_active'),
                          color: AppColors.White,
                        ),
                        const SizedBox(height: 10,),
                        Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.White),)
                      ],
                    )),

                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(CommonUi.setSvgImage('notification')),
                        const SizedBox(height: 10,),
                        Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.transparent),)
                      ],
                    ),label: '',
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          CommonUi.setSvgImage('notification_active'),
                          color: AppColors.White,
                        ),
                        const SizedBox(height: 10,),
                        Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.White),)
                      ],
                    )),

                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('profile')),
                      const SizedBox(height: 10,),
                      Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.transparent),)
                    ],
                  ),label: '',
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('profile_active'),
                        color: AppColors.White,
                      ),

                      const SizedBox(height: 10,),
                      Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.White),)
                    ],
                  ),
                ),
              ],
              selectedItemColor: Colors.amber[800],
            ),
          ),
        ),
        body: dashboardController.selectedValue.value == 0
            ? HomeView()
            : dashboardController.selectedValue.value == 1
                ? EventsView()
                : const SettingsView(),
      ),
    );
  }
}
