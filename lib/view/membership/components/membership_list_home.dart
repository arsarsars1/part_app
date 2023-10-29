import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class MembershipListHome extends StatefulWidget {
  const MembershipListHome({Key? key}) : super(key: key);

  @override
  State<MembershipListHome> createState() => _MembershipListHomeState();
}

class _MembershipListHomeState extends State<MembershipListHome> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MembershipCubit>();
    return BlocBuilder<MembershipCubit, MembershipState>(
      buildWhen: (prv, crr) => crr is MembershipLoaded,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: cubit.memberships.length,
            itemBuilder: (context, index) {
              Membership membership = cubit.memberships[index];
              if (membership.paymentType == "free") {
                return const SizedBox();
              }
              return InkWell(
                onTap: () {
                  cubit.selectedMembership = membership;
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cubit.selectedMembership?.id == membership.id
                        ? AppColors.primaryColor.withOpacity(0.35)
                        : AppColors.liteDark,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${membership.duration} ${membership.period}'),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Membership Plan',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register Upto ${membership.maxNoOfBranches} Branch(s)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Register Upto ${membership.maxNoOfStudents} students',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              if (membership.paymentType != 'free')
                                Text(
                                  '₹ ${membership.amount}/-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              Text(
                                membership.paymentType == 'free'
                                    ? 'Free'
                                    : '₹ ${membership.finalAmount}/-',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
