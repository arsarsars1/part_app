import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/calender/widgets/custom_container.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class CalenderEvent extends StatefulWidget {
  static const route = '/calender-event';
  const CalenderEvent({super.key});

  @override
  State<CalenderEvent> createState() => _CalenderEventState();
}

class _CalenderEventState extends State<CalenderEvent> {
  @override
  void initState() {
    var cubit = context.read<HomeCubit>();
    cubit.getCalenderEvents(date: cubit.selectedDate.toServerYMD());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Calender Quick View',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is GetCalenderEventsFailed) {
              Alert(context).show(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is GettingCalenderEvents) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          cubit.selectedDate.toEEEEDDMMYYY(),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.w),
                      CustomContainer(
                        widget: Row(
                          children: [
                            const Text('Today\'s Fee Payment:  '),
                            Text(
                              '₹${cubit.feePayments} /-',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 1,
                          width: 300,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                          color: AppColors.grey700,
                        ),
                      )
                    ],
                  ),
                  if ((cubit.trainerSalaryPayments ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Today\'s Salary Payment:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.trainerSalaryPayments?.length,
                            itemBuilder: (context, index) {
                              TrainerSalaryPayment? trainer =
                                  cubit.trainerSalaryPayments?[index];
                              return CustomContainer(
                                widget: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${trainer?.trainerSalarySlip?.trainerDetail?.name}'),
                                        SizedBox(height: 10.h),
                                        Text(
                                          'Paid:    ₹${trainer?.amount} /-',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.scheduledClasses ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Today\'s Batches:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.scheduledClasses?.length,
                          itemBuilder: (context, index) {
                            ScheduledClass? batch =
                                cubit.scheduledClasses?[index];
                            return CustomContainer(
                              widget: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${batch?.batchName}'),
                                      SizedBox(height: 10.h),
                                      Text(
                                        '${batch?.branchName}',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          const Text('Schduled For:  '),
                                          Text(
                                            '${batch?.startTime?.toAmPM()} - ${batch?.endTime?.toAmPM()}',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.rescheduledClasses ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Rescheduled Batches:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.rescheduledClasses?.length,
                          itemBuilder: (context, index) {
                            ScheduledClass? batch =
                                cubit.rescheduledClasses?[index];
                            return CustomContainer(
                              widget: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${batch?.batchName}'),
                                      SizedBox(height: 10.h),
                                      Text(
                                        '${batch?.branchName}',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          const Text('Schduled For:  '),
                                          Text(
                                            '${batch?.startTime?.toAmPM()} - ${batch?.endTime?.toAmPM()}',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.studentsJoined ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Students Joined:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.studentsJoined?.length,
                            itemBuilder: (context, index) {
                              StudentsJoined? student =
                                  cubit.studentsJoined?[index];
                              return CustomContainer(
                                widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${student?.name}'),
                                    if ((student?.batches ?? []).isNotEmpty)
                                      SizedBox(height: 10.h),
                                    SizedBox(
                                      height:
                                          (35 * (student?.batches ?? []).length)
                                              .toDouble(),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: student?.batches?.length,
                                        itemBuilder: (context, index) {
                                          StudentsJoinedBatch? batch =
                                              student?.batches?[index];
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.h),
                                            child: Text(
                                              '${batch?.branch?.branchName}, ${batch?.batchName}',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    // Text(
                                    //   '${student?.batches?[0].branch?.branchName}, ${student?.email}',
                                    //   style: TextStyle(
                                    //     color: AppColors.primaryColor,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              );
                            }),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.trainersJoined ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Trainers Joined:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.trainersJoined?.length,
                            itemBuilder: (context, index) {
                              TrainersJoined? trainer =
                                  cubit.trainersJoined?[index];
                              return CustomContainer(
                                widget: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${trainer?.name}'),
                                        SizedBox(height: 10.h),
                                        Text(
                                          '${trainer?.branches?[0].branchName}',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.followUpLeads ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Today\'s Followups:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.followUpLeads?.length,
                          itemBuilder: (context, index) {
                            Lead? lead = cubit.followUpLeads?[index];
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: lead?.followUps?.length,
                              itemBuilder: (context, subIndex) {
                                FollowUp? sublead = lead?.followUps?[subIndex];
                                return CustomContainer(
                                  widget: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${lead?.name}'),
                                          Text('${sublead?.followUpStatus}'),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Assigned To:  ',
                                              ),
                                              Text(
                                                '${lead?.assignedTo?.name}',
                                                style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${lead?.leadStatus}',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                  if ((cubit.newLeads ?? []).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('New Leads Added:  '),
                        SizedBox(height: 10.w),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.newLeads?.length,
                          itemBuilder: (context, index) {
                            Lead? lead = cubit.newLeads?[index];
                            return CustomContainer(
                              widget: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${lead?.name}'),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Assigned To:  ',
                                          ),
                                          Text(
                                            '${lead?.assignedTo?.name}',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${lead?.leadStatus}',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Center(
                          child: Container(
                            height: 1,
                            width: 300,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            color: AppColors.grey700,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
