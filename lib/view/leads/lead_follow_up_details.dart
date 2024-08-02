import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/trainer_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadFollowUpDetails extends StatefulWidget {
  static const route = '/leads/details/followup_details';
  const LeadFollowUpDetails({super.key});

  @override
  State<LeadFollowUpDetails> createState() => _LeadFollowUpDetailsState();
}

class _LeadFollowUpDetailsState extends State<LeadFollowUpDetails> {
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
      branchId = selectedLead.batchId;
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
        title: 'Lead Followup Details',
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
                      title: 'Followup Time',
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
                    CommonField(
                      title: 'Follow Status',
                      hint: 'Select status',
                      length: 50,
                      maxLines: 1,
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

                            var cubit = context.read<LeadsCubit>();
                            var id = cubit.selectedLead!.id!;

                            cubit.updateLeadFollowUpList(id);
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
