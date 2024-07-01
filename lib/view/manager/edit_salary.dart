import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view_model/cubits.dart';

class EditSalaryManager extends StatefulWidget {
  static const route = '/manager/edit-salary-details';

  const EditSalaryManager({super.key});

  @override
  State<EditSalaryManager> createState() => _EditSalaryManagerState();
}

class _EditSalaryManagerState extends State<EditSalaryManager> {
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var managerCubit = context.read<ManagerCubit>();
      Manager? manager = managerCubit.manager?.managerDetail?[0];
      joiningDateController.text = manager?.doj?.toDateString() ?? '';

      amount = manager?.salaryAmount?.toString();
      payDay = '${manager?.salaryDate}';
      joiningDate = manager?.doj?.toServerString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var managerCubit = context.read<ManagerCubit>();
    Manager? manager = managerCubit.manager?.managerDetail?[0];
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Branch Manager Salary Details'),
      body: Form(
        key: formKey,
        child: BlocListener<ManagerCubit, ManagerState>(
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
                  initialValue: manager?.upiId,
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
                  initialValue: '${manager?.salaryAmount}',
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
                  initialValue: '${manager?.salaryDate}',
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
                  ManagerRequest request = ManagerRequest(
                    upiId: upiId,
                    salaryAmount: amount,
                    salaryType: 'monthly',
                    doj: joiningDate,
                    salaryDate: payDay,
                  );

                  managerCubit.updateManager(request: request.toJson());
                }
              },
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
