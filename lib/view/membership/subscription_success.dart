import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/membership/components/continue_button.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

class SubscriptionSuccess extends StatelessWidget {
  static const route = '/membership/success';
  final bool academySuccess;

  const SubscriptionSuccess({Key? key, required this.academySuccess})
      : super(key: key);

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
            onTap: () {
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
                  context.read<MembershipCubit>().getMembership();
                  Future.delayed(const Duration(seconds: 2)).then((value) {
                    context.read<MembershipCubit>().selectedMembership =
                        context.read<MembershipCubit>().memberships.first;
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
              }
              Navigator.pushNamedAndRemoveUntil(
                context,
                SwitchAccount.route,
                (value) => false,
              );
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
