import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/auth/components/resend_otp.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view_model/cubits.dart';

class OTPVerify extends StatefulWidget {
  static const route = '/auth/otp';

  const OTPVerify({Key? key}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Home.route,
              (route) => false,
            );
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Enter 6 digit OTP sent to your phone',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              Center(
                child: Text(
                  context.read<LoginCubit>().phoneNumber,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              Center(
                child: Text(
                  'OTP',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 4,
                      ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ResendOtp(
                onResend: () {
                  context.read<LoginCubit>().getLoginOTP(resend: true);
                },
              ),
              const SizedBox(
                height: 64,
              ),
              Button(
                onTap: () {
                  context.read<LoginCubit>().login(password: password);
                },
                title: 'Verify',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
