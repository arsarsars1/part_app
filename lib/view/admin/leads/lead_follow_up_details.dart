import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/assignable_model.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/lead_utils.dart';
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
  BatchModel? batchId;
  String? date;
  String? time;
  String? assign;
  String? comments;
  AssignableTrainer? assignableTrainer;
  FollowUp? followUp;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController trainerController = TextEditingController();
  TextEditingController commentController = TextEditingController();
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
    final FollowUp? selectedLead = cubit.selectedFollowUp;
    if (selectedLead != null) {
      followUp = selectedLead;
      leadStatusController.text = selectedLead.followUpStatus ?? "";
      trainerController.text = selectedLead.assignedTo?.name ?? "";
      if (selectedLead.assignedTo != null) {
        assignableTrainer = AssignableTrainer(
          id: selectedLead.assignedTo!.id!,
          name: selectedLead.assignedTo!.name!,
        );
      }
      timeController.text = selectedLead.followUpTime!.isNotEmpty
          ? selectedLead.followUpTime?.toAmPM() ?? ""
          : "";
      time = timeController.text;
      dateController.text = selectedLead.followUpDate.toString().isNotEmpty
          ? selectedLead.followUpDate?.toDDMMMYYY() ?? ""
          : "";
      date = dateController.text;
      commentController.text =
          selectedLead.followUpComment.toString().isNotEmpty
              ? selectedLead.followUpComment ?? ""
              : null;
      comments = commentController.text;
      status = selectedLead.followUpStatus.toString().isNotEmpty
          ? selectedLead.followUpStatus
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
          if (state is CreatedFollowUpLead) {
            Alert(context).show(message: 'Followup Created');
            Navigator.pop(context);
          } else if (state is UpdateFollowUpLead) {
            Alert(context).show(message: 'Followup Updated');
            Navigator.pop(context);
          } else if (state is CreatedLead) {
            Alert(context).show(message: 'Lead Created');
            Navigator.pop(context);
          } else if (state is CreateLeadFailed) {
            Alert(context).show(message: state.message);
          } else if (state is FetchingLeadsFailed) {
            Alert(context).show(message: state.message);
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
                        LeadUtils().getAssignable(
                          scaffoldKey,
                          selectedTrainers: assignableTrainer != null
                              ? [assignableTrainer!.id]
                              : null,
                          onSelect: (AssignableTrainer? trainer) {
                            assignableTrainer = trainer;
                            trainerController.text = trainer?.name ?? '';
                          },
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
                      title: 'Followup Date *',
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
                      validator: (value) {
                        return value == null || value.toString().isEmpty
                            ? 'Please select date'
                            : null;
                      },
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
                      controller: commentController,
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
                      controller: leadStatusController,
                      defaultItem: cubit.selectedFollowUp != null &&
                              cubit.selectedFollowUp!.followUpStatus
                                  .isNotNullOrEmpty()
                          ? DefaultValues.leadFollowUpStatus
                              .where((test) =>
                                  test.title ==
                                  cubit.selectedFollowUp!.followUpStatus
                                      .toString())
                              .first
                          : null,
                      dropDownItems: DefaultValues.leadFollowUpStatus,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        status = value.title;
                      },
                      // validator: (value) {
                      //   return value == null || value.toString().isEmpty
                      //       ? 'Please select lead status.'
                      //       : null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Button(
                        onTap: () {
                          if (assignableTrainer?.morphClass == null) {
                            assignableTrainer = null;
                          }
                          if (formKey.currentState!.validate()) {
                            if (followUp != null) {
                              if (!isStatusUpdated() &&
                                  !isTrainerUpdated() &&
                                  !isDateUpdated() &&
                                  !isTimeUpdated() &&
                                  !isCommentUpdated()) {
                                Alert(context).show(
                                    message: "No changes detected to update.");
                                return;
                              }

                              LeadRequest request =
                                  LeadRequest(batchId: batchId?.id);
                              if (isStatusUpdated()) {
                                request = request.copyWith(leadStatus: status);
                              }
                              if (isTrainerUpdated()) {
                                request = request.copyWith(
                                  assignedToId: assignableTrainer?.id,
                                  assignedToType: assignableTrainer?.morphClass,
                                );
                              }
                              if (isDateUpdated()) {
                                request = request.copyWith(
                                  followUpDate:
                                      LeadUtils().convertDateString(date ?? ""),
                                );
                              }
                              if (isTimeUpdated()) {
                                request = request.copyWith(
                                  followUpTime: LeadUtils()
                                      .convertTo24HourFormat(time ?? ""),
                                );
                              }
                              if (isCommentUpdated()) {
                                request =
                                    request.copyWith(followUpComment: comments);
                              }

                              cubit.addUpdateLeadFollowUpList(
                                  request, followUp!.leadId, followUp!.id);
                            } else {
                              LeadRequest request = LeadRequest(
                                batchId: batchId?.id,
                                leadStatus: status,
                                followUpDate:
                                    LeadUtils().convertDateString(date ?? ""),
                                followUpTime: LeadUtils()
                                    .convertTo24HourFormat(time ?? ""),
                                followUpComment: comments,
                                assignedToId: assignableTrainer?.id,
                                assignedToType: assignableTrainer?.morphClass,
                              );

                              cubit.addUpdateLeadFollowUpList(
                                  request, cubit.selectedLead?.id, null);
                            }
                          }
                        },
                        title: followUp == null
                            ? "Add Followup"
                            : 'Update Followup',
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

  bool isStatusUpdated() {
    return status != (followUp?.followUpStatus ?? "");
  }

  bool isTrainerUpdated() {
    return trainerController.text != (followUp?.assignedTo?.name ?? "");
  }

  bool isDateUpdated() {
    return dateController.text != (followUp?.followUpDate?.toDDMMMYYY() ?? "");
  }

  bool isTimeUpdated() {
    return timeController.text != (followUp?.followUpTime?.toAmPM() ?? "");
  }

  bool isCommentUpdated() {
    return commentController.text != (followUp?.followUpComment ?? "");
  }

  bool hasUpdates() {
    return !(leadStatusController.text == (followUp?.followUpStatus ?? "") &&
        trainerController.text == (followUp?.assignedTo?.name ?? "") &&
        dateController.text == (followUp?.followUpDate?.toDDMMMYYY() ?? "") &&
        timeController.text == (followUp?.followUpTime?.toAmPM() ?? "") &&
        commentController.text == (followUp?.followUpComment ?? ""));
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
        final formattedTimeOfDay = localizations.formatTimeOfDay(value);
        time = formattedTimeOfDay;
        timeController.text = formattedTimeOfDay;
      }
    });
  }
}
