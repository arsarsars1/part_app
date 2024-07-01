import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/student_app_dashboard_icons.dart';
import 'package:part_app/view/home/components/student_app_home_bar.dart';
import 'package:part_app/view/home/components/whats_happening_today.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:showcaseview/showcaseview.dart';

class StudentAppDashboard extends StatefulWidget {
  const StudentAppDashboard({super.key});

  @override
  State<StudentAppDashboard> createState() => _StudentAppDashboardState();
}

class _StudentAppDashboardState extends State<StudentAppDashboard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getStudentAppDashboard(
          studentId: context
              .read<AuthCubit>()
              .user
              ?.studentDetail?[context.read<AuthCubit>().studentIndex]
              .id);
      context.read<HomeCubit>().getFAQForStudent();
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
              child: StudentAppHomeBar(),
            ),
            ShowCaseWidget(
              enableAutoScroll: true,
              onFinish: () {
                Hive.box(Database.userBox).put("Student App Showcase", true);
              },
              builder: (context) {
                return Expanded(
                  child: ListView(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      HomeBanner(),
                      SizedBox(
                        height: 10,
                      ),
                      StudentAppDashboardIcons(),
                      SizedBox(
                        height: 10,
                      ),
                      WhatsHappeningToday()
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
