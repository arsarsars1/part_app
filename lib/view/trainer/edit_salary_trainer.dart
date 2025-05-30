import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/cubits.dart';

class EditSalaryTrainer extends StatefulWidget {
  static const route = '/trainer/edit-salary-details';

  const EditSalaryTrainer({super.key});

  @override
  State<EditSalaryTrainer> createState() => _EditSalaryTrainerState();
}

class _EditSalaryTrainerState extends State<EditSalaryTrainer> {
  TextEditingController joiningDateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String? joiningDate;
  String? upiId;
  String? amount;
  String? payDay;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(() {
    //   FocusManager.instance.primaryFocus?.unfocus();
    // });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var trainerCubit = context.read<TrainerCubit>();
      Trainer? trainer = trainerCubit.trainer?.trainerDetail?[0];
      joiningDateController.text = trainer?.doj?.toDateString() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    Trainer? trainer = trainerCubit.trainer?.trainerDetail?[0];
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Trainer Salary Details'),
      body: Form(
        key: formKey,
        child: BlocListener<TrainerCubit, TrainerState>(
          listener: (context, state) {
            if (state is TrainerUpdated) {
              Navigator.popUntil(
                context,
                ModalRoute.withName(TrainerDetails.route),
              );
              Alert(context).show(message: 'Salary details updated');
            } else if (state is UpdatingTrainer) {
              Loader(context).show();
            } else if (state is UpdatingTrainerFailed) {
              Navigator.pop(context);
              Alert(context).show(message: state.message);
            }
          },
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ListView(
              controller: scrollController,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  initialValue: trainer?.upiId,
                  title: 'UPI ID',
                  hint: 'Enter UPI ID',
                  maxLines: 1,
                  length: 50,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    upiId = value;
                  },
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return null;
                    } else if (value != null &&
                        !RegExp(upiRegex).hasMatch(value)) {
                      return 'Please enter a valid UPI.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  initialValue: '${trainer?.salaryAmount}',
                  title: 'Salary Amount *',
                  hint: 'Enter Salary',
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChange: (value) {
                    amount = value;
                  },
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please enter salary amount.'
                        : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  controller: joiningDateController,
                  onTap: datePicker,
                  disabled: true,
                  hint: 'dd/mm/yyyy',
                  title: 'Joining Date *',
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please select joining date.'
                        : null;
                  },
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  initialValue: '${trainer?.salaryDate}',
                  title: 'Pay Day *',
                  hint: 'Eg: 30',
                  inputType:
                      const TextInputType.numberWithOptions(decimal: false),
                  phoneField: true,
                  length: 2,
                  onChange: (value) {
                    payDay = value;
                    if (value.toString().length == 2) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please enter pay day.'
                        : null;
                  },
                  showInfo: true,
                  toolTipMessage:
                      'Enter the day of the month in which you pay the monthly salary to this employee.',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                formKey.currentState?.save();
                if (formKey.currentState!.validate()) {
                  // if (upiId == '') {
                  //   upiId = null;
                  // }
                  TrainerRequest request = TrainerRequest(
                    upiId: upiId,
                    salaryAmount: amount,
                    salaryType: 'monthly',
                    doj: joiningDate,
                    salaryDate: int.parse(payDay!),
                  );

                  trainerCubit.updateTrainer(request);
                }
              },
              height: UIConstants.buttonHeight,
              title: 'Save',
            ),
          ),
        ),
      ),
    );
  }

  // method to get the date for [ joining date ]
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
      firstDate: DateTime(
        DateTime.now().year - 50,
      ),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        joiningDate = value.toServerString();
        joiningDateController.text = value.toDateString();
      }
    });
  }
}
