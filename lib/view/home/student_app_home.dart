// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/calender/student_app_calender_view.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/session_alert.dart';
import 'package:part_app/view/home/dashboard/student_app_dashboard.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view/support/student_app_support_screen.dart';
import 'package:part_app/view/website/website_view.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppHome extends StatefulWidget {
  static const route = '/student-app-home';

  const StudentAppHome({super.key});

  @override
  State<StudentAppHome> createState() => _StudentAppHomeState();
}

class _StudentAppHomeState extends State<StudentAppHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color selectedColor = AppColors.primaryColor;
    Color unselectedColor = const Color(0xFF8A8A8A);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is NetworkError) {
          AlertBox.showErrorAlert(context);
        } else if (state is UserNotAvailable) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SplashScreen.route,
            (route) => false,
          );
        }
        if (state is UnAuthenticated) {
          SessionAlert().show(context);
        }
      },
      child: Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.liteDark,
          currentIndex: currentIndex,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.liteDark,
              label: 'Dashboard',
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  Assets.dashboard,
                  color: currentIndex == 0 ? selectedColor : unselectedColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.liteDark,
              label: 'Calender',
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  Assets.calendar,
                  color: currentIndex == 1 ? selectedColor : unselectedColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.liteDark,
              label: 'Support',
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  Assets.support,
                  color: currentIndex == 2 ? selectedColor : unselectedColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.liteDark,
              label: 'Shop',
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: currentIndex == 3 ? selectedColor : unselectedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    if (currentIndex == 0) {
      return const StudentAppDashboard();
    } else if (currentIndex == 1) {
      return const StudentAppCalenderView();
    } else if (currentIndex == 2) {
      return const StudentAppSupportScreen();
    } else if (currentIndex == 3) {
      return const WebsiteView();
    }
    return const Center(
      child: Text('WIP'),
    );
  }
}
