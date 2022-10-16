import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/auth/components/resend_otp.dart';
import 'package:part_app/view/auth/register/wa_validation.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

class OTPVerify extends StatefulWidget {
  static const route = '/auth/otp';

  final bool login;

  const OTPVerify({Key? key, required this.login}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  String? password;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBar(
        title: widget.login ? 'Login' : 'Academy Registration',
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticating) {
            Loader(context).show();
            return;
          }

          if (state is LoginFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
          if (state is SendingRegisterOtp && state.resend) {
            Loader(context).show();
            return;
          }
          if (state is OTPSent) {
            Navigator.pop(context);
            Alert(context).show(message: 'OTP sent!');
          }

          if (state is RegisterOTPFailed) {
            Alert(context).show(message: state.message);
          }
          if (state is LoginSuccess) {
            if (state.membershipActive) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                SwitchAccount.route,
                (route) => false,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Membership.route,
                (route) => false,
              );
            }
          }
          if (state is RegisterOTPValidated) {
            Navigator.pop(context);
            Navigator.pushNamed(context, WAValidation.route);
          }
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Enter 6 Digit OTP Sent To Your Phone',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    context.read<AuthCubit>().phoneNumber,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                SizedBox(
                  width: 175.w,
                  child: CommonField(
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please enter OTP!';
                      } else if (value.toString().length < 6) {
                        return 'Invalid OTP!';
                      }
                      return null;
                    },
                    crossAxisAlignment: CrossAxisAlignment.center,
                    title: 'OTP',
                    controller: controller,
                    onChange: (value) {
                      password = value;
                      if (value.length >= 6) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    letterSpacing: 8,
                    length: 6,
                    hint: '- - - - -',
                    textAlign: TextAlign.center,
                    inputType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ResendOtp(
                  onResend: () {
                    controller.clear();
                    context.read<AuthCubit>().generateOTP(
                          resend: true,
                          login: widget.login,
                        );
                  },
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
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (widget.login) {
                      context.read<AuthCubit>().login(password: password);
                    } else {
                      context
                          .read<AuthCubit>()
                          .validateRegisterOTP(otp: password);
                    }
                  }
                },
                title: 'Verify',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
