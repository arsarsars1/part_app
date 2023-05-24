import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
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
    var cubit = context.read<TrainerCubit>();
    var branchCubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Class Attendance',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<BranchCubit, BranchState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Branch',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownButtonFormField<DropDownItem>(
                            dropdownColor: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            value: selectedItem ?? const DropDownItem(id: -1),
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: const DropDownItem(id: -1),
                                child: Text(
                                  'All',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              ...branchCubit.dropDownBranches().map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.title ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                );
                              }).toList()
                            ],
                            onChanged: (value) {
                              if (value?.id == -1) {
                                setState(() {
                                  branchId = null;
                                  selectedItem = value;
                                  if (query != null) {
                                    cubit.searchTrainers(branchId,
                                        query: query);
                                  } else {
                                    cubit.getActiveInactiveTrainers(
                                        active: true);
                                  }
                                });
                              } else {
                                branchId = value?.id;
                                selectedItem = value;
                                setState(() {
                                  cubit.getActiveInactiveTrainers(
                                      branchId: branchId, active: true);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Batch1',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time: ',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                          ),
                          Text(
                            '9:00am - 10:00am',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        'Branch Name',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        'Course, Subject',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trainer - Vijay, Rahul',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 14,
                                    ),
                              ),
                              Text(
                                'Attendance: 4/6',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: Text(
                    'Note: You can update each students attendance from this page for the following batch on the selected date.',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 14,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    /*if (branchId == null)
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TabButton(
                              onChange: (String value) {
                                temp = value;
                                if (value == "Active Trainers") {
                                  cubit.getActiveInactiveTrainers(
                                      branchId: branchId, active: true);
                                } else {
                                  cubit.getActiveInactiveTrainers(
                                      branchId: branchId, clean: true);
                                }
                              },
                              options: const [
                                'Active Trainers',
                                'Inactive Trainers',
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),*/
                    BlocBuilder<TrainerCubit, TrainerState>(
                      builder: (context, state) {
                        if (state is FetchingTrainers) {
                          return const Padding(
                            padding: EdgeInsets.all(64.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (state is TrainerCreated) {
                          context
                              .read<TrainerCubit>()
                              .getActiveInactiveTrainers(
                                  branchId: branchId,
                                  active:
                                      temp == "Active Trainers" ? true : false);
                        }
                        // ignore: prefer_is_empty
                        if (cubit.trainers?.length == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(64.0),
                            child: Center(
                              child: Text(
                                query == null
                                    ? selectedItem == null
                                        ? 'Add a trainer to get started'
                                        : 'No active trainers'
                                    : 'Sorry, No Matching Results Found.',
                              ),
                            ),
                          );
                        }
                        return AttendanceUpdateListItem(
                          trainers: cubit.trainers ?? [],
                          onSelect: (Trainer trainer) async {
                            context.read<TrainerCubit>().getTrainerDetails(
                                  trainerId: trainer.id,
                                );
                            await Navigator.pushNamed(
                                context, TrainerDetails.route);
                            // ignore: use_build_context_synchronously
                            context
                                .read<TrainerCubit>()
                                .getActiveInactiveTrainers(
                                    branchId: branchId,
                                    active: temp == "Active Trainers"
                                        ? true
                                        : false);
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
