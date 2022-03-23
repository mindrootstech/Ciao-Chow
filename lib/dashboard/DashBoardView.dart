import 'package:ciao_chow/constants/AppColors.dart';
import 'package:ciao_chow/constants/CommonUi.dart';
import 'package:ciao_chow/dashboard/DashBoardController.dart';
import 'package:ciao_chow/dashboard/events/EventsView.dart';
import 'package:ciao_chow/dashboard/home/HomeView.dart';
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
                gradient: RadialGradient(
                  center: Alignment(-0.8, -0.6),
                  colors: [
                    AppColors.AppColorGrad1,
                    AppColors.AppColorGrad2
                  ],
                  radius: 1.0,
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
                    icon: SvgPicture.asset(CommonUi.setSvgImage('home')),label: '',
                    activeIcon: SvgPicture.asset(
                      CommonUi.setSvgImage('home'),
                      color: AppColors.White,
                    ),
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(CommonUi.setSvgImage('events')),label: '',
                      activeIcon: SvgPicture.asset(
                        CommonUi.setSvgImage('events'),
                        color: AppColors.White,
                      )),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(CommonUi.setSvgImage('settings')),label: '',
                    activeIcon: SvgPicture.asset(
                      'assets/svg/settings_minder.svg',
                      color: AppColors.White,
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
                : SettingsView(),
      ),
    );
  }
}
