import 'package:flutter/material.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/attendance/attendance_update.dart';
import 'package:part_app/view/auth/login/login.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/auth/register/add_branch_register.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/auth/register/sign_up.dart';
import 'package:part_app/view/auth/register/wa_validation.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/batch_list.dart';
import 'package:part_app/view/batch/cancel_batch_class.dart';
import 'package:part_app/view/batch/cancelled_batch_class.dart';
import 'package:part_app/view/batch/edit_batch_details.dart';
import 'package:part_app/view/batch/reschedule_class.dart';
import 'package:part_app/view/batch/rescheduled_classes.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/branch/branch_details.dart';
import 'package:part_app/view/branch/branch_list.dart';
import 'package:part_app/view/class_link/class_link_list.dart';
import 'package:part_app/view/class_link/class_link_view.dart';
import 'package:part_app/view/class_link/edit_class_link.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/leads/add_lead.dart';
import 'package:part_app/view/leads/lead_details.dart';
import 'package:part_app/view/leads/todays_view.dart';
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
import 'package:part_app/view/students/add_student.dart';
import 'package:part_app/view/students/assign_batch.dart';
import 'package:part_app/view/students/assign_student_batch.dart';
import 'package:part_app/view/students/edit_assigned_batch.dart';
import 'package:part_app/view/students/edit_student.dart';
import 'package:part_app/view/students/edit_student_batches.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view/students/students_view.dart';
import 'package:part_app/view/trainer/add_trainer.dart';
import 'package:part_app/view/trainer/add_trainer_branches.dart';
import 'package:part_app/view/trainer/assigned_batches.dart';
import 'package:part_app/view/trainer/edit_salary_trainer.dart';
import 'package:part_app/view/trainer/edit_trainer.dart';
import 'package:part_app/view/trainer/salary_details.dart';
import 'package:part_app/view/trainer/trainer_branches.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view/trainer/trainer_view.dart';

import 'attendance/attendance_batch_list.dart';
import 'attendance/monthly_attendance_view.dart';
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
      case AddTrainer.route:
        return MaterialPageRoute(
          builder: (_) => const AddTrainer(),
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
      case EditTrainer.route:
        return MaterialPageRoute(
          builder: (_) => const EditTrainer(),
          settings: settings,
        );
      case EditSalaryManager.route:
        return MaterialPageRoute(
          builder: (_) => const EditSalaryManager(),
          settings: settings,
        );
      case EditSalaryTrainer.route:
        return MaterialPageRoute(
          builder: (_) => const EditSalaryTrainer(),
          settings: settings,
        );
      case BatchesPage.route:
        return MaterialPageRoute(
          builder: (_) => const BatchesPage(),
          settings: settings,
        );
      case AddBatch.route:
        return MaterialPageRoute(
          builder: (_) => const AddBatch(),
          settings: settings,
        );
      case TrainerBranches.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerBranches(),
          settings: settings,
        );
      case BatchDetails.route:
        return MaterialPageRoute(
          builder: (_) => const BatchDetails(),
          settings: settings,
        );
      case AssignedBatches.route:
        return MaterialPageRoute(
          builder: (_) => const AssignedBatches(),
          settings: settings,
        );
      case EditBatchDetails.route:
        return MaterialPageRoute(
          builder: (_) => const EditBatchDetails(),
          settings: settings,
        );
      case RescheduledClasses.route:
        return MaterialPageRoute(
          builder: (_) => const RescheduledClasses(),
          settings: settings,
        );
      case RescheduleClass.route:
        return MaterialPageRoute(
          builder: (_) => const RescheduleClass(),
          settings: settings,
        );
      case CancelClass.route:
        return MaterialPageRoute(
          builder: (_) => const CancelClass(),
          settings: settings,
        );
      case CancelledClasses.route:
        return MaterialPageRoute(
          builder: (_) => const CancelledClasses(),
          settings: settings,
        );
      case ManagerDetails.route:
        return MaterialPageRoute(
          builder: (_) => ManagerDetails(
            managerId: settings.arguments as int,
          ),
          settings: settings,
        );
      case StudentsView.route:
        return MaterialPageRoute(
          builder: (_) => const StudentsView(),
          settings: settings,
        );
      case AddStudent.route:
        return MaterialPageRoute(
          builder: (_) => const AddStudent(),
          settings: settings,
        );
      case AssignBatch.route:
        return MaterialPageRoute(
          builder: (_) => AssignBatch(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case AssignStudentBatch.route:
        return MaterialPageRoute(
          builder: (_) => AssignStudentBatch(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case StudentDetails.route:
        return MaterialPageRoute(
          builder: (_) => const StudentDetails(),
          settings: settings,
        );
      case EditStudent.route:
        return MaterialPageRoute(
          builder: (_) => const EditStudent(),
          settings: settings,
        );
      case EditStudentBatches.route:
        return MaterialPageRoute(
          builder: (_) => EditStudentBatches(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case ClassLinkView.route:
        {
          return MaterialPageRoute(
            builder: (_) => const ClassLinkView(),
            settings: settings,
          );
        }
      case EditClassLink.route:
        {
          return MaterialPageRoute(
            builder: (_) => const EditClassLink(),
            settings: settings,
          );
        }
      case EditAssignedBatch.route:
        return MaterialPageRoute(
          builder: (_) => EditAssignedBatch(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case ClassLinkList.route:
        return MaterialPageRoute(
          builder: (_) => const ClassLinkList(),
          settings: settings,
        );
      case AddLead.route:
        return MaterialPageRoute(
          builder: (_) => const AddLead(),
          settings: settings,
        );
      case TodayFollowView.route:
        return MaterialPageRoute(
          builder: (_) => const TodayFollowView(),
          settings: settings,
        );
      case LeadDetails.route:
        return MaterialPageRoute(
          builder: (_) => const LeadDetails(),
          settings: settings,
        );
      case AttendancePage.route:
        return MaterialPageRoute(
          builder: (_) => const AttendancePage(),
          settings: settings,
        );
      case MonthlyAttendanceView.route:
        return MaterialPageRoute(
          builder: (_) => const MonthlyAttendanceView(),
          settings: settings,
        );
      case AttendanceUpdate.route:
        return MaterialPageRoute(
          builder: (_) => const AttendanceUpdate(),
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
