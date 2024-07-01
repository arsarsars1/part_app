import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

class WAValidation extends StatefulWidget {
  static const route = '/auth/wa-validation';

  const WAValidation({super.key});

  @override
  State<WAValidation> createState() => _WAValidationState();
}

class _WAValidationState extends State<WAValidation> {
  bool selected = false;
  String? waNumber;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Academy Admin Details',
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonField(
              fillColor: AppColors.disabledColor,
              disabled: true,
              textColor: Colors.black,
              title: 'Your Phone Number *',
              length: 10,
              onChange: (value) {},
              initialValue: context.read<AuthCubit>().phoneNumber,
              suffixIcon: const Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            WhatsappCheckButton(
              onChange: (bool value) {
                setState(() {
                  selected = value;
                });
              },
              onNumberChange: (String value) {
                waNumber = value;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 136.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (!selected) {
                    Navigator.pushNamed(context, AdminDetails.route);
                    context.read<AuthCubit>().updateWANumber(waNumber);
                  } else {
                    Navigator.pushNamed(context, AdminDetails.route);
                    context.read<AuthCubit>().updateWANumber(null);
                  }
                }
              },
              title: 'Continue',
            ),
          ),
        ),
      ),
    );
  }
}
