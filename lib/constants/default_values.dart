import 'dart:ui';

import 'package:part_app/constants/assets.dart';
import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/class_link/class_link_view.dart';
import 'package:part_app/view/class_link/trainer_app_class_link_view.dart';
import 'package:part_app/view/todays_classes/todays_classes.dart';
import 'package:part_app/view/trainer/trainer_app_trainer_salary_slips.dart';
import 'package:part_app/view/trainer/trainer_view.dart';

class DefaultValues {
  List<DropDownItem> paymentStatuses = [
    const DropDownItem(
      id: 'all',
      title: 'All',
      item: 'All',
    ),
    const DropDownItem(
      id: 'paid',
      title: 'Paid Completely',
      item: 'Paid Completely',
    ),
    const DropDownItem(
      id: 'pending',
      title: 'Not Paid',
      item: 'Not Paid',
    ),
    const DropDownItem(
      id: 'partial',
      title: 'Partially Paid',
      item: 'Partially Paid',
    ),
  ];
  List<DropDownItem> months = [
    const DropDownItem(
      id: null,
      title: 'All',
      item: 'All',
    ),
    const DropDownItem(
      id: 1,
      title: 'January',
      item: 'January',
    ),
    const DropDownItem(
      id: 2,
      title: 'February',
      item: 'February',
    ),
    const DropDownItem(
      id: 3,
      title: 'March',
      item: 'March',
    ),
    const DropDownItem(
      id: 4,
      title: 'April',
      item: 'April',
    ),
    const DropDownItem(
      id: 5,
      title: 'May',
      item: 'May',
    ),
    const DropDownItem(
      id: 6,
      title: 'June',
      item: 'June',
    ),
    const DropDownItem(
      id: 7,
      title: 'July',
      item: 'July',
    ),
    const DropDownItem(
      id: 8,
      title: 'August',
      item: 'August',
    ),
    const DropDownItem(
      id: 9,
      title: 'September',
      item: 'September',
    ),
    const DropDownItem(
      id: 10,
      title: 'October',
      item: 'October',
    ),
    const DropDownItem(
      id: 11,
      title: 'November',
      item: 'November',
    ),
    const DropDownItem(
      id: 12,
      title: 'December',
      item: 'December',
    ),
  ];
  List<DropDownItem> feeType = [
    const DropDownItem(
      id: 'all',
      title: 'All',
      item: 'All',
    ),
    const DropDownItem(
      id: 'monthly',
      title: 'Monthly',
      item: 'Monthly',
    ),
    const DropDownItem(
      id: 'class',
      title: 'Class based',
      item: 'Class based',
    ),
  ];
  List<DropDownItem> genders = [
    const DropDownItem(
      id: 'male',
      title: 'Male',
      item: 'Male',
    ),
    const DropDownItem(
      id: 'female',
      title: 'Female',
      item: 'Female',
    ),
    const DropDownItem(
      id: 'other',
      title: 'Other',
      item: 'Other',
    ),
  ];
  List<DropDownItem> batchStatus = [
    const DropDownItem(
      id: 'ongoing',
      title: 'Ongoing',
      item: 'Ongoing',
    ),
    // const DropDownItem(
    //   id: 'new',
    //   title: 'New',
    //   item: 'New',
    // ),
    const DropDownItem(
      id: 'completed',
      title: 'Completed',
      item: 'Completed',
    ),
  ];

  static List<DropDownItem> leadStatus = [
    const DropDownItem(
      id: 'new_lead',
      title: 'New Lead',
      item: 'new_lead',
    ),
    const DropDownItem(
      id: 'not_interested',
      title: 'Not Interested',
      item: 'not_interested',
    ),
    const DropDownItem(
      id: 'interested',
      title: 'Interested',
      item: 'interested',
    ),
    const DropDownItem(
      id: 'busy',
      title: 'Busy',
      item: 'busy',
    ),
    const DropDownItem(
      id: 'unanswered',
      title: 'Unanswered',
      item: 'unanswered',
    ),
    const DropDownItem(
      id: 'converted',
      title: 'Converted',
      item: 'converted',
    ),
  ];

  static List<DropDownItem> leadFollowUpStatus = [
    const DropDownItem(
      id: 'Pending',
      title: 'Pending',
      item: 'Pending',
    ),
    const DropDownItem(
      id: 'Completed',
      title: 'Completed',
      item: 'Completed',
    ),
  ];

  static const dashboardItems = [
    DashboardItem(
      title: 'Students',
      route: '/students',
      asset: Assets.students,
      color: Color(0xFFFC6767),
    ),
    DashboardItem(
      title: 'Attendance',
      route: '/attendance-batch-list',
      asset: Assets.attendance,
      color: Color(0xFF2B32B2),
    ),
    DashboardItem(
      title: 'Fees',
      route: '/fees',
      asset: Assets.fee,
      color: Color(0xFF1D976C),
    ),
    DashboardItem(
      title: 'Trainers',
      route: TrainerPage.route,
      asset: Assets.trainers,
      color: Color(0xFF8F94FB),
    ),
    DashboardItem(
      title: 'Today\'s Classes',
      route: TodaysClasses.route,
      asset: Assets.todays,
      color: Color(0xFFE100FF),
    ),
    DashboardItem(
      title: 'Class Link',
      route: ClassLinkView.route,
      asset: Assets.classLink,
      color: Color.fromARGB(255, 228, 50, 80),
    ),
    DashboardItem(
      title: 'Leads',
      route: '/leads',
      asset: Assets.leads,
      color: Color(0xFF6100FF),
    ),
    DashboardItem(
      title: 'Branches',
      route: '/branches',
      asset: Assets.branches,
      color: Color(0xFFFF8F00),
    ),
    DashboardItem(
      title: 'Batches',
      route: '/batches',
      asset: Assets.batches,
      color: Color(0xFFF7B733),
    ),
  ];

  static const managerDashboardItems = [
    DashboardItem(
      title: 'Students',
      route: '/manager-app-students',
      asset: Assets.students,
      color: Color(0xFFFC6767),
    ),
    DashboardItem(
      title: 'Attendance',
      route: '/manager-app-attendance-batch-list',
      asset: Assets.attendance,
      color: Color(0xFF2B32B2),
    ),
    DashboardItem(
      title: 'Fees',
      route: '/manager-app-fees',
      asset: Assets.fee,
      color: Color(0xFF1D976C),
    ),
    DashboardItem(
      title: 'Trainers',
      route: TrainerPage.route,
      asset: Assets.trainers,
      color: Color(0xFF8F94FB),
    ),
    DashboardItem(
      title: 'Today\'s Classes',
      route: TodaysClasses.route,
      asset: Assets.todays,
      color: Color(0xFFE100FF),
    ),
    DashboardItem(
      title: 'Class Link',
      route: ClassLinkView.route,
      asset: Assets.classLink,
      color: Color.fromARGB(255, 228, 50, 80),
    ),
    DashboardItem(
      title: 'Leads',
      route: '/manager-app-leads',
      asset: Assets.leads,
      color: Color(0xFF6100FF),
    ),
    DashboardItem(
      title: 'Branches',
      route: '/manager-app-branches',
      asset: Assets.branches,
      color: Color(0xFFFF8F00),
    ),
    DashboardItem(
      title: 'Batches',
      route: '/manager-app-batches',
      asset: Assets.batches,
      color: Color(0xFFF7B733),
    ),
  ];

  static const studentDashboardItems = [
    DashboardItem(
      title: 'Batches',
      route: '/student-app-batches',
      asset: Assets.batches,
      color: Color(0xFFF7B733),
    ),
    DashboardItem(
      title: 'Fees',
      route: '/student-app-fee-details',
      asset: Assets.fee,
      color: Color(0xFF1D976C),
    ),
    DashboardItem(
      title: 'Attendance',
      route: '/student-app-attendance-calender-view',
      asset: Assets.attendance,
      color: Color(0xFF2B32B2),
    ),
  ];

  static const trainerDashboardItems = [
    DashboardItem(
      title: 'Students',
      route: '/trainer-app-students',
      asset: Assets.students,
      color: Color(0xFFFC6767),
    ),
    DashboardItem(
      title: 'Fees',
      route: '/trainer-app-fees',
      asset: Assets.fee,
      color: Color(0xFF1D976C),
    ),
    DashboardItem(
      title: 'Attendance',
      route: '/trainer-app-attendance-batch-list',
      asset: Assets.attendance,
      color: Color(0xFF2B32B2),
    ),
    DashboardItem(
      title: 'Batches',
      route: '/trainer-app-batches',
      asset: Assets.batches,
      color: Color(0xFFF7B733),
    ),
    DashboardItem(
      title: 'Salary',
      route: TrainerAppTrainerSalarySlips.route,
      asset: Assets.fee,
      color: Color(0xFFF7B733),
    ),
    DashboardItem(
      title: 'Class Link',
      route: TrainerAppClassLinkView.route,
      asset: Assets.classLink,
      color: Color.fromARGB(255, 228, 50, 80),
    ),
    DashboardItem(
      title: 'Leads',
      route: '/leads-trainer',
      asset: Assets.leads,
      color: Color(0xFF6100FF),
    ),
  ];

  static const Map<int, dynamic> defaultTrainingDays = {
    0: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
  };
}
