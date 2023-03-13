import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/session_alert.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/home/dashboard/dashboard.dart';
import 'package:part_app/view/leads/leads_view.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/cubits.dart';

class Home extends StatefulWidget {
  static const route = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getDashboard();
    });
  }

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
              label: 'Leads',
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  Assets.leads,
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
      return const Dashboard();
    } else if (currentIndex == 3) {
      return const Leads();
    }

    return const Center(
      child: Text('WIP'),
    );
  }
}
