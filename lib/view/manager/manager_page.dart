import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/manager/add_manager.dart';

class ManagerPage extends StatelessWidget {
  static const route = '/manager';

  const ManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Manager'),
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
                width: 203.w,
                onTap: () => Navigator.pushNamed(context, AddManager.route),
                title: 'Add New Branch Manager',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
