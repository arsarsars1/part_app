import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/leads/lead_details.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class TodayFollowView extends StatefulWidget {
  static const route = '/leads/followups';

  const TodayFollowView({super.key});

  @override
  State<TodayFollowView> createState() => _TodayFollowViewState();
}

class _TodayFollowViewState extends State<TodayFollowView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LeadsCubit>().todayLeadsList();
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
                  Navigator.pushNamed(context, LeadDetails.route);
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
                              lead?.name ?? '',
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
                              lead?.leadStatus ?? '',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          lead?.assignedTo?.name ?? '',
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
