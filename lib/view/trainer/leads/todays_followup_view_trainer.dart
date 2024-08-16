import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/trainer/leads/lead_details_trainer.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class TodayTrainerFollowView extends StatefulWidget {
  static const route = '/leads/followups-trainer';
  const TodayTrainerFollowView({super.key});

  @override
  State<TodayTrainerFollowView> createState() => _TodayTrainerFollowViewState();
}

class _TodayTrainerFollowViewState extends State<TodayTrainerFollowView> {
  @override
  void initState() {
    super.initState();
    AuthCubit? authCubit = context.read<AuthCubit>();
    int trainerId =
        authCubit.user?.trainerDetail?[authCubit.trainerIndex].id ?? 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LeadsCubit>().todayTrainerLeadsList(trainerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LeadsCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Today\'s Lead Followups'),
      body: BlocBuilder<LeadsCubit, LeadsState>(
        buildWhen: (prv, crr) => crr is FetchingLeads || crr is FetchedLeads,
        builder: (context, state) {
          if (cubit.leads.isEmpty) {
            return const Center(
              child: Text('No followups'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cubit.leads.length,
            itemBuilder: (context, index) {
              Lead? lead = cubit.leads[index];
              return GestureDetector(
                onTap: () {
                  cubit.selectedLead = lead;
                  Navigator.pushNamed(context, LeadTrainerDetails.route);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.liteDark,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${lead?.name ?? 'Not available'}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lead Status: ${lead?.leadStatus ?? 'Not available'}",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Assign to: ${lead?.assignedTo?.name ?? 'Not available'}",
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
