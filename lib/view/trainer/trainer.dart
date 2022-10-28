import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';

class TrainerPage extends StatelessWidget {
  static const route = '/trainer';

  const TrainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Trainers List',
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
              ),
              child: Button(
                height: 30.h,
                onTap: () {},
                title: 'Add New Trainer',
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CommonField(
            title: 'Branch',
            hint: 'Select Branch',
            dropDown: true,
            onChange: (value) {},
          ),
          SizedBox(
            height: 20.h,
          ),
          CommonField(
            title: 'Search',
            hint: 'Search By Trainer Or Phone Number',
            dropDown: true,
            onChange: (value) {},
          ),
          SizedBox(
            height: 20.h,
          ),
          TabButton(
            onChange: (String value) {},
            options: const [
              'Active Trainers',
              'Inactive Trainers',
            ],
          ),
        ],
      ),
    );
  }
}
