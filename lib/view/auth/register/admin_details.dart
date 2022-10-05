import 'package:flutter/material.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';

class AdminDetails extends StatefulWidget {
  static const route = '/auth/admin-details';

  const AdminDetails({Key? key}) : super(key: key);

  @override
  State<AdminDetails> createState() => _WAValidationState();
}

class _WAValidationState extends State<AdminDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Admin Details'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonField(
                  title: 'Enter you name *',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Enter Email *',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  disabled: true,
                  title: 'Date of Birth *',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Gender *',
                  onChange: (value) {},
                  hint: 'Select Gender',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Button(
                onTap: () {
                  Navigator.pushNamed(context, AcademyDetails.route);
                },
                title: 'Continue',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
