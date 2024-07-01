import 'package:flutter/material.dart';
import 'package:part_app/view/calender/widgets/student_app_calender.dart';
import 'package:part_app/view/components/common_bar.dart';

class StudentAppCalenderView extends StatefulWidget {
  const StudentAppCalenderView({super.key});

  @override
  State<StudentAppCalenderView> createState() => _StudentAppCalenderViewState();
}

class _StudentAppCalenderViewState extends State<StudentAppCalenderView> {
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
      body: StudentAppCalender(),
    );
  }
}
