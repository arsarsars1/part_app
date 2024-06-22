import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/add_trainer.dart';
import 'package:part_app/view/trainer/components/trainer_list.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';

class BranchDetails extends StatefulWidget {
  static const route = '/branch/details';
  final int id;

  const BranchDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  late BranchCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.getBranchById(id: '${widget.id}');
      cubit.getBranchTrainers(branchId: '${widget.id}', clean: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Details'),
      body: BlocListener<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is TrainerCreated && state.fromBranch) {
            cubit.getBranchTrainers(branchId: '${widget.id}');
          }
        },
        child: BlocBuilder<BranchCubit, BranchState>(
          buildWhen: (prv, crr) =>
              crr is BranchLoaded ||
              crr is BranchLoading ||
              crr is TrainersLoaded ||
              crr is BranchLoadingFailed,
          builder: (context, state) {
            Branch? branch = cubit.branch;
            List<Trainer>? trainers = cubit.trainers;
            if (state is BranchLoading) {
              return const LoadingView();
            }

            if (state is BranchLoadingFailed) {
              return const Offstage();
            }
            return ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(16.r),
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    branch?.branchName ?? '',
                                    maxLines: 10,
                                  ),
                                ),
                                Text(
                                  branch?.isActive == 1
                                      ? 'Active'
                                      : 'Deactivated',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 12.sp,
                                        color: branch?.isActive == 1
                                            ? Colors.white
                                            : AppColors.primaryColor,
                                      ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AddBranch.route,
                                arguments: false,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Address:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          '${branch?.address}, ${branch?.pincode}',
                          maxLines: 10,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        '${branch?.country?.name}, '
                        '${branch?.state?.stateName}, '
                        '${branch?.district?.districtName}',
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assigned Branch Manager:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                        width: double.infinity,
                      ),
                      Text(
                        branch?.managerDetail?.name ??
                            'No Branch Manager Allocated',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Text(
                    trainers != null && trainers.isNotEmpty
                        ? 'Assigned Trainers List'
                        : 'No Trainers Allocated',
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                trainers != null && trainers.isNotEmpty
                    ? TrainerList(
                        trainers: trainers,
                        onSelect: (Trainer value) {
                          context.read<TrainerCubit>().getTrainerDetails(
                                trainerId: value.id,
                              );
                          Navigator.pushNamed(context, TrainerDetails.route);
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: 125.w,
                          right: 125.w,
                          top: 16.h,
                        ),
                        child: Button(
                          height: UIConstants.buttonHeight,
                          width: 100,
                          onTap: () {
                            /// to handle the new trainer addition flow
                            context.read<TrainerCubit>().fromBranch = true;
                            context.read<TrainerCubit>().selectedBranches = [
                              branch!.id
                            ];

                            /// opens the add trainer view
                            Navigator.pushNamed(context, AddTrainer.route);
                          },
                          title: 'Add Trainer',
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
