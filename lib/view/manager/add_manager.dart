import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/trainer/components/docs_upload.dart';
import 'package:part_app/view/trainer/salary_details.dart';
import 'package:part_app/view_model/cubits.dart';

class AddManager extends StatefulWidget {
  static const route = '/manager/update';

  const AddManager({Key? key}) : super(key: key);

  @override
  State<AddManager> createState() => _AddManagerState();
}

class _AddManagerState extends State<AddManager> {
  String? name;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  String? whatsappNo;
  String? areaOfExpertise;
  String? address;
  int? branchId;
  String? avatar;

  bool selected = false;

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();
  TextEditingController dobController = TextEditingController();

  // Files
  File? image;
  File? doc1;
  File? doc2;

  @override
  void initState() {
    super.initState();
    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
      context.read<ManagerCubit>().cleanup();
    });
  }

  @override
  Widget build(BuildContext context) {
    var branchCubit = context.read<BranchCubit>();
    var managerCubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Add Branch Manager'),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Center(
                  child: ProfilePicture(
                    onEdit: () {},
                    onChange: (File value) {
                      image = value;
                    },
                    onAvatar: (File value) {},
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<BranchCubit, BranchState>(
                  builder: (context, state) {
                    return CommonField(
                      title: 'Branch *',
                      hint: 'Select Branch',
                      dropDown: true,
                      dropDownItems: branchCubit.branchesWithoutManager(),
                      onChange: (value) {
                        branchId = value?.id;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select branch.';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Branch Manager Name *',
                  hint: 'Enter Manager Name',
                  maxLines: 1,
                  length: 50,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    name = value;
                  },
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please enter branch manager name.'
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
                  inputType: TextInputType.emailAddress,
                  length: 50,
                  title: 'Email *',
                  hint: 'Eg: contact@polestar.com',
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter email.';
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
                  length: 10,
                  phoneField: true,
                  inputType: TextInputType.phone,
                  title: 'Mobile Number*',
                  hint: 'Eg: 9876543210',
                  onChange: (value) {
                    phone = value;
                    if (value.length >= 10) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
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
                  length: 300,
                  maxLines: 3,
                  verticalPadding: 10,
                  title: 'Address *',
                  hint: 'Enter Communication Address',
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter address.';
                    } else {
                      return null;
                    }
                  },
                  onChange: (value) {
                    address = value;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DocsUpload(
                  doc1: (File? value) {
                    doc1 = value;
                  },
                  doc2: (File? value) {
                    doc2 = value;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 62),
                    child: Button(
                      onTap: () {
                        formKey.currentState?.save();

                        if (formKey.currentState!.validate()) {
                          /// build the [ ManagerRequest ]
                          ManagerRequest request =
                              managerCubit.managerRequest.copyWith(
                            name: name,
                            branchId: branchId,
                            gender: gender,
                            email: email,
                            mobileNo: phone,
                            countryCode: 91,
                            whatsappNo: whatsappNo ?? phone,
                            dob: dob,
                            address: address,
                          );

                          /// update the [managerCubit] with updated request
                          managerCubit.updateRequest(
                            request,
                            image: image,
                            doc1: doc1,
                            doc2: doc2,
                          );
                          // open the salary details page
                          Navigator.pushNamed(
                            context,
                            SalaryDetails.route,
                            arguments: false, // manager
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
