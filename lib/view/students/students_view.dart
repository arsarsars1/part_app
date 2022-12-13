import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view/constants/default_values.dart';

class StudentsView extends StatefulWidget {
  static const route = '/students';

  const StudentsView({Key? key}) : super(key: key);

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Students',
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
                title: 'Add New Student',
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          BranchField(
            onSelect: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Batch Status *',
            hint: 'Select Batch Status',
            dropDown: true,
            dropDownItems: DefaultValues().batchStatus,
            onChange: (value) {},
            validator: (value) {
              return value == null ? 'Please select batch status.' : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Batch *',
            hint: 'Select Batch',
            dropDown: true,
            dropDownItems: DefaultValues().batchStatus,
            onChange: (value) {},
            validator: (value) {
              return value == null ? 'Please select batch.' : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Search',
            hint: 'Search By Name or Phone Number',
            onChange: (value) {},
            onSubmit: (value) {
              // todo
            },
            textInputAction: TextInputAction.search,
            prefixIcon: const Icon(Icons.search),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabButton(
              onChange: (String value) {},
              options: const [
                'Active Students',
                'Inactive Students',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
