import 'package:flutter/material.dart';
import 'package:part_app/view/auth/register/add_branch_register.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class AcademyDetails extends StatefulWidget {
  static const route = '/auth/academy-details';

  const AcademyDetails({super.key});

  @override
  State<AcademyDetails> createState() => _WAValidationState();
}

class _WAValidationState extends State<AcademyDetails> {
  String? academyName;
  String? academyType;
  int? academyTypeId;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Academy Details',
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonField(
              length: 100,
              textInputAction: TextInputAction.done,
              capitalization: TextCapitalization.words,
              maxLines: 1,
              title: 'Enter Academy Name *',
              hint: 'Eg: Polestar',
              onChange: (value) {
                academyName = value;
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return 'Please enter academy name.';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Academy Type *',
              onChange: (value) {
                academyType = value?.title;
                academyTypeId = value?.id;
              },
              hint: 'Select Academy Type',
              dropDown: true,
              dropDownItems: context.read<CountryCubit>().academyTypes,
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return 'Please select academy type.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // update the data to the state
                    context.read<AuthCubit>().academyDetails(
                          academyName,
                          academyTypeId,
                        );
                    Navigator.pushNamed(context, AddBranchRegister.route);
                  }
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
