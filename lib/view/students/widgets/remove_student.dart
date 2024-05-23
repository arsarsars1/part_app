import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class RemoveStudent extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> rejoiningDate;
  final ValueChanged<String> remark;

  const RemoveStudent(
      {Key? key,
      required this.formKey,
      required this.rejoiningDate,
      required this.remark})
      : super(key: key);

  @override
  State<RemoveStudent> createState() => _RemoveStudentState();
}

class _RemoveStudentState extends State<RemoveStudent> {
  TextEditingController rejoiningController = TextEditingController();

  String? rejoining;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CommonField(
            controller: rejoiningController,
            title: 'Date Of Rejoining The Batch',
            disabled: true,
            hint: 'dd/mm/yyyy',
            onTap: datePicker,
            onChange: (value) {},
            contentPadding: EdgeInsets.zero,
            validator: (value) {
              return value.toString().trim().isEmpty
                  ? 'Please select the rejoining time'
                  : null;
            },
          ),
          CommonField(
            title: 'Remark/Reason For Deactivation',
            hint: 'Eg: School Final Exam',
            maxLines: 2,
            contentPadding: EdgeInsets.zero,
            onChange: (value) {
              widget.remark(value);
            },
            validator: (value) {
              return value.toString().trim().isEmpty
                  ? 'please enter the reason'
                  : null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // method to get the date for [ rejoining date ]
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
      lastDate: DateTime(DateTime.now().year + 20),
    ).then((value) {
      if (value != null) {
        rejoining = value.toServerYMD();
        rejoiningController.text = value.toDateString();
        widget.rejoiningDate(rejoining!);
      }
    });
  }
}
