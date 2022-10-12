import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/auth/register/branch_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class AcademyDetails extends StatefulWidget {
  static const route = '/auth/academy-details';

  const AcademyDetails({Key? key}) : super(key: key);

  @override
  State<AcademyDetails> createState() => _WAValidationState();
}

class _WAValidationState extends State<AcademyDetails> {
  String? academyName;
  String? academyType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonField(
            length: 200,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            title: 'Enter Academy Name *',
            onChange: (value) {
              academyName = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Academy Type *',
            onChange: (value) {
              academyType = value?.title;
            },
            hint: 'Select Academy Type',
            dropDown: true,
            dropDownItems: context.read<CountryCubit>().academyTypes,
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
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  if (academyType == null ||
                      academyName == null ||
                      academyName!.isEmpty) {
                    Alert(context).show(message: 'Error invalid input');
                    return;
                  }
                  // update the data to the state
                  context
                      .read<AuthCubit>()
                      .academyDetails(academyName, academyType);
                  Navigator.pushNamed(context, BranchDetails.route);
                },
                title: 'Continue',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
