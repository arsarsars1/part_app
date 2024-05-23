import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';

class CancelClassPopUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> reason;

  const CancelClassPopUp(
      {Key? key, required this.formKey, required this.reason})
      : super(key: key);

  @override
  State<CancelClassPopUp> createState() => _CancelClassPopUpState();
}

class _CancelClassPopUpState extends State<CancelClassPopUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CommonField(
            title: 'Remark/Reason For Cancellation *',
            hint: 'Eg: School Final Exam',
            maxLines: 2,
            contentPadding: EdgeInsets.zero,
            onChange: (value) {
              widget.reason(value);
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
}
