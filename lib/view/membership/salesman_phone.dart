import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/membership/salesman_otp.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

class SalesManPhone extends StatefulWidget {
  static const route = '/membership/salesman';

  const SalesManPhone({Key? key}) : super(key: key);

  @override
  State<SalesManPhone> createState() => _SalesManPhoneState();
}

class _SalesManPhoneState extends State<SalesManPhone> {
  String phoneNo = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'PartApp-Membership',
      ),
      body: BlocListener<MembershipCubit, MembershipState>(
        listener: (context, state) {
          if (state is SalesOTPSending) {
            Loader(context, message: 'Sending OTP..').show();
          }
          if (state is SalesOTPFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }

          if (state is SalesOTPSent) {
            Navigator.pop(context);
            if (!state.resend) {
              Navigator.pushNamed(context, SalesManOTP.route);
            }
            Alert(context).show(message: 'Salesman OTP sent.');
          }
        },
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 42.w),
                        child: Text(
                          'Enter Salesman Phone Number To Get Payment Code For In-Hand Payments ',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    CommonField(
                      phoneField: true,
                      length: 10,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter phone number';
                        } else if (value.toString().length < 10) {
                          return 'Invalid phone number';
                        }
                        return null;
                      },
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      title: 'Enter Salesman Phone Number *',
                      hint: 'Eg: +91 **********',
                      onChange: (value) {
                        phoneNo = value;
                        if (phoneNo.length >= 10) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SafeArea(
                  child: Center(
                    child: Button(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<MembershipCubit>()
                              .sendOTP(phoneNo: phoneNo);
                        }
                      },
                      title: 'Submit',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
