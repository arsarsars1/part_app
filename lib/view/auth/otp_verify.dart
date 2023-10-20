import 'package:flutter/material.dart';
import 'package:part_app/view/auth/components/resend_otp.dart';
import 'package:part_app/view/auth/register/wa_validation.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

import '../../model/data_model/enums.dart';
import '../../model/data_model/profile_update_request.dart';

enum OTPRoutes { login, registration, mobileNumberChange }

class OTPVerify extends StatefulWidget {
  static const route = '/auth/otp';

  final OTPRoutes otpRoute;

  const OTPVerify({Key? key, required this.otpRoute}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  String? password;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: CommonBar(title: () {
        if (widget.otpRoute == OTPRoutes.login) {
          return 'Login';
        } else if (widget.otpRoute == OTPRoutes.registration) {
          return 'Academy Registration';
        } else {
          return 'Verify OTP';
        }
      }()),
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
            Alert(context).show(message: 'OTP sent.');
          }

          if (state is RegisterOTPFailed) {
            Alert(context).show(message: state.message);
          }
          if (state is LoginSuccess) {
            if (state.user) {
              if (cubit.user?.adminDetail != null) {
                if (cubit.user?.adminDetail?.academy?.membershipId != null) {
                  cubit.navigateToDashboard(
                      cubit.user?.adminDetail?.academy,
                      cubit.user?.trainerDetail,
                      cubit.user?.studentDetail,
                      context);
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Membership.route,
                    (route) => false,
                  );
                }
              } else {
                cubit.navigateToDashboard(
                    cubit.user?.adminDetail?.academy,
                    cubit.user?.trainerDetail,
                    cubit.user?.studentDetail,
                    context);
              }
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    context.read<AuthCubit>().phoneNumber,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                SizedBox(
                  width: 185.w,
                  child: CommonField(
                    phoneField: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please enter OTP.';
                      } else if (value.toString().length < 6) {
                        return 'Invalid OTP.';
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
                    hint: '------',
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
                          login: widget.otpRoute == OTPRoutes.login,
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
                    if (widget.otpRoute == OTPRoutes.login) {
                      context.read<AuthCubit>().login(password: password);
                    } else if (widget.otpRoute == OTPRoutes.registration){
                      context
                          .read<AuthCubit>()
                          .validateRegisterOTP(otp: password);
                    } else {
                      ProfileUpdateRequest request = ProfileUpdateRequest(
                        mobileNo: cubit.phoneNumber.split(' ')[1],
                        countryCode: '91',
                      );
                      if (cubit.phoneNumber.isNotEmpty) {
                        cubit.updateProfile(
                            request,
                            cubit.accountType == AccountType.admin
                                ? null
                                : cubit.user?.studentDetail?[cubit.studentIndex]
                                    .id, password);
                      }
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
