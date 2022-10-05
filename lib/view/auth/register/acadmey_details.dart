import 'package:flutter/material.dart';
import 'package:part_app/view/auth/register/branch_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';

class AcademyDetails extends StatefulWidget {
  static const route = '/auth/academy-details';

  const AcademyDetails({Key? key}) : super(key: key);

  @override
  State<AcademyDetails> createState() => _WAValidationState();
}

class _WAValidationState extends State<AcademyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Details'),
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
                  title: 'Enter Academy Name *',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Academy Type *',
                  onChange: (value) {},
                  hint: 'Select Academy Type',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Eg: Art, Martial Art, Edu...',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Button(
                onTap: () {
                  Navigator.pushNamed(context, BranchDetails.route);
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
