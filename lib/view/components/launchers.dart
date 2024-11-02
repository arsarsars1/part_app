import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/action_icon.dart';
import 'package:part_app/view/components/launcher.dart';

class Launchers extends StatelessWidget {
  final String phoneNo;
  final String whatsappNo;
  final String email;

  const Launchers(
      {super.key,
      required this.phoneNo,
      required this.whatsappNo,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionIcon(
          asset: Assets.phone,
          color: const Color(0XFF0072FF),
          onTap: () {
            Launcher.makePhoneCall(phoneNo, context);
          },
        ),
        ActionIcon(
          asset: Assets.message,
          color: const Color(0XFFFFAC04),
          onTap: () {
            Launcher.openSMS(context: context, mobileNumber: phoneNo);
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            ActionIcon(
              asset: Assets.whatsApp,
              color: const Color(0XFF00F260),
              onTap: () {
                if (whatsappNo.isNotNullOrEmpty()) {
                  Launcher.openWhatsapp(
                      context: context, text: '', number: whatsappNo);
                }
              },
            ),
            if (whatsappNo.isNotNullOrEmpty() && whatsappNo == '+910')
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 30.w,
                height: 30.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.6),
                ),
              )
          ],
        ),
        if (email.isNotNullOrEmpty() && email != 'null')
          ActionIcon(
            asset: Assets.email,
            color: const Color(0XFFE56667),
            onTap: () {
              Launcher.openEmail(context: context, emailAddress: email);
            },
          ),
      ],
    );
  }
}
