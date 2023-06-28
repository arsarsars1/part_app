import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';

class EditFees extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> reason;
  final ValueChanged<String> date;
  final ValueChanged<String> amount;

  const EditFees({
    Key? key,
    required this.formKey,
    required this.reason,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  State<EditFees> createState() => EditFeesState();
}

class EditFeesState extends State<EditFees> {
  DateTime? date;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CommonField(
            title: 'Amount *',
            hint: 'Enter Amount',
            maxLines: 1,
            inputType: TextInputType.number,
            contentPadding: EdgeInsets.zero,
            onChange: (value) {
              widget.amount(value);
            },
            validator: (value) {
              return value.toString().trim().isEmpty
                  ? 'Please enter the amount'
                  : null;
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date *',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              // Container(
              //   height: 60.h,
              //   decoration: BoxDecoration(
              //     color: AppColors.grey800.withOpacity(.4),
              //     borderRadius: BorderRadius.circular(4),
              //   ),
              //   padding: EdgeInsets.symmetric(horizontal: 25.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       date == null
              //           ? Text(
              //               'Select the date',
              //               style:
              //                   Theme.of(context).textTheme.bodyLarge?.copyWith(
              //                         color: AppColors.grey600.withOpacity(.6),
              //                       ),
              //             )
              //           : Text(
              //               '${date?.toDateString()}',
              //               style:
              //                   Theme.of(context).textTheme.bodyLarge?.copyWith(
              //                         color: AppColors.grey400,
              //                       ),
              //             ),
              //       GestureDetector(
              //         onTap: () async {
              //           await datePicker();
              //         },
              //         child: const Icon(
              //           Icons.calendar_month,
              //           size: 24,
              //           color: Colors.white24,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.none,
                onTap: () async {
                  await datePicker();
                  dateController.text = date?.toDateString() ?? "";
                },
                readOnly: true,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter date';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white.withOpacity(.7)),
                textAlign: TextAlign.start,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    size: 24,
                    color: Colors.white24,
                  ),
                  hintText: 'Select the date',
                  fillColor: AppColors.grey800.withOpacity(.5),
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          CommonField(
            title: 'Remark/Reason For Editing *',
            hint: 'Enter Remark/Reason',
            maxLines: 2,
            contentPadding: EdgeInsets.zero,
            onChange: (value) {
              widget.reason(value);
            },
            validator: (value) {
              return value.toString().trim().isEmpty
                  ? 'Please enter the remark/reason'
                  : null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // method to get the date for [ class ]
  Future<void> datePicker() async {
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
      firstDate: DateTime(1900),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
    ).then((value) {
      if (value != null) {
        date = value;
        dateController.text = value.toDateString();
        widget.date(value.toServerString());
        setState(() {});
      }
    });
  }
}
