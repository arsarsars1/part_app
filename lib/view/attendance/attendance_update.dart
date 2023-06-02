import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/attendance/components/attendance_update_list_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceUpdate extends StatefulWidget {
  static const route = '/update_attendance';

  const AttendanceUpdate({Key? key}) : super(key: key);

  @override
  State<AttendanceUpdate> createState() => _AttendanceUpdateState();
}

class _AttendanceUpdateState extends State<AttendanceUpdate> {
  int? branchId;
  String? query;
  String? temp;
  DropDownItem? selectedItem;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;

  @override
  void initState() {
    super.initState();

    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().getActiveInactiveTrainers(active: true);
      context.read<BranchCubit>().getBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<TrainerCubit>();
    // var branchCubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Class Attendance',
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<BatchCubit, BatchState>(
              listener: (context, state) {},
              builder: (context, state) {
                batch = context.read<BatchCubit>().batchModel;
                if (state is FetchingBatch || state is UpdatingBatch) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is FetchBatchFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(20.h),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Text(
                        "${batch?.name}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            "Time: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            "${batch?.batchDetail?[0].startTime?.toAmPM()} - ${batch?.batchDetail?[0].endTime?.toAmPM()}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "${batch?.branchName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${batch?.courseName}, ${batch?.subjectName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Trainer - ${batch?.trainersString}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Monday',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                '14 August 2022',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 25.h),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(
                            '${batch?.days[index]}',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          );
                        },
                        itemCount: batch?.days.length ?? 0,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "Current Date - ${DateTime.now().toDateString()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Note : Select current date to take today's attendance of ${batch?.name}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView(
          //     shrinkWrap: true,
          //     children: [
          //       SizedBox(
          //         height: 20.h,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 34.0),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Batch1',
          //               style: Theme.of(context).textTheme.bodyText1?.copyWith(
          //                     color: AppColors.primaryColor,
          //                     fontSize: 16,
          //                   ),
          //             ),
          //             Row(
          //               children: [
          //                 Text(
          //                   'Time: ',
          //                   style:
          //                       Theme.of(context).textTheme.bodyText1?.copyWith(
          //                             color: AppColors.textColor,
          //                             fontSize: 14,
          //                           ),
          //                 ),
          //                 Text(
          //                   '9:00am - 10:00am',
          //                   style:
          //                       Theme.of(context).textTheme.bodyText1?.copyWith(
          //                             color: AppColors.primaryColor,
          //                             fontSize: 14,
          //                           ),
          //                 ),
          //               ],
          //             ),
          //             Text(
          //               'Branch Name',
          //               style: Theme.of(context).textTheme.bodyText1?.copyWith(
          //                     color: AppColors.textColor,
          //                     fontSize: 14,
          //                   ),
          //             ),
          //             Text(
          //               'Course, Subject',
          //               style: Theme.of(context).textTheme.bodyText1?.copyWith(
          //                     color: AppColors.textColor,
          //                     fontSize: 14,
          //                   ),
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Trainer - Vijay, Rahul',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1
          //                           ?.copyWith(
          //                             color: AppColors.primaryColor,
          //                             fontSize: 14,
          //                           ),
          //                     ),
          //                     Text(
          //                       'Attendance: 4/6',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1
          //                           ?.copyWith(
          //                             color: AppColors.textColor,
          //                             fontSize: 14,
          //                           ),
          //                     ),
          //                   ],
          //                 ),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Monday',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1
          //                           ?.copyWith(
          //                             color: AppColors.textColor,
          //                             fontSize: 16,
          //                           ),
          //                     ),
          //                     Text(
          //                       '14 August 2022',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1
          //                           ?.copyWith(
          //                             color: AppColors.textColor,
          //                             fontSize: 16,
          //                           ),
          //                     ),
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10.h,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 34.0),
          //         child: Text(
          //           'Note: You can update each students attendance from this page for the following batch on the selected date.',
          //           style: Theme.of(context).textTheme.bodyText1?.copyWith(
          //                 color: AppColors.textColor,
          //                 fontSize: 14,
          //               ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20.h,
          //       ),
          //       Column(
          //         children: [
          //           /*if (branchId == null)
          //             Column(
          //               children: [
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 16.0),
          //                   child: TabButton(
          //                     onChange: (String value) {
          //                       temp = value;
          //                       if (value == "Active Trainers") {
          //                         cubit.getActiveInactiveTrainers(
          //                             branchId: branchId, active: true);
          //                       } else {
          //                         cubit.getActiveInactiveTrainers(
          //                             branchId: branchId, clean: true);
          //                       }
          //                     },
          //                     options: const [
          //                       'Active Trainers',
          //                       'Inactive Trainers',
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 15.h,
          //                 ),
          //               ],
          //             ),*/
          //           BlocBuilder<TrainerCubit, TrainerState>(
          //             builder: (context, state) {
          //               if (state is FetchingTrainers) {
          //                 return const Padding(
          //                   padding: EdgeInsets.all(64.0),
          //                   child: Center(
          //                     child: CircularProgressIndicator(),
          //                   ),
          //                 );
          //               }
          //               if (state is TrainerCreated) {
          //                 context
          //                     .read<TrainerCubit>()
          //                     .getActiveInactiveTrainers(
          //                         branchId: branchId,
          //                         active:
          //                             temp == "Active Trainers" ? true : false);
          //               }
          //               // ignore: prefer_is_empty
          //               if (cubit.trainers?.length == 0) {
          //                 return Padding(
          //                   padding: const EdgeInsets.all(64.0),
          //                   child: Center(
          //                     child: Text(
          //                       query == null
          //                           ? selectedItem == null
          //                               ? 'Add a trainer to get started'
          //                               : 'No active trainers'
          //                           : 'Sorry, No Matching Results Found.',
          //                     ),
          //                   ),
          //                 );
          //               }
          //               return AttendanceUpdateListItem(
          //                 trainers: cubit.trainers ?? [],
          //                 onSelect: (Trainer trainer) async {
          //                   context.read<TrainerCubit>().getTrainerDetails(
          //                         trainerId: trainer.id,
          //                       );
          //                   await Navigator.pushNamed(
          //                       context, TrainerDetails.route);
          //                   // ignore: use_build_context_synchronously
          //                   context
          //                       .read<TrainerCubit>()
          //                       .getActiveInactiveTrainers(
          //                           branchId: branchId,
          //                           active: temp == "Active Trainers"
          //                               ? true
          //                               : false);
          //                 },
          //               );
          //             },
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
