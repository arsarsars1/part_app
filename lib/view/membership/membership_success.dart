import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/membership/components/continue_button.dart';

class SubscriptionSuccess extends StatelessWidget {
  static const route = '/membership/success';

  const SubscriptionSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
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
          const Text(
            'Subscription Successful',
          ),
          const Spacer(),
          const ContinueButton(),
          SizedBox(
            height: 95.h,
          ),
        ],
      ),
    );
  }
}
