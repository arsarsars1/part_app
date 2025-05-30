import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view_model/cubits.dart';

class EditStudent extends StatefulWidget {
  static const route = '/students/edit';

  const EditStudent({super.key});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  var list = ['student', 'parent'];
  String? selected;

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
  late DateTime selectedDate;

  TextEditingController dobController = TextEditingController();

  // form key
  var formKey = GlobalKey<FormState>();
  Student? student;
  StudentDetail? details;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dobController.text = details?.dob?.toDateString() ?? '';
      selectedDate = details?.dob ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    student = context.read<StudentCubit>().student;
    details = student?.studentDetail![0];
    whatsappSelected = student?.mobileNo == details?.whatsappNo;

    selected ??= details?.parentName != null && details!.parentName!.isNotEmpty
        ? 'parent'
        : 'student';
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Student Profile'),
      body: BlocListener<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is UpdatingStudent) {
            Loader(context, message: 'Updating student..').show();
          } else if (state is UpdatedStudent) {
            Alert(context).show(message: 'Updated student details');
            Navigator.popUntil(
              context,
              ModalRoute.withName(StudentDetails.route),
            );
          } else if (state is UpdateStudentFailed) {
            Alert(context).show(message: state.message);
            Navigator.pop(context);
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
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
                      initialValue: details?.parentName,
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
                initialValue: details?.name,
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
                initialValue: student?.mobileNo,
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
                initialValue: details?.whatsappNo,
                selected: whatsappSelected,
                onChange: (bool value) {
                  whatsappSelected = value;
                  if (value) {
                    whatsappNo = phone ?? student?.mobileNo;
                  } else {
                    whatsappNo = null;
                  }
                  setState(() {});
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
                defaultItem: details?.gender != null
                    ? DefaultValues().genders.firstWhere((element) =>
                        element.title?.toLowerCase() ==
                        details?.gender?.toLowerCase())
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
                initialValue: details?.email,
                inputType: TextInputType.emailAddress,
                length: 50,
                title: 'Email ID ',
                hint: 'Eg: contact@polestar.com',
                capitalization: TextCapitalization.none,
                // validator: (value) {
                // if (value == null || value.toString().isEmpty) {
                //   return 'Please enter email';
                // } else if (!RegExp(emailRegex).hasMatch(value!)) {
                //   return 'Invalid email address.';
                // } else {
                //   return null;
                // }
                // },
                onChange: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue: details?.address,
                length: 300,
                maxLines: 3,
                verticalPadding: 10,
                title: 'Address',
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

                        if (selected == 'student') {
                          parentName = '';
                        }

                        StudentRequest request = StudentRequest(
                          name: name,
                          mobileNo: phone,
                          whatsappNo: whatsappNo,
                          dob: dob,
                          gender: gender,
                          email: email,
                          countryCode: phone?.getCountryCode(),
                          address: address,
                          isParent: selected == 'parent' ? 1 : 0,
                          parentName: parentName,
                        );

                        cubit.updateStudent(request);
                      }
                    },
                    title: 'Submit',
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
      // initialDate: DateTime.now(),
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        dob = value.toServerString();
        dobController.text = value.toDateString();
        selectedDate = value;
      }
    });
  }
}
