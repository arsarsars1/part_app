// import 'package:flutter/material.dart';
// import 'package:part_app/view/components/components.dart';
//
// class UpiField extends StatefulWidget {
//   final ValueChanged<String> onChange;
//   const UpiField({Key? key, required this.onChange}) : super(key: key);
//
//   @override
//   State<UpiField> createState() => _UpiFieldState();
// }
//
// class _UpiFieldState extends State<UpiField> {
//   final _focusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       print("Has focus: ${_focusNode.hasFocus}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CommonField(
//       node: _focusNode,
//       title: 'UPI ID',
//       hint: 'Enter UPI Id',
//       maxLines: 1,
//       length: 50,
//       textInputAction: TextInputAction.next,
//       onChange: (value) {
//         upiId = value;
//       },
//       validator: (value) {
//         // return value == null || value.toString().isEmpty
//         //     ? 'Please enter trainer name.'
//         //     : null;
//       },
//     );
//   }
// }
