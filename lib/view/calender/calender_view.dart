import 'package:flutter/material.dart';
import 'package:part_app/view/calender/widgets/calender.dart';
import 'package:part_app/view/components/common_bar.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  
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
      body: Calender(),
    );
  }
}
