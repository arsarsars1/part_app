import 'package:flutter/material.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/auth/login/login.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/auth/register/add_branch_register.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/auth/register/sign_up.dart';
import 'package:part_app/view/auth/register/wa_validation.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/branch/branch_details.dart';
import 'package:part_app/view/branch/branch_list.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/manager/add_manager.dart';
import 'package:part_app/view/manager/edit_manager.dart';
import 'package:part_app/view/manager/edit_salary.dart';
import 'package:part_app/view/manager/manager_branches.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view/manager/manager_page.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view/membership/salesman_otp.dart';
import 'package:part_app/view/membership/salesman_phone.dart';
import 'package:part_app/view/profile/profile.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view/trainer/add_edit_trainer.dart';
import 'package:part_app/view/trainer/add_trainer_branches.dart';
import 'package:part_app/view/trainer/salary_details.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view/trainer/trainer_view.dart';

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
      case AddBranchRegister.route:
        return MaterialPageRoute(
          builder: (_) => const AddBranchRegister(),
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
      case TrainerPage.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerPage(),
          settings: settings,
        );
      case BranchList.route:
        return MaterialPageRoute(
          builder: (_) => const BranchList(),
          settings: settings,
        );
      case BranchDetails.route:
        return MaterialPageRoute(
          builder: (_) => BranchDetails(
            id: settings.arguments as int,
          ),
          settings: settings,
        );
      case AddBranch.route:
        return MaterialPageRoute(
          builder: (_) => AddBranch(
            addBranch: settings.arguments as bool,
          ),
          settings: settings,
        );
      case TrainerDetails.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerDetails(),
          settings: settings,
        );
      case AddEditTrainer.route:
        return MaterialPageRoute(
          builder: (_) => const AddEditTrainer(),
          settings: settings,
        );
      case SalaryDetails.route:
        return MaterialPageRoute(
          builder: (_) => SalaryDetails(
            trainer: settings.arguments as bool,
          ),
          settings: settings,
        );
      case AddTrainerBranches.route:
        return MaterialPageRoute(
          builder: (_) => const AddTrainerBranches(),
          settings: settings,
        );
      case AddManager.route:
        return MaterialPageRoute(
          builder: (_) => const AddManager(),
          settings: settings,
        );
      case ManagerPage.route:
        return MaterialPageRoute(
          builder: (_) => const ManagerPage(),
          settings: settings,
        );
      case ManagerBranches.route:
        return MaterialPageRoute(
          builder: (_) => const ManagerBranches(),
          settings: settings,
        );
      case EditManager.route:
        return MaterialPageRoute(
          builder: (_) => const EditManager(),
          settings: settings,
        );
      case EditSalaryManager.route:
        return MaterialPageRoute(
          builder: (_) => const EditSalaryManager(),
          settings: settings,
        );
      case ManagerDetails.route:
        return MaterialPageRoute(
          builder: (_) => ManagerDetails(
            managerId: settings.arguments as int,
          ),
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
