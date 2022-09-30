import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CommonField(
          title: Strings.country,
          dropDown: true,
        ),
        SizedBox(
          height: 20,
        ),
        CommonField(
          title: Strings.enterPhoneNo,
          hint: 'Eg: 9876543210',
        ),
      ],
    );
  }
}
