import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/students/trainer_app_assign_batch.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppAddStudent extends StatefulWidget {
  static const route = '/trainer-app-students/add';

  const TrainerAppAddStudent({super.key});

  @override
  State<TrainerAppAddStudent> createState() => _TrainerAppAddStudentState();
}

class _TrainerAppAddStudentState extends State<TrainerAppAddStudent> {
  var list = ['student', 'parent'];
  var selected = 'student';

  String? name;
  String? parentName;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  String? whatsappNo;
  String? areaOfExpertise;
  String? address;

  bool whatsappSelected = false;
  bool isValueChanged = false;

  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FlutterContactPicker contactPicker = FlutterContactPicker();
    return Scaffold(
      appBar: CommonBar(title: 'Add New Student', result: isValueChanged),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProfilePicture(
                    onEdit: () {},
                    onChange: (value) {
                      context.read<StudentCubit>().setProfilePic(value);
                    },
                    onAvatar: (File value) {},
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 'student';
                      });
                    },
                    child: Row(
                      children: [
                        Radio<String>(
                          activeColor: AppColors.green,
                          value: 'student',
                          groupValue: selected,
                          onChanged: (value) {
                            setState(() {
                              selected = value!;
                            });
                          },
                        ),
                        const Text('Student'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 'parent';
                      });
                    },
                    child: Row(
                      children: [
                        Radio<String>(
                          activeColor: AppColors.green,
                          value: 'parent',
                          groupValue: selected,
                          onChanged: (value) {
                            setState(() {
                              selected = value!;
                            });
                          },
                        ),
                        const Text('Parent'),
                      ],
                    ),
                  ),
                ],
              ),
              if (selected == 'parent')
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      initialValue: parentName,
                      title: 'Parent Name *',
                      hint: 'Enter Parent Name',
                      maxLines: 1,
                      length: 50,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        parentName = value;
                      },
                      validator: (value) {
                        return value == null || value.toString().isEmpty
                            ? 'Please enter parent name.'
                            : null;
                      },
                    ),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue: name,
                title: 'Student Name *',
                hint: 'Enter Student Name',
                maxLines: 1,
                length: 50,
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  name = value;
                },
                validator: (value) {
                  return value == null || value.toString().isEmpty
                      ? 'Please enter student name.'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                length: 10,
                phoneField: true,
                inputType: TextInputType.phone,
                title: 'Mobile No *',
                hint: 'Eg: 9876543210',
                controller: phoneController,
                suffixIcon: InkWell(
                  onTap: () async {
                    Contact? contact = await contactPicker.selectContact();
                    setState(() {
                      phone =
                          contact?.phoneNumbers?.first.replaceAll('+91', '');
                      phone = phone?.cleanPhoneNumber();
                      phoneController.text = phone ?? "";
                    });
                  },
                  child: Icon(
                    Icons.contact_page,
                    color: AppColors.grey81,
                  ),
                ),
                onChange: (value) {
                  phone = value;
                  if (value.length >= 10) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                validator: (value) =>
                    PhoneNumberValidator.validateIndianPhoneNumber(
                        value as String?),
              ),
              const SizedBox(
                height: 20,
              ),
              WhatsappCheckButton(
                initialValue: whatsappNo,
                selected: true,
                onChange: (bool value) {
                  whatsappNo = null;
                },
                onNumberChange: (String value) {
                  whatsappNo = value;
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
                title: 'Date of Birth',
                // validator: (value) {
                //   return value == null || value.toString().isEmpty
                //       ? 'Please enter dob.'
                //       : null;
                // },
                onChange: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                defaultItem: gender != null
                    ? DefaultValues().genders.firstWhere((element) =>
                        element.title?.toLowerCase() == gender?.toLowerCase())
                    : null,
                title: 'Gender *',
                hint: 'Select Gender',
                dropDown: true,
                dropDownItems: DefaultValues().genders,
                onChange: (value) {
                  gender = value?.title;
                },
                validator: (value) {
                  return value == null ? 'Please select gender.' : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue: email,
                inputType: TextInputType.emailAddress,
                length: 50,
                title: 'Email ID ',
                hint: 'Eg: contact@polestar.com',
                capitalization: TextCapitalization.none,
                // validator: (value) {
                //   if (value == null || value.toString().isEmpty) {
                //     return 'Please enter email';
                //   } else if (!RegExp(emailRegex).hasMatch(value!)) {
                //     return 'Invalid email address.';
                //   } else {
                //     return null;
                //   }
                // },
                onChange: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                verticalPadding: 10,
                initialValue: address,
                length: 300,
                maxLines: 3,
                title: 'Address ',
                textInputAction: TextInputAction.newline,
                hint: 'Enter Communication Address',
                // validator: (value) {
                //   if (value == null || value.toString().isEmpty) {
                //     return 'Please enter address';
                //   } else {
                //     return null;
                //   }
                // },
                onChange: (value) {
                  address = value;
                },
              ),
              SizedBox(
                height: UIConstants.buttonHeight,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 62),
                  child: Button(
                    onTap: () {
                      formKey.currentState?.save();

                      if (formKey.currentState!.validate()) {
                        var cubit = context.read<StudentCubit>();

                        StudentRequest request = cubit.studentRequest.copyWith(
                          name: name,
                          mobileNo: phone,
                          whatsappNo: whatsappNo ?? phone,
                          dob: dob,
                          gender: gender,
                          email: email,
                          address: address,
                          isParent: selected == 'parent' ? 1 : 0,
                          parentName: parentName,
                        );
                        setState(() => isValueChanged = true);

                        cubit.setStudent(request);
                        cubit.clearBatches();
                        Navigator.pushNamed(
                          context,
                          TrainerAppAssignBatch.route,
                          arguments: false,
                        );
                      }
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
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        dob = value.toServerString();
        dobController.text = value.toDateString();
      }
    });
  }
}
