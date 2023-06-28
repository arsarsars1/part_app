import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';

class WriteOffFeesPopUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> reason;

  const WriteOffFeesPopUp(
      {Key? key, required this.formKey, required this.reason})
      : super(key: key);

  @override
  State<WriteOffFeesPopUp> createState() => WriteOffFeesPopUpState();
}

class WriteOffFeesPopUpState extends State<WriteOffFeesPopUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CommonField(
            title: 'Remark/Reason For Closing *',
            hint: 'Eg: School Final Exam',
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
}
