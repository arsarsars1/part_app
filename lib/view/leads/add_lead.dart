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

class AddLead extends StatefulWidget {
  static const route = '/leads/add';

  const AddLead({Key? key}) : super(key: key);

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Add Lead',
      ),
      body: BlocConsumer<LeadsCubit, LeadsState>(
        listener: (context, state) {
          if (state is CreatedLead) {
            Alert(context).show(message: 'Lead Created');
            Navigator.pop(context);
          }
          if (state is CreateLeadFailed) {
            Alert(context).show(message: "Failed to create lead");
          }
        },
        builder: (context, state) {
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
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Lead Status *',
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
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Name *',
                    hint: 'Please enter name',
                    length: 50,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      name = value;
                    },
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select lead status.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Age',
                    hint: 'Please enter age',
                    length: 2,
                    maxLines: 1,
                    inputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      age = value;
                    },
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please enter the age.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Gender',
                    hint: 'Please select gender.',
                    length: 50,
                    maxLines: 1,
                    dropDown: true,
                    dropDownItems: DefaultValues().genders,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      gender = value.id;
                    },
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select gender.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Mobile Number *',
                    hint: 'Please enter number',
                    length: 10,
                    maxLines: 1,
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
                    onChange: (value) {},
                    onNumberChange: (value) {
                      whatsappNumber = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    initialValue: email,
                    inputType: TextInputType.emailAddress,
                    length: 50,
                    title: 'Email ID *',
                    hint: 'Eg: contact@polestar.com',
                    capitalization: TextCapitalization.none,
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
                  BranchField(
                    onSelect: (value) {
                      branchId = value;
                      batchCubit.getBatchesByStatus(
                        branchId: branchId,
                        clean: true,
                        branchSearch: true,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select batch.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select date'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select time'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                            trainerController.text = trainer?.trainerName ?? '';
                          },
                        ),
                      );
                    },
                    textInputAction: TextInputAction.next,
                    onChange: (value) {},
                    validator: (value) {
                      return value == null || value.toString().isEmpty
                          ? 'Please select trainer'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    verticalPadding: 10,
                    title: 'Comments',
                    hint: 'Enter Comments',
                    maxLines: 5,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      comments = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      title: 'Add Lead',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
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
