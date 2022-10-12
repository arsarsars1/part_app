import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/auth/register/sign_up.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/components/logo.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class Login extends StatefulWidget {
  static const route = '/auth/login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? phoneNo;
  Country? country;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CountryCubit>().getCountries();
    });
  }

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
          if (state is SendingOtp) {
            Loader(context, message: 'Please wait!').show();
          }

          // if the otp fails notifies the UI with an alert
          if (state is SendingOtpFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
          // if the OTP is sent show the User with the verification UI
          else if (state is OTPSent && !state.resend && state.login) {
            Navigator.pop(context);
            Navigator.pushNamed(context, OTPVerify.route, arguments: true);
          }
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  Strings.welcome,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  Strings.loginWelcomeMessage,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                  Navigator.pushNamed(context, SignUp.route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.notAMember,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      Strings.joinNow,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 136.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                width: 142.w,
                onTap: () {
                  if (phoneNo == null || phoneNo!.length < 10) {
                    Alert(context).show(
                      message: 'Please enter a valid phone number!',
                    );
                    return;
                  }

                  /// inform the cubit to validate the data
                  /// once the data is valid the cubit will call the api to
                  /// generate the OTP
                  context.read<AuthCubit>().generateOTP(
                        countryCode: country?.callingCode,
                        phoneNo: phoneNo,
                        login: true,
                      );
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
