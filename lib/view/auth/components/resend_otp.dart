import 'dart:async';

import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';

class ResendOtp extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtp({Key? key, required this.onResend}) : super(key: key);

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  Timer? timer;
  int secondsRemaining = 60;

  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startTimer() {
    secondsRemaining = 60;
    setState(() {
      enableResend = false;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
        timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!enableResend)
          Center(
            child: Text(
              'Didn’t get the otp? Retry in $secondsRemaining sec',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            if (enableResend) {
              widget.onResend();
              startTimer();
            }
          },
          child: Center(
            child: Text(
              'Resend OTP',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                    color: enableResend
                        ? AppColors.primaryColor
                        : AppColors.hintColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
