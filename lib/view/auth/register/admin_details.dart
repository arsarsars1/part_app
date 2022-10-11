import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

class AdminDetails extends StatefulWidget {
  static const route = '/auth/admin-details';

  const AdminDetails({Key? key}) : super(key: key);

  @override
  State<AdminDetails> createState() => _WAValidationState();
}

class _WAValidationState extends State<AdminDetails> {
  String? name;
  String? email;
  String? dob;
  String? gender;
  TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Admin Details'),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ErrorFields) {}
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonField(
              title: 'Enter you name *',
              hint: 'Name',
              onChange: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Enter Email *',
              hint: 'Eg: contact@polestar.com',
              onChange: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              onTap: datePicker,
              disabled: true,
              controller: dobController,
              hint: 'dd/mm/yyyy',
              title: 'Date of Birth *',
              onChange: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Gender *',
              onChange: (value) {
                gender = value?.title;
              },
              hint: 'Select Gender',
              dropDown: true,
              dropDownItems: DefaultValues().genders,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (name == null ||
                    email == null ||
                    dob == null ||
                    gender == null) {
                  Alert(context).show(message: 'Error invalid input!');
                  return;
                }
                // update the data to the state
                context.read<AuthCubit>().adminDetails(
                      name,
                      email,
                      dob,
                      gender,
                    );
                // pushes the UI to enter academy details
                Navigator.pushNamed(context, AcademyDetails.route);
              },
              title: 'Continue',
            ),
          ),
        ),
      ),
    );
  }

  // method to get the date for [ dob ]
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
                primary: AppColors.primaryColor, // color of button's letters
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
      initialDate: DateTime(
        DateTime.now().year - 18,
      ),
      firstDate: DateTime(
        DateTime.now().year - 100,
      ),
      lastDate: DateTime(
        DateTime.now().year - 18,
      ),
    ).then((value) {
      if (value != null) {
        dob = value.toDateString();
        dobController.text = dob!;
      }
    });
  }
}
