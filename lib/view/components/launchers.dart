import 'package:flutter/material.dart';
import 'package:part_app/view/components/action_icon.dart';
import 'package:part_app/view/components/launcher.dart';
import 'package:part_app/view/constants/constant.dart';

class Launchers extends StatelessWidget {
  final String phoneNo;
  final String whatsappNo;
  final String email;

  const Launchers(
      {Key? key,
      required this.phoneNo,
      required this.whatsappNo,
      required this.email})
      : super(key: key);

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
        ActionIcon(
          asset: Assets.whatsApp,
          color: const Color(0XFF00F260),
          onTap: () {
            Launcher.openWhatsapp(
                context: context, text: '', number: whatsappNo);
          },
        ),
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
