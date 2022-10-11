import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/home/components/dashboard_icons.dart';
import 'package:part_app/view/home/components/dashboard_summary.dart';
import 'package:part_app/view/home/components/finance_dashboard.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/home_bar.dart';
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
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UserNotAvailable) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SplashScreen.route,
              (route) => false,
            );
          }
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HomeBar(),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    HomeBanner(),
                    SizedBox(
                      height: 10,
                    ),
                    DashboardIcons(),
                    SummaryDashboard(),
                    FinanceDashboard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
    );
  }
}
