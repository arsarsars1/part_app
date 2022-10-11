import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/auth/components/resend_otp.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/membership/membership_success.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

class SalesManOTP extends StatefulWidget {
  static const route = '/membership/salesman-otp';

  const SalesManOTP({Key? key}) : super(key: key);

  @override
  State<SalesManOTP> createState() => _SalesManOTPState();
}

class _SalesManOTPState extends State<SalesManOTP> {
  String paymentCode = '';

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MembershipCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<MembershipCubit, MembershipState>(
        listener: (context, state) {
          if (state is MembershipSuccess) {
            Navigator.pushNamed(context, SubscriptionSuccess.route);
          } else if (state is MembershipFailed) {
            Alert(context).show(
              message: state.error ?? 'Membership creation failed!',
            );
          }
        },
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
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text:
                                    'Enter Salesman Payment code received on phone number'),
                            TextSpan(
                              text: ' ${cubit.salesManNumber}',
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
                  const SizedBox(
                    height: 64,
                  ),
                  CommonField(
                    textAlign: TextAlign.center,
                    letterSpacing: 4,
                    phoneField: true,
                    inputType: TextInputType.phone,
                    title: 'Enter Salesman Payment Code *',
                    hint: '- - - - - - ',
                    onChange: (value) {
                      paymentCode = value;
                      if (value.length >= 6) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
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
              child: Center(
                child: Button(
                  onTap: () {
                    context.read<MembershipCubit>().addMemberShip(
                          paymentCode: paymentCode,
                        );
                  },
                  title: 'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
