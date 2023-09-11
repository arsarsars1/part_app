import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view/trainer/components/docs_upload.dart';
import 'package:part_app/view_model/cubits.dart';


class EditManager extends StatefulWidget {
  static const route = '/manager/edit';

  const EditManager({Key? key}) : super(key: key);

  @override
  State<EditManager> createState() => _EditManagerState();
}

class _EditManagerState extends State<EditManager> {
  String? name;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  String? whatsappNo;
  String? areaOfExpertise;
  String? address;
  int? branchId;

  bool selected = false;
  late DateTime selectedDate;
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var managerCubit = context.read<ManagerCubit>();
      dobController.text =
          managerCubit.manager?.managerDetail?[0].dob?.toDateString() ?? '';
      selectedDate = managerCubit.manager?.managerDetail?[0].dob ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    var managerCubit = context.read<ManagerCubit>();
    var manager = managerCubit.manager?.managerDetail?[0];
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Branch Manager Details'),
      body: BlocListener<ManagerCubit, ManagerState>(
        listener: (context, state) {
          if (state is UpdatingManager) {
            Loader(context).show();
          } else if (state is UpdatedManager) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(ManagerDetails.route),
            );
            Alert(context).show(message: 'Updated Manager.');
          } else if (state is UpdatingManagerFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Form(
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
                    title: 'Branch Manager Name *',
                    hint: 'Enter Manager Name',
                    maxLines: 1,
                    length: 50,
                    textInputAction: TextInputAction.next,
                    initialValue: manager?.name,
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
                    defaultItem: DefaultValues().genders.firstWhere(
                          (element) =>
                              element.title?.toLowerCase() ==
                              manager?.gender?.toLowerCase(),
                        ),
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
                    length: 10,
                    initialValue: managerCubit.manager?.mobileNo,
                    phoneField: true,
                    inputType: TextInputType.phone,
                    title: 'Mobile Number*',
                    hint: 'Eg: 9876543210',
                    onChange: (value) {
                      phone = value;
                      if (value.toString().length >= 10) {
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
                    initialValue: manager?.whatsappNo,
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
                    inputType: TextInputType.emailAddress,
                    length: 50,
                    initialValue: manager?.email,
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
                    length: 300,
                    maxLines: 3,
                    verticalPadding: 10,
                    initialValue: manager?.address,
                    title: 'Address *',
                    textInputAction: TextInputAction.newline,
                    hint: 'Enter Communication Address',
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
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DocsUpload(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      document1:
                          '${F.baseUrl}/admin/documents/manager/${manager?.id}/${manager?.document_1}',
                      document2:
                          '${F.baseUrl}/admin/documents/manager/${manager?.id}/${manager?.document_2}',
                      doc1: (File? value) {
                        doc1 = value;
                      },
                      doc2: (File? value) {
                        doc2 = value;
                      },
                    ),
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

                            // open the salary details page
                            managerCubit.updateManager(
                              request: request.toJson(),
                              doc2: doc2,
                              doc1: doc1,
                            );
                          }
                        },
                        title: 'Save',
                      ),
                    ),
                  )
                ],
              ),
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
