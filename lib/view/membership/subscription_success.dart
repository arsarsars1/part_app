// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/membership/components/continue_button.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

class SubscriptionSuccess extends StatelessWidget {
  static const route = '/membership/success';
  final bool academySuccess;

  const SubscriptionSuccess({super.key, required this.academySuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              width: 97.w,
              height: 97.h,
              child: Lottie.asset(
                Assets.successLottie,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: Text(
              /// The Platform condition check which is added below is added to remove the membership for ios
              /// This will be removed in the future
              academySuccess
                  ? Platform.isAndroid
                      ? 'Congratulations Your Academy Is Successfully Registered With PartApp.\n\n'
                          'Please continue to select a membership plan'
                      : 'Congratulations Your Academy Is Successfully Registered With PartApp.'
                  : 'Subscription Successful',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ContinueButton(
            onTap: () async {
              if (academySuccess) {
                /// The Platform condition check which is added below is added to remove the membership for ios
                /// This will be removed in the future
                if (Platform.isAndroid) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Membership.route,
                    (value) => false,
                  );
                  return;
                } else {
                  await context.read<MembershipCubit>().getMembership();
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    context.read<MembershipCubit>().selectedMembership =
                        context.read<MembershipCubit>().memberships.first;
                    log('${context.read<MembershipCubit>().selectedMembership?.paymentType}   ${context.read<MembershipCubit>().selectedMembership?.period}');
                    context
                        .read<MembershipCubit>()
                        .addMemberShip(paymentMethod: null);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SwitchAccount.route,
                      (value) => false,
                    );
                  });
                }
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SwitchAccount.route,
                  (value) => false,
                );
              }
            },
          ),
          SizedBox(
            height: 95.h,
          ),
        ],
      ),
    );
  }
}
