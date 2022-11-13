import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/batch/components/training_days.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';

class AddBatch extends StatefulWidget {
  static const route = '/batch/add';

  const AddBatch({Key? key}) : super(key: key);

  @override
  State<AddBatch> createState() => _AddBatchState();
}

class _AddBatchState extends State<AddBatch> {
  TextEditingController dobController = TextEditingController();

  String? batchName;
  int? branchId;
  int? courseId;
  int? fee;
  int? admissionFee;
  String? subject;
  String? batchStatus;

  bool selected = false;

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();

  // Files
  File? image;
  File? doc1;
  File? doc2;

  @override
  void initState() {
    super.initState();
    // get the trainers list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Add New Batch'),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                BranchField(onSelect: (value) {}),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Batch Name *',
                  hint: 'Enter Batch Name',
                  onChange: (value) {
                    batchName = value;
                  },
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please enter batch name.'
                        : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Course *',
                  hint: 'Select Course',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                  onChange: (value) {
                    courseId = value?.id;
                  },
                  validator: (value) {
                    return value == null ? 'Please select course.' : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Subject *',
                  hint: 'Select Subject',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                  onChange: (value) {
                    subject = value?.id;
                  },
                  validator: (value) {
                    return value == null ? 'Please select subject.' : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  inputType: const TextInputType.numberWithOptions(),
                  title: 'Admission Fees *',
                  hint: 'Enter Admission Fees',
                  onChange: (value) {
                    admissionFee = value;
                  },
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter admission fees.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  inputType: const TextInputType.numberWithOptions(),
                  length: 50,
                  title: 'Fees *',
                  hint: 'Enter Fees',
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter fees';
                    }
                    return null;
                  },
                  onChange: (value) {
                    fee = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const TrainingDays(),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Batch Status *',
                  hint: 'Select Batch Status',
                  dropDown: true,
                  dropDownItems: DefaultValues().batchStatus,
                  onChange: (value) {
                    batchStatus = value?.title;
                  },
                  validator: (value) {
                    return value == null ? 'Please select batch status.' : null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: 'Save Batch',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
