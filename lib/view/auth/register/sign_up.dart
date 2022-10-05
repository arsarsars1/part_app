import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class SignUp extends StatefulWidget {
  static const route = '/auth/signUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? phoneNo;
  Country? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // if the otp fails notifies the UI with an alert
          if (state is SendingOtpFailed && state.login) {
            Alert(context).show(message: state.message);
          }
          // if the OTP is sent show the User with the verification UI
          else if (state is OTPSent && !state.resend && !state.login) {
            Navigator.pushNamed(context, OTPVerify.route, arguments: false);
          }
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    Strings.signUpWelcomeMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              PhoneNumber(
                onCountryChange: (Country value) {
                  country = value;
                },
                onNumberChange: (String value) {
                  phoneNo = value;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.alreadyMember,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    Strings.login,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Button(
                onTap: () {
                  /// inform the cubit to validate the data
                  /// once the data is valid the cubit will call the api to
                  /// generate the OTP
                  context.read<AuthCubit>().generateOTP(
                        countryCode: country?.callingCode,
                        phoneNo: phoneNo,
                        login: false,
                      );
                },
                title: Strings.continueLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
