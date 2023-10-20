import 'package:flutter/material.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/student_app_dashboard_icons.dart';
import 'package:part_app/view/home/components/student_app_home_bar.dart';
import 'package:part_app/view/home/components/whats_happening_today.dart';
import 'package:part_app/view_model/cubits.dart';


class StudentAppDashboard extends StatefulWidget {
  const StudentAppDashboard({Key? key}) : super(key: key);

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
      context.read<HomeCubit>().getFAQ();
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
                  StudentAppDashboardIcons(),
                  SizedBox(
                    height: 10,
                  ),
                  WhatsHappeningToday()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
