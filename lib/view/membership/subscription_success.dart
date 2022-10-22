import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/membership/components/continue_button.dart';
import 'package:part_app/view/membership/membership.dart';

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
              academySuccess
                  ? 'Congratulations Your Academy Is Successfully Registered With PartApp.\n\n'
                      'Please Select A Membership Plan To Continue'
                  : 'Subscription Successful',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ContinueButton(
            onTap: () {
              if (academySuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Membership.route,
                  (value) => false,
                );
                return;
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
