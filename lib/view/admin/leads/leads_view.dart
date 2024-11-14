import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/admin/leads/add_lead.dart';
import 'package:part_app/view/admin/leads/all_followups_view.dart';
import 'package:part_app/view/admin/leads/todays_followup_view.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class Leads extends StatefulWidget {
  static const route = '/leads';
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  void initState() {
    var cubit = context.read<LeadsCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.getChartData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Leads',
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(context, AddLead.route);
              if (context.mounted) {
                context.read<LeadsCubit>().getChartData();
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
                // if (state is CreatingLead) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                return GestureDetector(
                  onTap: () async {
                    cubit.leads.clear();
                    await Navigator.pushNamed(context, TodayFollowView.route);
                    if (context.mounted) {
                      context.read<LeadsCubit>().getChartData();
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
              await Navigator.pushNamed(context, AllFollowUpView.route);
              if (context.mounted) {
                context.read<LeadsCubit>().getChartData();
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
                    'All Leads',
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
