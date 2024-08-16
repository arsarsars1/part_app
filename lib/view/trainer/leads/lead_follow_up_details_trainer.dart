import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/lead_utils.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadTrainerFollowUpDetails extends StatefulWidget {
  static const route = '/leads/details/followup-details-trainer';
  const LeadTrainerFollowUpDetails({super.key});

  @override
  State<LeadTrainerFollowUpDetails> createState() =>
      _LeadTrainerFollowUpDetailsState();
}

class _LeadTrainerFollowUpDetailsState
    extends State<LeadTrainerFollowUpDetails> {
  String? status;
  String? date;
  String? time;
  String? assign;
  String? comments;
  Trainer? trainer;
  FollowUp? followUp;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
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
    final FollowUp? selectedLead = cubit.selectedFollowUp;
    if (selectedLead != null) {
      followUp = selectedLead;
      leadStatusController.text = selectedLead.followUpStatus ?? "";
      trainerController.text = selectedLead.assignedTo?.name ?? "";
      timeController.text = selectedLead.followUpTime!.isNotEmpty
          ? selectedLead.followUpTime?.toAmPM() ?? ""
          : "";
      time = timeController.text;
      dateController.text = selectedLead.followUpDate.toString().isNotEmpty
          ? selectedLead.followUpDate?.toDDMMMYYY() ?? ""
          : "";
      date = dateController.text;
      comments = selectedLead.followUpComment.toString().isNotEmpty
          ? selectedLead.followUpComment
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
                        AuthCubit? authCubit = context.read<AuthCubit>();
                        int trainerId = authCubit.user
                                ?.trainerDetail?[authCubit.trainerIndex].id ??
                            0;
                        LeadUtils().getAssignable(
                          scaffoldKey,
                          trainerId: trainerId,
                          onSelect: (Trainer? trainer) {
                            this.trainer = trainer;
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
                          if (formKey.currentState!.validate()) {
                            LeadRequest request = LeadRequest(
                              leadStatus: status,
                              followUpDate: convertDateString(date ?? ""),
                              followUpTime: convertTo24HourFormat(time ?? ""),
                              followUpComment: comments,
                              assignedToId: trainer?.id,
                              assignedToType: r'\App\Models\TrainerDetail',
                            );
                            AuthCubit? authCubit = context.read<AuthCubit>();
                            int trainerId = authCubit
                                    .user
                                    ?.trainerDetail?[authCubit.trainerIndex]
                                    .id ??
                                0;
                            if (followUp != null) {
                              cubit.addTrainerUpdateLeadFollowUpList(request,
                                  followUp!.leadId, followUp!.id, trainerId);
                            } else {
                              cubit.addTrainerUpdateLeadFollowUpList(request,
                                  cubit.selectedLead?.id, null, trainerId);
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

  String convertDateString(String dateString) {
    DateTime dateTime;

    try {
      DateFormat inputFormat1 = DateFormat('d MMMM, yyyy');
      dateTime = inputFormat1.parse(dateString);
    } catch (e) {
      DateFormat inputFormat2 = DateFormat('yyyy-MM-dd');
      dateTime = inputFormat2.parse(dateString);
    }

    // Define the output format
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    // Convert the DateTime object to the desired output format
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  String convertTo24HourFormat(String time) {
    try {
      final DateFormat inputFormat12Hour = DateFormat.jm();
      final DateTime dateTime = inputFormat12Hour.parse(time);
      final DateFormat outputFormat = DateFormat('HH:mm');
      return outputFormat.format(dateTime);
    } catch (e) {
      try {
        final DateFormat inputFormat24Hour = DateFormat('HH:mm');
        final DateTime dateTime = inputFormat24Hour.parse(time);
        return inputFormat24Hour.format(dateTime);
      } catch (e) {
        throw FormatException("Invalid time format: $time");
      }
    }
  }

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
