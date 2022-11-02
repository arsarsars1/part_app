import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class TrainerSalaryDetails extends StatefulWidget {
  static const route = '/trainer/salary-details';

  const TrainerSalaryDetails({Key? key}) : super(key: key);

  @override
  State<TrainerSalaryDetails> createState() => _TrainerSalaryDetailsState();
}

class _TrainerSalaryDetailsState extends State<TrainerSalaryDetails> {
  TextEditingController joiningDateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String? joiningDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onChange: (value) {},
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
              onChange: (value) {},
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
              onTap: () {},
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
