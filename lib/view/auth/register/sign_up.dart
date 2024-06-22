import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/auth/components/terms_checkbox.dart';
import 'package:part_app/view/auth/login/login.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/components/components.dart';
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
  bool checked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        showLogo: true,
        title: '',
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendingRegisterOtp && !state.resend) {
            Loader(context, message: 'Please wait.').show();
          }
          // if the otp fails notifies the UI with an alert
          if (state is SendingOtpFailed && !state.login) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
          // if the OTP is sent show the User with the verification UI
          else if (state is OTPSent && !state.resend && !state.login) {
            Navigator.pop(context);
            Navigator.pushNamed(context, OTPVerify.route,
                arguments: OTPRoutes.registration);
          }
        },
        child: SafeArea(
          child: Form(
            key: formKey,
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                    if (value.length >= 10) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                TermsCheckBox(
                  onChange: (bool value) {
                    checked = value;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    Login.route,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.alreadyMember,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        Strings.loginNow,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 136.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  /// inform the cubit to validate the data
                  /// once the data is valid the cubit will call the api to
                  /// generate the OTP
                  if (formKey.currentState!.validate()) {
                    if (!checked) {
                      Alert(context).show(
                        message: 'Please accept the Terms & Conditions',
                      );

                      return;
                    }

                    if (phoneNo != null) {
                      context.read<AuthCubit>().generateOTP(
                            countryCode: country?.callingCode,
                            phoneNo: phoneNo,
                            login: false,
                          );
                    }
                  }
                },
                title: Strings.continueLabel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
