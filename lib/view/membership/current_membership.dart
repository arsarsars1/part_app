import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/membership/membership_home.dart';
import 'package:part_app/view_model/cubits.dart';

class CurrentMembership extends StatelessWidget {
  static const route = '/current-membership';
  const CurrentMembership({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Membership',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 250.h,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.liteDark,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Membership Plan',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
                SizedBox(height: 10.h),
                !(cubit.user?.adminDetail?.academy?.validTillDate ??
                            DateTime.now())
                        .isBefore(DateTime.now())
                    ? Text(
                        'Valid till ${cubit.user?.adminDetail?.academy?.validTillDate?.toDDMMMYYY()}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                            ),
                      )
                    : Text(
                        'Expired',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                            ),
                      ),
                SizedBox(height: 10.h),
                Text(
                  '${cubit.user?.adminDetail?.academy?.membership?.duration} ${cubit.user?.adminDetail?.academy?.membership?.period}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Membership Plan',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 11,
                      ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register Upto ${cubit.user?.adminDetail?.academy?.membership?.maxNoOfBranches} Branch(s)',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Register Upto ${cubit.user?.adminDetail?.academy?.membership?.maxNoOfStudents} students',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        if (cubit.user?.adminDetail?.academy?.membership
                                ?.paymentType !=
                            'free')
                          Text(
                            '₹ ${cubit.user?.adminDetail?.academy?.membership?.amount}/-',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        Text(
                          cubit.user?.adminDetail?.academy?.membership
                                      ?.paymentType ==
                                  'free'
                              ? 'Free'
                              : '₹ ${cubit.user?.adminDetail?.academy?.membership?.finalAmount}/-',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // if (cubit.user?.adminDetail?.academy?.membership?.paymentType ==
                //     "online")
                //   Column(
                //     children: [
                //       Row(
                //         children: [
                //           Text(
                //             'Fully Paid Via: ',
                //             style:
                //                 Theme.of(context).textTheme.bodyLarge?.copyWith(
                //                       fontSize: 16,
                //                     ),
                //           ),
                //           Text(
                //             '${cubit.user?.adminDetail?.academy?.membership?.paymentType}',
                //             style:
                //                 Theme.of(context).textTheme.bodyLarge?.copyWith(
                //                       color: AppColors.primaryColor,
                //                       fontSize: 16,
                //                     ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 10.h),
                //     ],
                //   ),
                // Row(
                //   children: [
                //     Text(
                //       'Inhand Salesman: ',
                //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //             fontSize: 16,
                //           ),
                //     ),
                //     Text(
                //       '${cubit.user?.adminDetail?.academy?.membership?.paymentType}',
                //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //             color: AppColors.primaryColor,
                //             fontSize: 16,
                //           ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Button(
              height: 40.h,
              onTap: () {
                Navigator.pushNamed(context, MembershipHome.route);
              },
              title: 'Add Plan',
            ),
          ),
        ],
      ),
    );
  }
}
