import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> makePhoneCall(
      String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      Alert(context).show(message: 'Phone not available');
    }
  }

  static void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        Alert(context).show(message: "Whatsapp not installed");
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        Alert(context).show(message: "Whatsapp not installed");
      }
    }
  }

  static void openEmail({
    required BuildContext context,
    required String emailAddress,
  }) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    String url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Alert(context).show(message: "Email App not installed");
    }
  }

  static void openSMS({
    required BuildContext context,
    required String mobileNumber,
  }) async {
    // Android
    var uri = 'sms:$mobileNumber?body=';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await canLaunchUrl(Uri.parse(uri));
    } else {
      Alert(context).show(message: "SMS app not available.");
      // // iOS
      // const uri = 'sms:0039-222-060-888?body=hello%20there';
      // if (await canLaunchUrl(Uri.parse(uri))) {
      //   await canLaunchUrl(Uri.parse(uri));
      // } else {
      //
      // }
    }
  }
}
