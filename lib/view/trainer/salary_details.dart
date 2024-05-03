import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/manager/manager_page.dart';
import 'package:part_app/view/trainer/add_trainer_branches.dart';
import 'package:part_app/view_model/cubits.dart';

class SalaryDetails extends StatefulWidget {
  static const route = '/trainer/salary-details';

  final bool trainer;

  const SalaryDetails({Key? key, required this.trainer}) : super(key: key);

  @override
  State<SalaryDetails> createState() => _SalaryDetailsState();
}

class _SalaryDetailsState extends State<SalaryDetails> {
  TextEditingController joiningDateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String? joiningDate;
  String? upiId;
  String? amount;
  String? payDay;
  var formKey = GlobalKey<FormState>();

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      debugPrint("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    var managerCubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: CommonBar(
        title: widget.trainer
            ? 'Add Trainer Salary Details'
            : 'Add Branch Manager Salary Details',
      ),
      body: Form(
        key: formKey,
        child: BlocListener<ManagerCubit, ManagerState>(
          listener: (context, state) {
            if (state is ManagerCreated) {
              Navigator.popUntil(
                context,
                ModalRoute.withName(ManagerPage.route),
              );
              Alert(context).show(message: 'New manager created.');
            } else if (state is CreatingManager) {
              Loader(context).show();
            } else if (state is ManagerCreationFailed) {
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
                  node: _focusNode,
                  title: 'UPI ID',
                  hint: 'Enter UPI Id',
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
                        ? 'Please enter joining date.'
                        : null;
                  },
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
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
                        : int.parse(value) > 31 || int.parse(value) < 1
                            ? 'Should be below 31 amd above 0'
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
                if (!formKey.currentState!.validate()) {
                  return;
                }
                if (widget.trainer) {
                  TrainerRequest request = trainerCubit.request.copyWith(
                    upiId: upiId,
                    salaryAmount: amount,
                    salaryType: 'monthly ',
                    doj: joiningDate,
                    salaryDate: int.tryParse(payDay ?? '0'),
                  );

                  // update the data in cubit
                  trainerCubit.updateRequest(
                    request,
                  );

                  Navigator.pushNamed(context, AddTrainerBranches.route);
                } else {
                  ManagerRequest request = managerCubit.managerRequest.copyWith(
                    upiId: upiId,
                    salaryAmount: amount,
                    salaryType: 'monthly ',
                    doj: joiningDate,
                    salaryDate: payDay,
                  );

                  // update the data in cubit
                  managerCubit.updateRequest(
                    request,
                  );

                  managerCubit.createManager();
                }
              },
              title: widget.trainer ? 'Continue' : 'Add',
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
      firstDate: DateTime(
        DateTime.now().year - 99,
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
