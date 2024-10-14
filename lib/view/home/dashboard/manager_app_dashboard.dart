import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/view/home/components/dashboard_summary.dart';
import 'package:part_app/view/home/components/finance_dashboard.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/madeByLove.dart';
import 'package:part_app/view/home/components/manager_app_dashboard_icons.dart';
import 'package:part_app/view/home/components/manager_app_home_bar.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:showcaseview/showcaseview.dart';

class ManagerAppDashboard extends StatefulWidget {
  const ManagerAppDashboard({super.key});

  @override
  State<ManagerAppDashboard> createState() => _ManagerAppDashboardState();
}

class _ManagerAppDashboardState extends State<ManagerAppDashboard> {
  AuthCubit? authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getDashboardForManagerApp(
            managerId: authCubit
                    ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
          );
      context.read<HomeCubit>().getFAQForManager();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ManagerAppHomeBar(),
            ),
            ShowCaseWidget(
              enableAutoScroll: true,
              onFinish: () {
                Hive.box(Database.userBox).put("Showcase", true);
              },
              builder: (context) {
                return Expanded(
                  child: ListView(
                    children: const [
                      SizedBox(height: 10),
                      HomeBanner(),
                      SizedBox(height: 10),
                      ManagerAppDashboardIcons(),
                      SummaryDashboard(),
                      FinanceDashboard(),
                      SizedBox(height: 27),
                      MadeByLove(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
