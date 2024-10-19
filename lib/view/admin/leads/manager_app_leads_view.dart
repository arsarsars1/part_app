import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/admin/leads/manager_app_add_lead.dart';
import 'package:part_app/view/admin/leads/manager_app_all_followups_view.dart';
import 'package:part_app/view/admin/leads/manager_app_todays_followup_view.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class ManagerAppLeads extends StatefulWidget {
  static const route = '/manager-app-leads';
  const ManagerAppLeads({super.key});

  @override
  State<ManagerAppLeads> createState() => _ManagerAppLeadsState();
}

class _ManagerAppLeadsState extends State<ManagerAppLeads> {
  AuthCubit? authCubit;
  @override
  void initState() {
    var cubit = context.read<LeadsCubit>();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.getChartDataForManager(
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'ManagerAppLeads',
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(context, ManagerAppAddLead.route);
              if (context.mounted) {
                context.read<LeadsCubit>().getChartDataForManager(
                      managerId: authCubit
                              ?.user
                              ?.managerDetail?[authCubit?.managerIndex ?? 0]
                              .id ??
                          0,
                    );
              }
            },
            child: Container(
              margin: EdgeInsets.all(16.r),
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC6C6C6),
                    Color(0xFFffffff),
                    Color(0xFFffffff),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add New Lead',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Image.asset(Assets.newLeadImage),
                ],
              ),
            ),
          ),
          BlocListener<LeadsCubit, LeadsState>(
            listener: (context, state) {},
            child: BlocBuilder<LeadsCubit, LeadsState>(
              builder: (context, state) {
                var cubit = context.read<LeadsCubit>();
                return GestureDetector(
                  onTap: () async {
                    cubit.leads.clear();
                    await Navigator.pushNamed(context, ManagerAppTodayFollowView.route);
                    if (context.mounted) {
                      context.read<LeadsCubit>().getChartDataForManager(
                            managerId: authCubit
                                    ?.user
                                    ?.managerDetail?[
                                        authCubit?.managerIndex ?? 0]
                                    .id ??
                                0,
                          );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.r),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    height: 90.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC6C6C6),
                          Color(0xFFffffff),
                          Color(0xFFffffff),
                        ],
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Today\'s Follow Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                if (cubit.chartDataModel != null)
                                  Container(
                                    height: 18.r,
                                    width: 18.r,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryColor,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Center(
                                        child: Text(
                                          "${cubit.chartDataModel?.todaysFollowUp ?? ""}",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ]),
                          Image.asset(Assets.todayFollowUp),
                        ]),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              context.read<LeadsCubit>().leads.clear();
              await Navigator.pushNamed(context, ManagerAppAllFollowUpView.route);
              if (context.mounted) {
                context.read<LeadsCubit>().getChartDataForManager(
                      managerId: authCubit
                              ?.user
                              ?.managerDetail?[authCubit?.managerIndex ?? 0]
                              .id ??
                          0,
                    );
              }
            },
            child: Container(
              margin: EdgeInsets.all(16.r),
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC6C6C6),
                    Color(0xFFffffff),
                    Color(0xFFffffff),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All ManagerAppLeads',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Image.asset(Assets.allLeads),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Alert(context).show(message: 'Coming soon !!!');
            },
            child: Container(
              margin: EdgeInsets.all(16.r),
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC6C6C6),
                    Color(0xFFffffff),
                    Color(0xFFffffff),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tips & Ideas',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Image.asset(Assets.tipsIdeas),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
