import 'package:flutter/material.dart';
import 'package:part_app/view/home/components/dashboard_icons.dart';
import 'package:part_app/view/home/components/dashboard_summary.dart';
import 'package:part_app/view/home/components/finance_dashboard.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/home_bar.dart';
import 'package:part_app/view_model/cubits.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getDashboard();
      // context.read<HomeCubit>().getNotificationList(clean: true);
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
    );
  }
}
