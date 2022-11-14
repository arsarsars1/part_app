import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/manager/manager_page.dart';
import 'package:part_app/view_model/cubits.dart';

class EditSalaryManager extends StatefulWidget {
  static const route = '/manager/edit-salary-details';

  const EditSalaryManager({Key? key}) : super(key: key);

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
    // scrollController.addListener(() {
    //   // FocusManager.instance.primaryFocus?.unfocus();
    // });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var managerCubit = context.read<ManagerCubit>();
      joiningDateController.text =
          managerCubit.manager?.doj?.toDateString() ?? '';

      amount = managerCubit.manager?.salaryAmount;
      payDay = '${managerCubit.manager?.salaryDate}';
      joiningDate = managerCubit.manager?.doj?.toServerString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var managerCubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Branch Manager Salary Details'),
      body: Form(
        key: formKey,
        child: BlocListener<ManagerCubit, ManagerState>(
          listener: (context, state) {
            if (state is ManagerCreated) {
              Navigator.popUntil(
                context,
                ModalRoute.withName(ManagerPage.route),
              );
              Alert(context).show(message: 'Salary details updated');
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
                  title: 'UPI ID',
                  hint: 'Enter UPI Id',
                  onChange: (value) {
                    upiId = value;
                  },
                  validator: (value) {
                    return value == null || value.toString().isEmpty
                        ? 'Please enter your upi id.'
                        : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  initialValue:
                      managerCubit.manager?.salaryAmount?.currencyFormat(),
                  title: 'Salary Amount',
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
                  title: 'Joining Date',
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
                  initialValue: '${managerCubit.manager?.salaryDate}',
                  title: 'Pay Day',
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
                if (formKey.currentState!.validate()) {
                  ManagerRequest request = ManagerRequest(
                    upiId: upiId,
                    salaryAmount: amount,
                    salaryType: 'monthly',
                    doj: joiningDate,
                    salaryDate: payDay,
                  );

                  managerCubit.updateManager(request: {
                    'salary_date': payDay,
                    'salary_amount': int.tryParse(amount!),
                    'doj': joiningDate,
                    'upi_id': upiId,
                  });
                }
              },
              title: 'Save',
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
