import 'package:flutter/material.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/attendance/attendance_calender_view.dart';
import 'package:part_app/view/attendance/attendance_add.dart';
import 'package:part_app/view/attendance/attendance_update.dart';
import 'package:part_app/view/attendance/student_app_attendence_view.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_add.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_batch_list.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_calender_view.dart';
import 'package:part_app/view/attendance/trainer_app_attendance_update.dart';
import 'package:part_app/view/attendance/trainer_app_monthly_attendance_view.dart';
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
import 'package:part_app/view/batch/student_app_batch_list.dart';
import 'package:part_app/view/batch/trainer_app_add_batch.dart';
import 'package:part_app/view/batch/trainer_app_batch_details.dart';
import 'package:part_app/view/batch/trainer_app_batch_list.dart';
import 'package:part_app/view/batch/trainer_app_cancel_batch_class.dart';
import 'package:part_app/view/batch/trainer_app_cancelled_batch_class.dart';
import 'package:part_app/view/batch/trainer_app_reschedule_class.dart';
import 'package:part_app/view/batch/trainer_app_rescheduled_classes.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/branch/branch_details.dart';
import 'package:part_app/view/branch/branch_list.dart';
import 'package:part_app/view/calender/calender_events.dart';
import 'package:part_app/view/calender/student_app_calender_events.dart';
import 'package:part_app/view/calender/trainer_app_calender_events.dart';
import 'package:part_app/view/class_link/class_link_list.dart';
import 'package:part_app/view/class_link/class_link_view.dart';
import 'package:part_app/view/class_link/edit_class_link.dart';
import 'package:part_app/view/class_link/trainer_app_class_link_list.dart';
import 'package:part_app/view/class_link/trainer_app_class_link_view.dart';
import 'package:part_app/view/class_link/trainer_app_edit_class_link.dart';
import 'package:part_app/view/fee/add_advance_fee.dart';
import 'package:part_app/view/fee/add_or_edit_admission_fees.dart';
import 'package:part_app/view/fee/add_or_edit_fees.dart';
import 'package:part_app/view/fee/fees_details_view.dart';
import 'package:part_app/view/fee/student_admission_fee_details.dart';
import 'package:part_app/view/fee/student_app_fee_details.dart';
import 'package:part_app/view/fee/student_fee_details.dart';
import 'package:part_app/view/fee/trainer_app_add_advance_fee.dart';
import 'package:part_app/view/fee/trainer_app_add_or_edit_fees.dart';
import 'package:part_app/view/fee/trainer_app_fees_details_view.dart';
import 'package:part_app/view/fee/trainer_app_student_fee_details.dart';
import 'package:part_app/view/home/components/account.dart';
import 'package:part_app/view/home/components/delete_account.dart';
import 'package:part_app/view/home/components/student_account.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/home/student_app_home.dart';
import 'package:part_app/view/home/trainer_app_home.dart';
import 'package:part_app/view/leads/add_lead.dart';
import 'package:part_app/view/leads/all_followups_view.dart';
import 'package:part_app/view/leads/edit_lead.dart';
import 'package:part_app/view/leads/lead_details.dart';
import 'package:part_app/view/leads/leads_view.dart';
import 'package:part_app/view/leads/todays_followup_view.dart';
import 'package:part_app/view/manager/add_manager.dart';
import 'package:part_app/view/manager/edit_manager.dart';
import 'package:part_app/view/manager/edit_salary.dart';
import 'package:part_app/view/manager/manager_branches.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view/manager/manager_page.dart';
import 'package:part_app/view/membership/current_membership.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view/membership/membership_home.dart';
import 'package:part_app/view/membership/membership_home_ios.dart';
import 'package:part_app/view/membership/salesman_otp.dart';
import 'package:part_app/view/membership/salesman_phone.dart';
import 'package:part_app/view/notifications/notification_screen.dart';
import 'package:part_app/view/notifications/student_app_notification_screen.dart';
import 'package:part_app/view/notifications/trainer_app_notification_screen.dart';
import 'package:part_app/view/profile/profile.dart';
import 'package:part_app/view/profile/trainer_app_profile.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view/students/add_student.dart';
// import 'package:part_app/view/students/add_student_by_student.dart';
import 'package:part_app/view/students/assign_batch.dart';
import 'package:part_app/view/students/assign_student_batch.dart';
import 'package:part_app/view/students/edit_assigned_batch.dart';
import 'package:part_app/view/students/edit_student.dart';
import 'package:part_app/view/students/edit_student_batches.dart';
import 'package:part_app/view/students/student_attendence.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view/students/students_view.dart';
import 'package:part_app/view/students/trainer_app_add_student.dart';
import 'package:part_app/view/students/trainer_app_assign_batch.dart';
import 'package:part_app/view/students/trainer_app_assign_student_batch.dart';
import 'package:part_app/view/students/trainer_app_edit_student_batches.dart';
import 'package:part_app/view/students/trainer_app_student_attendence.dart';
import 'package:part_app/view/students/trainer_app_student_details.dart';
import 'package:part_app/view/students/trainer_app_students_view.dart';
import 'package:part_app/view/todays_classes/todays_classes.dart';
import 'package:part_app/view/trainer/add_advance_salary.dart';
import 'package:part_app/view/trainer/add_or_edit_salary.dart';
import 'package:part_app/view/trainer/add_trainer.dart';
import 'package:part_app/view/trainer/add_trainer_branches.dart';
import 'package:part_app/view/trainer/assigned_batches.dart';
import 'package:part_app/view/trainer/edit_salary_trainer.dart';
import 'package:part_app/view/trainer/edit_trainer.dart';
import 'package:part_app/view/trainer/salary_details.dart';
import 'package:part_app/view/trainer/students_picker.dart';
import 'package:part_app/view/trainer/trainer_app_trainer_salary_slips.dart';
import 'package:part_app/view/trainer/trainer_branches.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view/trainer/trainer_salary_slips.dart';
import 'package:part_app/view/trainer/trainer_salary_slips_home.dart';
import 'package:part_app/view/trainer/trainer_view.dart';

import 'attendance/attendance_batch_list.dart';
import 'attendance/monthly_attendance_view.dart';
import 'membership/subscription_success.dart';
import 'profile/change_phone.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // if ((settings.name ?? '').contains('/join-batch')) {
    //   final token = (settings.name ?? '').split('/').last;
    //   return MaterialPageRoute(
    //     builder: (_) => AddStudentByStudent(
    //       token: token,
    //     ),
    //     settings: settings,
    //   );
    // }
    switch (settings.name) {
      case Home.route:
        return MaterialPageRoute(
          builder: (_) => const Home(),
          settings: settings,
        );
      case StudentAppHome.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppHome(),
          settings: settings,
        );
      case TrainerAppHome.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppHome(),
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
              otpRoute: settings.arguments as OTPRoutes,
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
      case MembershipHome.route:
        return MaterialPageRoute(
          builder: (_) => const MembershipHome(),
          settings: settings,
        );
      case MembershipHomeIos.route:
        return MaterialPageRoute(
          builder: (_) => const MembershipHomeIos(),
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
      case TrainerAppProfile.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppProfile(),
          settings: settings,
        );
      case Account.route:
        return MaterialPageRoute(
          builder: (_) => const Account(),
          settings: settings,
        );
      case StudentAccount.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAccount(),
          settings: settings,
        );
      case DeleteAccount.route:
        return MaterialPageRoute(
          builder: (_) => const DeleteAccount(),
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
      case StudentPicker.route:
        return MaterialPageRoute(
          builder: (_) => const StudentPicker(),
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
      case Leads.route:
        return MaterialPageRoute(
          builder: (_) => const Leads(),
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
      case TrainerAppBatchesPage.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppBatchesPage(),
          settings: settings,
        );
      case StudentAppBatchesPage.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppBatchesPage(),
          settings: settings,
        );
      case AddBatch.route:
        return MaterialPageRoute(
          builder: (_) => const AddBatch(),
          settings: settings,
        );
      case TrainerAppAddBatch.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAddBatch(),
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
      case TrainerAppBatchDetails.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppBatchDetails(),
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
      case TrainerAppRescheduledClasses.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppRescheduledClasses(),
          settings: settings,
        );
      case RescheduleClass.route:
        return MaterialPageRoute(
          builder: (_) => const RescheduleClass(),
          settings: settings,
        );
      case TrainerAppRescheduleClass.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppRescheduleClass(),
          settings: settings,
        );
      case CancelClass.route:
        return MaterialPageRoute(
          builder: (_) => const CancelClass(),
          settings: settings,
        );
      case TrainerAppCancelClass.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppCancelClass(),
          settings: settings,
        );
      case CancelledClasses.route:
        return MaterialPageRoute(
          builder: (_) => const CancelledClasses(),
          settings: settings,
        );
      case TrainerAppCancelledClasses.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppCancelledClasses(),
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
      case TrainerAppStudentsView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppStudentsView(),
          settings: settings,
        );
      case AddStudent.route:
        return MaterialPageRoute(
          builder: (_) => const AddStudent(),
          settings: settings,
        );
      case TrainerAppAddStudent.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAddStudent(),
          settings: settings,
        );
      case AssignBatch.route:
        return MaterialPageRoute(
          builder: (_) => AssignBatch(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case TrainerAppAssignBatch.route:
        return MaterialPageRoute(
          builder: (_) => TrainerAppAssignBatch(
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
      case TrainerAppAssignStudentBatch.route:
        return MaterialPageRoute(
          builder: (_) => TrainerAppAssignStudentBatch(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case StudentDetails.route:
        return MaterialPageRoute(
          builder: (_) => const StudentDetails(),
          settings: settings,
        );
      case TrainerAppStudentDetails.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppStudentDetails(),
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
      case TrainerAppEditStudentBatches.route:
        return MaterialPageRoute(
          builder: (_) => TrainerAppEditStudentBatches(
            editStudent: settings.arguments as bool,
          ),
          settings: settings,
        );
      case ClassLinkView.route:
        return MaterialPageRoute(
          builder: (_) => const ClassLinkView(),
          settings: settings,
        );
      case TrainerAppClassLinkView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppClassLinkView(),
          settings: settings,
        );
      case EditClassLink.route:
        return MaterialPageRoute(
          builder: (_) => const EditClassLink(),
          settings: settings,
        );
      case TrainerAppEditClassLink.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppEditClassLink(),
          settings: settings,
        );
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
      case TrainerAppClassLinkList.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppClassLinkList(),
          settings: settings,
        );
      case AddLead.route:
        return MaterialPageRoute(
          builder: (_) => const AddLead(),
          settings: settings,
        );
      case EditLead.route:
        return MaterialPageRoute(
          builder: (_) => const EditLead(),
          settings: settings,
        );
      case TodayFollowView.route:
        return MaterialPageRoute(
          builder: (_) => const TodayFollowView(),
          settings: settings,
        );
      case AllFollowUpView.route:
        return MaterialPageRoute(
          builder: (_) => const AllFollowUpView(),
          settings: settings,
        );
      case LeadDetails.route:
        return MaterialPageRoute(
          builder: (_) => const LeadDetails(),
          settings: settings,
        );
      case AttendanceBatchListPage.route:
        return MaterialPageRoute(
          builder: (_) => const AttendanceBatchListPage(),
          settings: settings,
        );
      case TrainerAppAttendanceBatchListPage.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAttendanceBatchListPage(),
          settings: settings,
        );
      case AttendanceCalenderView.route:
        return MaterialPageRoute(
          builder: (_) => const AttendanceCalenderView(),
          settings: settings,
        );
      case TrainerAppAttendanceCalenderView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAttendanceCalenderView(),
          settings: settings,
        );
      case AddAdvanceFeePage.route:
        return MaterialPageRoute(
          builder: (_) => const AddAdvanceFeePage(),
          settings: settings,
        );
      case TrainerAppAddAdvanceFeePage.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAddAdvanceFeePage(),
          settings: settings,
        );
      case AddAdvanceSalaryPage.route:
        return MaterialPageRoute(
          builder: (_) => const AddAdvanceSalaryPage(),
          settings: settings,
        );
      case StudentAttendanceCalenderView.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAttendanceCalenderView(),
          settings: settings,
        );
      case TrainerAppStudentAttendanceCalenderView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppStudentAttendanceCalenderView(),
          settings: settings,
        );
      case StudentAppAttendanceCalenderView.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppAttendanceCalenderView(),
          settings: settings,
        );
      case MonthlyAttendanceView.route:
        return MaterialPageRoute(
          builder: (_) => const MonthlyAttendanceView(),
          settings: settings,
        );
      case TrainerAppMonthlyAttendanceView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppMonthlyAttendanceView(),
          settings: settings,
        );
      case AttendanceUpdate.route:
        return MaterialPageRoute(
          builder: (_) => const AttendanceUpdate(),
          settings: settings,
        );
      case TrainerAppAttendanceUpdate.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAttendanceUpdate(),
          settings: settings,
        );
      case AttendanceAdd.route:
        return MaterialPageRoute(
          builder: (_) => const AttendanceAdd(),
          settings: settings,
        );
      case TrainerAppAttendanceAdd.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAttendanceAdd(),
          settings: settings,
        );
      case AddOrEditFees.route:
        return MaterialPageRoute(
          builder: (_) => const AddOrEditFees(),
          settings: settings,
        );
      case TrainerAppAddOrEditFees.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppAddOrEditFees(),
          settings: settings,
        );
      case AddOrEditAdmissionFees.route:
        return MaterialPageRoute(
          builder: (_) => const AddOrEditAdmissionFees(),
          settings: settings,
        );
      case TodaysClasses.route:
        return MaterialPageRoute(
          builder: (_) => const TodaysClasses(),
          settings: settings,
        );
      case FeesDetailsView.route:
        return MaterialPageRoute(
          builder: (_) => const FeesDetailsView(),
          settings: settings,
        );
      case TrainerAppFeesDetailsView.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppFeesDetailsView(),
          settings: settings,
        );
      case StudentFeeDetails.route:
        return MaterialPageRoute(
          builder: (_) => const StudentFeeDetails(),
          settings: settings,
        );
      case TrainerAppStudentFeeDetails.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppStudentFeeDetails(),
          settings: settings,
        );
      case StudentAppFeeDetails.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppFeeDetails(),
          settings: settings,
        );
      case StudentAdmissionFeeDetails.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAdmissionFeeDetails(),
          settings: settings,
        );
      case TrainerSalarySlips.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerSalarySlips(),
          settings: settings,
        );
      case TrainerAppTrainerSalarySlips.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppTrainerSalarySlips(),
          settings: settings,
        );
      case TrainerSalarySlipsHome.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerSalarySlipsHome(),
          settings: settings,
        );
      case AddOrEditSalary.route:
        return MaterialPageRoute(
          builder: (_) => const AddOrEditSalary(),
          settings: settings,
        );
      case CalenderEvent.route:
        return MaterialPageRoute(
          builder: (_) => const CalenderEvent(),
          settings: settings,
        );
      case TrainerAppCalenderEvent.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppCalenderEvent(),
          settings: settings,
        );
      case StudentAppCalenderEvent.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppCalenderEvent(),
          settings: settings,
        );
      case NotificationScreen.route:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
          settings: settings,
        );
      case TrainerAppNotificationScreen.route:
        return MaterialPageRoute(
          builder: (_) => const TrainerAppNotificationScreen(),
          settings: settings,
        );
      case StudentAppNotificationScreen.route:
        return MaterialPageRoute(
          builder: (_) => const StudentAppNotificationScreen(),
          settings: settings,
        );
      case CurrentMembership.route:
        return MaterialPageRoute(
          builder: (_) => const CurrentMembership(),
          settings: settings,
        );
      case ChangePhoneScreen.route:
        return MaterialPageRoute(
          builder: (_) => const ChangePhoneScreen(),
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
