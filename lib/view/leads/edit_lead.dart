import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view/trainer/trainer_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class EditLead extends StatefulWidget {
  static const route = '/leads/edit';

  const EditLead({Key? key}) : super(key: key);

  @override
  State<EditLead> createState() => _EditLeadState();
}

class _EditLeadState extends State<EditLead> {
  String? status;
  String? name;
  String? age;
  String? gender;
  String? mobileNumber;
  String? whatsappNumber;
  int? branchId;
  BatchModel? batchId;
  String? date;
  String? time;
  String? email;
  String? assign;
  String? comments;
  TrainerModel? trainer;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController trainerController = TextEditingController();
  TextEditingController leadStatusController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() {
    final cubit = context.read<LeadsCubit>();
    final selectedLead = cubit.selectedLead;
    if (selectedLead != null) {
      leadStatusController.text = selectedLead.leadStatus ?? "";
      trainerController.text = selectedLead.assignedTo?.name ?? "";
      timeController.text = selectedLead.followUps.isNotNullAndNotEmpty
          ? selectedLead.followUps![0].followUpTime?.toAmPM() ?? ""
          : "";
      dateController.text = selectedLead.followUps.isNotNullAndNotEmpty
          ? selectedLead.followUps![0].followUpDate?.toDDMMMYYY() ?? ""
          : "";
      batchController.text = selectedLead.batch?.batchName ?? "";
      name = selectedLead.name;
      age = selectedLead.age;
      gender = selectedLead.gender;
      mobileNumber = selectedLead.mobileNo;
      whatsappNumber = selectedLead.whatsapp;
      email = selectedLead.email;
      branchId = selectedLead.batchId ?? 0;
      comments = selectedLead.followUps.isNotNullAndNotEmpty
          ? selectedLead.followUps![0].followUpComment
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Edit Lead',
      ),
      body: BlocListener<LeadsCubit, LeadsState>(
        listener: (context, state) {
          if (state is CreatedLead) {
            Alert(context).show(message: 'Lead Created');
            Navigator.pop(context);
          }
          if (state is CreateLeadFailed) {
            Alert(context).show(message: "Failed to create lead");
          }
        },
        child: BlocBuilder<LeadsCubit, LeadsState>(
          builder: (context, state) {
            var cubit = context.read<LeadsCubit>();
            if (state is CreatingLead) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Lead Status *',
                      hint: 'Select status',
                      length: 50,
                      controller: leadStatusController,
                      maxLines: 1,
                      defaultItem: cubit.selectedLead != null &&
                              cubit.selectedLead!.leadStatus != null
                          ? DefaultValues.leadStatus
                              .where((dropdownItem) =>
                                  dropdownItem.title ==
                                  cubit.selectedLead?.leadStatus)
                              .first
                          : null,
                      dropDown: true,
                      dropDownItems: DefaultValues.leadStatus,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        status = value.title;
                      },
                      validator: (value) {
                        return value == null || value.toString().isEmpty
                            ? 'Please select lead status.'
                            : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Name',
                      hint: 'Please enter name',
                      initialValue: cubit.selectedLead?.name,
                      length: 50,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        name = value;
                      },
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select lead status.'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Age',
                      hint: 'Please enter age',
                      initialValue: cubit.selectedLead?.age,
                      length: 2,
                      maxLines: 1,
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        age = value;
                      },
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please enter the age.'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Gender',
                      hint: 'Please select gender.',
                      length: 50,
                      maxLines: 1,
                      defaultItem: cubit.selectedLead != null &&
                              cubit.selectedLead!.gender != null
                          ? DefaultValues().genders.firstWhere((element) =>
                              element.title?.toLowerCase() ==
                              cubit.selectedLead?.gender?.toLowerCase())
                          : null,
                      initialValue: cubit.selectedLead?.gender,
                      dropDown: true,
                      dropDownItems: DefaultValues().genders,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        gender = value.id;
                      },
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select gender.'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Mobile Number *',
                      hint: 'Please enter number',
                      length: 10,
                      maxLines: 1,
                      initialValue: cubit.selectedLead?.mobileNo,
                      inputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        mobileNumber = value;
                        if (value.length >= 10) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      validator: (value) {
                        return value == null || value.toString().isEmpty
                            ? 'Please enter the phone number.'
                            : null;
                      },
                    ),
                    WhatsappCheckButton(
                      initialValue: whatsappNumber,
                      selected: whatsappNumber == null,
                      onChange: (value) {
                        whatsappNumber = null;
                      },
                      onNumberChange: (value) {
                        whatsappNumber = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      initialValue: cubit.selectedLead?.email,
                      inputType: TextInputType.emailAddress,
                      length: 50,
                      title: 'Email ID *',
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
                    const SizedBox(height: 20),
                    BranchField(
                      isMandatory: false,
                      initialBranch: cubit.selectedLead?.branchId,
                      onSelect: (value) {
                        branchId = value;
                        context.read<BatchCubit>().getBatchesByStatus(
                              branchId: branchId,
                              clean: true,
                              branchSearch: true,
                            );
                      },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Batch',
                      hint: 'Please select batch',
                      controller: batchController,
                      maxLines: 1,
                      disabled: true,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {},
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.white24,
                        ),
                      ),
                      onTap: () {
                        if (branchId == null) return;
                        scaffoldKey.currentState?.showBottomSheet(
                          backgroundColor: Colors.transparent,
                          (context) => BatchPicker(
                            branchId: branchId!,
                            status: '',
                            branchSearch: true,
                            onSelect: (value) {
                              batchId = value;
                              batchController.text = value.name;
                            },
                          ),
                        );
                      },
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select batch.'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Followup Date',
                      hint: 'Please select date',
                      controller: dateController,
                      length: 50,
                      maxLines: 1,
                      disabled: true,
                      onTap: () {
                        datePicker();
                      },
                      textInputAction: TextInputAction.next,
                      onChange: (value) {},
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select date'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Followup time',
                      hint: 'Please select time',
                      controller: timeController,
                      onTap: () {
                        timePicker();
                      },
                      length: 50,
                      maxLines: 1,
                      disabled: true,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {},
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select time'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      controller: trainerController,
                      title: 'Assign',
                      hint: 'Please select Trainer or Branch Admin',
                      maxLines: 1,
                      disabled: true,
                      onTap: () {
                        scaffoldKey.currentState?.showBottomSheet(
                          elevation: 10,
                          backgroundColor: Colors.transparent,
                          (context) => TrainerPicker(
                            isBatch: true,
                            multiPicker: false,
                            batchId: batchId?.id,
                            selectedTrainers: const [],
                            onSave: (List<Trainer?> value) {},
                            onSelect: (TrainerModel? trainer) {
                              this.trainer = trainer;
                              trainerController.text =
                                  trainer?.trainerName ?? '';
                            },
                          ),
                        );
                      },
                      textInputAction: TextInputAction.next,
                      onChange: (value) {},
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select trainer'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    CommonField(
                      title: 'Comments',
                      verticalPadding: 10,
                      hint: 'Enter Comments',
                      initialValue: cubit.selectedLead != null &&
                              cubit.selectedLead!.followUps.isNotNullAndNotEmpty
                          ? cubit.selectedLead!.followUps![0].followUpComment
                          : null,
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        comments = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Button(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            LeadRequest request = LeadRequest(
                              name: name,
                              mobileNo: mobileNumber,
                              email: email,
                              whatsappNo: whatsappNumber ?? mobileNumber,
                              gender: gender,
                              branchId: branchId,
                              batchId: batchId?.id,
                              leadStatus: status,
                              followUpDate: date,
                              followUpTime: time,
                              age: age,
                              followUpComment: comments,
                              assignedToId: trainer?.detailId,
                              assignedToType: r'\App\Models\TrainerDetail',
                            );

                            context.read<LeadsCubit>().create(request);
                          }
                        },
                        title: 'Update Lead',
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // method to get the date for [ followup date ]
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
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 2,
      ),
    ).then((value) {
      if (value != null) {
        date = value.toServerYMD();
        dateController.text = value.toDateString();
      }
    });
  }

  void timePicker() {
    showTimePicker(
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
      initialTime: const TimeOfDay(hour: 09, minute: 00),
    ).then((value) {
      if (value != null) {
        final localizations = MaterialLocalizations.of(context);
        final formattedTimeOfDay = localizations.formatTimeOfDay(
          value,
          alwaysUse24HourFormat: true,
        );
        time = formattedTimeOfDay;
        timeController.text = formattedTimeOfDay;
      }
    });
  }
}
