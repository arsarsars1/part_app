import 'package:flutter/material.dart';
import 'package:part_app/view/calender/widgets/trainer_app_calender.dart';
import 'package:part_app/view/components/common_bar.dart';

class TrainerAppCalenderView extends StatefulWidget {
  const TrainerAppCalenderView({Key? key}) : super(key: key);

  @override
  State<TrainerAppCalenderView> createState() => _TrainerAppCalenderViewState();
}

class _TrainerAppCalenderViewState extends State<TrainerAppCalenderView> {
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
      body: TrainerAppCalender(),
    );
  }
}
