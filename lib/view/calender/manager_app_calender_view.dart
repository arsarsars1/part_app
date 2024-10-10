import 'package:flutter/material.dart';
import 'package:part_app/view/calender/widgets/manager_app_calender.dart';
import 'package:part_app/view/components/common_bar.dart';

class ManagerAppCalenderView extends StatefulWidget {
  const ManagerAppCalenderView({super.key});

  @override
  State<ManagerAppCalenderView> createState() => _TrainerAppCalenderViewState();
}

class _TrainerAppCalenderViewState extends State<ManagerAppCalenderView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonBar(
        title: 'Calender',
      ),
      body: ManagerAppCalender(),
    );
  }
}
