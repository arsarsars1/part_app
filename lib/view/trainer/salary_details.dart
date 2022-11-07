import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/trainer/add_trainer_branches.dart';
import 'package:part_app/view_model/cubits.dart';

class SalaryDetails extends StatefulWidget {
  static const route = '/trainer/salary-details';

  const SalaryDetails({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Add Trainer Salary Details'),
      body: GestureDetector(
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
                // return value == null || value.toString().isEmpty
                //     ? 'Please enter trainer name.'
                //     : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Salary Amount',
              hint: 'Enter Salary',
              inputType: const TextInputType.numberWithOptions(decimal: true),
              onChange: (value) {
                amount = value;
              },
              validator: (value) {
                // return value == null || value.toString().isEmpty
                //     ? 'Please enter trainer name.'
                //     : null;
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
                // return value == null || value.toString().isEmpty
                //     ? 'Please enter dob.'
                //     : null;
              },
              onChange: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Pay Day',
              hint: 'Eg: 30',
              inputType: const TextInputType.numberWithOptions(decimal: false),
              phoneField: true,
              length: 2,
              onChange: (value) {
                payDay = value;
                if (value.toString().length == 2) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              validator: (value) {
                // return value == null || value.toString().isEmpty
                //     ? 'Please enter trainer name.'
                //     : null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
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
              },
              title: 'Continue',
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
