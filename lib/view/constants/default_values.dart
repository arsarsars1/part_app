import 'dart:ui';

import 'package:part_app/model/data_model/dashboard_item.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/manager/manager_page.dart';
import 'package:part_app/view/trainer/trainer_view.dart';

class DefaultValues {
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
      title: 'other',
      item: 'other',
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
      route: '/attendance',
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
      route: '/students',
      asset: Assets.todays,
      color: Color(0xFFE100FF),
    ),
    DashboardItem(
      title: 'Class Link',
      route: '/students',
      asset: Assets.todays,
      color: Color(0xFFE100FF),
    ),
    DashboardItem(
      title: 'Branch Manager',
      route: ManagerPage.route,
      asset: Assets.branchManager,
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
}
