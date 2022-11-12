import 'dart:io';

import 'package:flutter/material.dart';
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

  String? name;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  String? whatsappNo;
  String? areaOfExpertise;
  String? address;

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
    scrollController.addListener(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
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
              children: [
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Branch *',
                  hint: 'Select Branch',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                  onChange: (value) {
                    gender = value?.title;
                  },
                  validator: (value) {
                    return value == null ? 'Please select branch.' : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Batch Name *',
                  hint: 'Enter Batch Name',
                  onChange: (value) {
                    name = value;
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
                    gender = value?.title;
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
                    gender = value?.title;
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
                    phone = value;
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
                    email = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
