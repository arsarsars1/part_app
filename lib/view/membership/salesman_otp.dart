import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/auth/components/resend_otp.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/membership/subscription_success.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

class SalesManOTP extends StatefulWidget {
  static const route = '/membership/salesman-otp';

  const SalesManOTP({Key? key}) : super(key: key);

  @override
  State<SalesManOTP> createState() => _SalesManOTPState();
}

class _SalesManOTPState extends State<SalesManOTP> {
  String paymentCode = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MembershipCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'PartApp-Membership',
      ),
      body: BlocListener<MembershipCubit, MembershipState>(
        listener: (context, state) {
          if (state is MembershipSuccess) {
            Navigator.pushNamed(
              context,
              SubscriptionSuccess.route,
              arguments: false,
            );
          } else if (state is MembershipFailed) {
            Alert(context).show(
              message: state.error ?? 'Membership creation failed',
            );
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
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text:
                                    'Enter Salesman Payment Code received On Phone Number',
                              ),
                              TextSpan(
                                text: ' +91${cubit.salesManNumber}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                              const TextSpan(
                                text: ' for In-hand payment',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CommonField(
                        textAlign: TextAlign.center,
                        letterSpacing: 8,
                        phoneField: true,
                        inputType: TextInputType.phone,
                        title: 'Enter Salesman Payment Code *',
                        hint: '------',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return 'Please enter code';
                          } else if (value.toString().length < 6) {
                            return 'Invalid code';
                          }
                          return null;
                        },
                        onChange: (value) {
                          paymentCode = value;
                          if (value.length >= 6) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ResendOtp(
                      onResend: () {
                        context.read<MembershipCubit>().sendOTP(resend: true);
                      },
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
                          context.read<MembershipCubit>().addMemberShip(
                                paymentCode: paymentCode,
                              );
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
