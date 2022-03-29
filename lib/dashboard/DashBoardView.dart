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
          height: 88,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.AppColorGrad2,
                    AppColors.AppColorGrad2
                  ],
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
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
                        SvgPicture.asset(CommonUi.setSvgImage('settings')),
                        const SizedBox(height: 10,),
                        Container(height: 3,width: 30,decoration: CommonUi.commonBoxDecorationAllSides(5.0,AppColors.transparent),)
                      ],
                    ),label: '',
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/settings_minder.svg',
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
