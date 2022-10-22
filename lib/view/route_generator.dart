import 'package:flutter/material.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/auth/login/login.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/auth/register/branch_details.dart';
import 'package:part_app/view/auth/register/sign_up.dart';
import 'package:part_app/view/auth/register/wa_validation.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view/membership/salesman_otp.dart';
import 'package:part_app/view/membership/salesman_phone.dart';
import 'package:part_app/view/profile/profile.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view/trainer/trainer.dart';

import 'membership/subscription_success.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.route:
        return MaterialPageRoute(
          builder: (_) => const Home(),
          settings: settings,
        );
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case Login.route:
        return MaterialPageRoute(
          builder: (_) => const Login(),
          settings: settings,
        );
      case OTPVerify.route:
        {
          return MaterialPageRoute(
            builder: (_) => OTPVerify(
              login: settings.arguments as bool,
            ),
            settings: settings,
          );
        }

      case SignUp.route:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
          settings: settings,
        );
      case WAValidation.route:
        return MaterialPageRoute(
          builder: (_) => const WAValidation(),
          settings: settings,
        );
      case AdminDetails.route:
        return MaterialPageRoute(
          builder: (_) => const AdminDetails(),
          settings: settings,
        );
      case AcademyDetails.route:
        return MaterialPageRoute(
          builder: (_) => const AcademyDetails(),
          settings: settings,
        );
      case BranchDetails.route:
        return MaterialPageRoute(
          builder: (_) => const BranchDetails(),
          settings: settings,
        );
      case Membership.route:
        return MaterialPageRoute(
          builder: (_) => const Membership(),
          settings: settings,
        );
      case SalesManPhone.route:
        return MaterialPageRoute(
          builder: (_) => const SalesManPhone(),
          settings: settings,
        );
      case SalesManOTP.route:
        return MaterialPageRoute(
          builder: (_) => const SalesManOTP(),
          settings: settings,
        );
      case SubscriptionSuccess.route:
        return MaterialPageRoute(
          builder: (_) => SubscriptionSuccess(
            academySuccess: settings.arguments as bool,
          ),
          settings: settings,
        );
      case SwitchAccount.route:
        return MaterialPageRoute(
          builder: (_) => const SwitchAccount(),
          settings: settings,
        );
      case Profile.route:
        return MaterialPageRoute(
          builder: (_) => const Profile(),
          settings: settings,
        );
      case Trainer.route:
        return MaterialPageRoute(
          builder: (_) => const Trainer(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Login(),
          settings: settings,
        );
    }
  }
}
