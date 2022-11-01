import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/profile_pictrue.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/constants/regex.dart';
import 'package:part_app/view/trainer/components/docs_upload.dart';

class AddEditTrainer extends StatefulWidget {
  static const route = '/trainer/add-edit';

  const AddEditTrainer({Key? key}) : super(key: key);

  @override
  State<AddEditTrainer> createState() => _AddEditTrainerState();
}

class _AddEditTrainerState extends State<AddEditTrainer> {
  TextEditingController dobController = TextEditingController();

  String? name;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  String? areaOfExpertise;

  bool selected = false;

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Add Trainer Detail'),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: ProfilePicture(
                  onEdit: () {},
                  onChange: (File value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Trainer Name *',
                hint: 'Enter Trainer Name',
                onChange: (value) {},
                validator: (value) {
                  return value == null || value.toString().isEmpty
                      ? 'Please enter trainer name.'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Gender *',
                hint: 'Select Gender',
                dropDown: true,
                dropDownItems: DefaultValues().genders,
                onChange: (value) {
                  gender = value;
                },
                validator: (value) {
                  return value == null ? 'Please select gender.' : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                controller: dobController,
                onTap: datePicker,
                disabled: true,
                hint: 'dd/mm/yyyy',
                title: 'Date of Birth *',
                validator: (value) {
                  return value == null || value.toString().isEmpty
                      ? 'Please enter dob.'
                      : null;
                },
                onChange: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                length: 10,
                phoneField: true,
                inputType: TextInputType.phone,
                title: 'Mobile *',
                hint: 'Eg: 9876543210',
                onChange: (value) {
                  phone = value;
                },
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return 'Please enter number.';
                  } else if (value.toString().length < 10) {
                    return 'Invalid phone number.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              WhatsappCheckButton(
                onChange: (bool value) {
                  setState(() {
                    selected = value;
                  });
                },
                onNumberChange: (String value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                inputType: TextInputType.emailAddress,
                length: 50,
                title: 'Enter Email *',
                hint: 'Eg: contact@polestar.com',
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(emailRegex).hasMatch(value!)) {
                    return 'Invalid email address.';
                  } else {
                    return null;
                  }
                },
                onChange: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                inputType: TextInputType.emailAddress,
                length: 50,
                title: 'Area Of Expertise *',
                hint: 'Eg: Hip Hop Dance',
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return 'Please enter expertise';
                  } else {
                    return null;
                  }
                },
                onChange: (value) {
                  areaOfExpertise = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                length: 300,
                maxLines: 3,
                title: 'Address *',
                hint: 'Enter Communication Address',
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return 'Please enter address';
                  } else {
                    return null;
                  }
                },
                onChange: (value) {
                  areaOfExpertise = value;
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              DocsUpload(
                documents: (List<File> value) {},
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 62),
                  child: Button(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    title: 'Continue',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // method to get the date for [ dob ]
  void datePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(
        DateTime.now().year - 18,
      ),
      firstDate: DateTime(
        DateTime.now().year - 100,
      ),
      lastDate: DateTime(
        DateTime.now().year - 18,
      ),
    ).then((value) {
      if (value != null) {
        dob = value.toServerString();
        dobController.text = value.toDateString();
      }
    });
  }
}
