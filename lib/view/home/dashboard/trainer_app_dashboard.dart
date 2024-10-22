import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/madeByLove.dart';
import 'package:part_app/view/home/components/trainer_app_dashboard_icons.dart';
import 'package:part_app/view/home/components/trainer_app_home_bar.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:showcaseview/showcaseview.dart';

class TrainerAppDashboard extends StatefulWidget {
  const TrainerAppDashboard({super.key});

  @override
  State<TrainerAppDashboard> createState() => _TrainerAppDashboardState();
}

class _TrainerAppDashboardState extends State<TrainerAppDashboard> {
  AuthCubit? authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getDashboardForTrainerApp(
            trainerId: authCubit
                    ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
          );
      context.read<HomeCubit>().getFAQForTrainer();
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
              child: TrainerAppHomeBar(),
            ),
            ShowCaseWidget(
              enableAutoScroll: true,
              onFinish: () {
                Hive.box(Database.userBox).put("Trainer Showcase", true);
              },
              builder: (context) {
                return Expanded(
                  child: ListView(
                    children: const [
                      SizedBox(height: 10),
                      HomeBanner(),
                      SizedBox(height: 10),
                      TrainerAppDashboardIcons(),
                      SizedBox(height: 8),
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
