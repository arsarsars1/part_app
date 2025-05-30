import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/auth/register/sign_up.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class Login extends StatefulWidget {
  static const route = '/auth/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? phoneNo;
  Country? country;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Logo(),
        centerTitle: false,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is NetworkError) {
            AlertBox.showErrorAlert(context);
          } else if (state is SendingOtp) {
            Loader(context, message: 'Please wait').show();
          }

          // if the otp fails notifies the UI with an alert
          if (state is SendingOtpFailed && state.login) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
            Navigator.pushReplacementNamed(context, SignUp.route);
          }
          // if the OTP is sent show the User with the verification UI
          else if (state is OTPSent && !state.resend && state.login) {
            Navigator.pop(context);
            Navigator.pushNamed(context, OTPVerify.route,
                arguments: OTPRoutes.login);
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
                  child: Text(
                    Strings.welcome,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    Strings.loginWelcomeMessage,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
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
                SizedBox(
                  height: 90.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, SignUp.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.notAMember,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        Strings.joinNow,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 64,
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
                width: 142.w,
                onTap: () {
                  /// inform the cubit to validate the data
                  /// once the data is valid the cubit will call the api to
                  /// generate the OTP
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().generateOTP(
                          countryCode: country?.callingCode,
                          phoneNo: phoneNo,
                          login: true,
                        );
                  }
                },
                title: Strings.login,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
