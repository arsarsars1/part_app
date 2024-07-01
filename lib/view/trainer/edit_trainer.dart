import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/trainer/components/docs_upload.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/cubits.dart';

class EditTrainer extends StatefulWidget {
  static const route = '/trainer/edit';

  const EditTrainer({super.key});

  @override
  State<EditTrainer> createState() => _EditTrainerState();
}

class _EditTrainerState extends State<EditTrainer> {
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

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();
  TextEditingController dobController = TextEditingController();
  late DateTime selectedDate;

  // Files
  File? image;
  File? doc1;
  File? doc2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var trainerCubit = context.read<TrainerCubit>();
      dobController.text =
          trainerCubit.trainer?.trainerDetail?[0].dob?.toDateString() ?? '';
      selectedDate =
          trainerCubit.trainer?.trainerDetail?[0].dob ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    Trainer? trainer = trainerCubit.trainer?.trainerDetail?[0];
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Trainer Details'),
      body: BlocListener<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is TrainerUpdated) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(TrainerDetails.route),
            );
            Alert(context).show(message: 'Trainer details updated');
          } else if (state is UpdatingTrainer) {
            Loader(context).show();
          } else if (state is UpdatingTrainerFailed) {
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
                    title: 'Trainer Name *',
                    hint: 'Trainer Name',
                    initialValue: trainer?.name,
                    maxLines: 1,
                    length: 50,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      name = value;
                    },
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
                    defaultItem: DefaultValues().genders.firstWhere(
                          (element) =>
                              element.title?.toLowerCase() ==
                              trainer?.gender?.toLowerCase(),
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
                    initialValue: trainerCubit.trainer?.mobileNo,
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
                    selected:
                        trainer?.whatsappNo == trainerCubit.trainer?.mobileNo,
                    initialValue: trainer?.whatsappNo,
                    onChange: (bool value) {
                      whatsappNo = null;

                      selected = value;
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
                    inputType: TextInputType.emailAddress,
                    length: 50,
                    initialValue: trainer?.email,
                    title: 'Email ',
                    hint: 'Eg: contact@polestar.com',
                    capitalization: TextCapitalization.none,
                    // validator: (value) {
                    //   if (value == null || value.toString().isEmpty) {
                    //     return 'Please enter email.';
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
                    length: 100,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    initialValue: trainer?.expertise,
                    title: 'Area Of Expertise',
                    hint: 'Eg: Hip Hop Dance',
                    onChange: (value) {
                      areaOfExpertise = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    initialValue: trainer?.address,
                    length: 300,
                    verticalPadding: 10,
                    maxLines: 3,
                    title: 'Address',
                    textInputAction: TextInputAction.newline,
                    hint: 'Enter Communication Address',
                    // validator: (value) {
                    //   if (value == null || value.toString().isEmpty) {
                    //     return 'Please enter address.';
                    //   } else {
                    //     return null;
                    //   }
                    // },
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
                          '${F.baseUrl}/admin/documents/trainer/${trainer?.id}/${trainer?.document1}',
                      document2:
                          '${F.baseUrl}/admin/documents/trainer/${trainer?.id}/${trainer?.document2}',
                      doc1: (File? value) {
                        doc1 = value;
                      },
                      doc2: (File? value) {
                        doc2 = value;
                      },
                    ),
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
                            /// build the [ TrainerRequest ]
                            TrainerRequest request = TrainerRequest(
                              name: name,
                              gender: gender,
                              email: email,
                              mobileNo: phone,
                              countryCode: 91,
                              whatsappNo: whatsappNo ?? phone,
                              dob: dob,
                              address: address,
                              expertise: areaOfExpertise,
                            );

                            trainerCubit.updateTrainer(
                              request,
                              doc2: doc2,
                              doc1: doc1,
                            );
                          }
                        },
                        height: UIConstants.buttonHeight,
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
