import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/leads/add_lead_trainer.dart';
import 'package:part_app/view/trainer/leads/all_followups_view_trainer.dart';
import 'package:part_app/view/trainer/leads/todays_followup_view_trainer.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadsViewTrainer extends StatefulWidget {
  static const route = '/leads-trainer';
  const LeadsViewTrainer({super.key});

  @override
  State<LeadsViewTrainer> createState() => _LeadsViewTrainerState();
}

class _LeadsViewTrainerState extends State<LeadsViewTrainer> {
  @override
  void initState() {
    var cubit = context.read<LeadsCubit>();
    AuthCubit? authCubit = context.read<AuthCubit>();
    int trainerId =
        authCubit.user?.trainerDetail?[authCubit.trainerIndex].id ?? 0;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.getChartData(trainerId: trainerId);
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
          // const SizedBox(
          //   height: 0,
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: Text('Total Enquiries : 100'),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          //   height: 275,
          //   child: Stack(
          //     children: [
          //       BarChart(
          //         BarChartData(
          //           titlesData: FlTitlesData(show: false),
          //           alignment: BarChartAlignment.start,
          //           barTouchData: BarTouchData(
          //             enabled: false,
          //             touchTooltipData: BarTouchTooltipData(
          //               tooltipBgColor: Colors.transparent,
          //               tooltipPadding: EdgeInsets.zero,
          //               tooltipMargin: 8,
          //               getTooltipItem: (
          //                 BarChartGroupData group,
          //                 int groupIndex,
          //                 BarChartRodData rod,
          //                 int rodIndex,
          //               ) {
          //                 return BarTooltipItem(
          //                   rod.toY.round().toString(),
          //                   const TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 );
          //               },
          //             ),
          //           ),
          //           gridData: FlGridData(
          //             show: false,
          //           ),
          //           barGroups: [
          //             BarChartGroupData(
          //               showingTooltipIndicators: [0, 1, 2, 3],
          //               x: 0,
          //               barsSpace: 35,
          //               barRods: [
          //                 BarChartRodData(
          //                   toY: 50,
          //                   borderRadius: BorderRadius.zero,
          //                   width: 35,
          //                   color: Colors.orange,
          //                 ),
          //                 BarChartRodData(
          //                   toY: 25,
          //                   borderRadius: BorderRadius.zero,
          //                   width: 35,
          //                   color: Colors.yellow,
          //                 ),
          //                 BarChartRodData(
          //                   toY: 10,
          //                   borderRadius: BorderRadius.zero,
          //                   width: 35,
          //                   color: Colors.green,
          //                 ),
          //                 BarChartRodData(
          //                   toY: 15,
          //                   borderRadius: BorderRadius.zero,
          //                   width: 35,
          //                   color: Colors.blueGrey,
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         swapAnimationDuration: const Duration(
          //           milliseconds: 150,
          //         ), // Optional
          //         swapAnimationCurve: Curves.linear, // Optional
          //       ),
          //       Align(
          //         alignment: Alignment.topRight,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 4),
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Container(
          //                     height: 14,
          //                     width: 14,
          //                     color: Colors.orange,
          //                   ),
          //                   const SizedBox(
          //                     width: 8,
          //                   ),
          //                   const Text('Lead')
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 4),
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Container(
          //                     height: 14,
          //                     width: 14,
          //                     color: Colors.yellow,
          //                   ),
          //                   const SizedBox(
          //                     width: 8,
          //                   ),
          //                   const Text('Interested')
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 4),
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Container(
          //                     height: 14,
          //                     width: 14,
          //                     color: Colors.green,
          //                   ),
          //                   const SizedBox(
          //                     width: 8,
          //                   ),
          //                   const Text('Converted')
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 4),
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Container(
          //                     height: 14,
          //                     width: 14,
          //                     color: Colors.blueGrey,
          //                   ),
          //                   const SizedBox(
          //                     width: 8,
          //                   ),
          //                   const Text('Not Interested')
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AddTrainerLead.route),
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
                  onTap: () {
                    cubit.leads.clear();
                    Navigator.pushNamed(context, TodayTrainerFollowView.route);
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
                                if (cubit.chartDataModel != null &&
                                    cubit.chartDataModel?.todaysFollowUp != 0)
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
                                                fontSize: 14,
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
            onTap: () {
              context.read<LeadsCubit>().leads.clear();
              Navigator.pushNamed(context, AllTrainerFollowUpView.route);
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
