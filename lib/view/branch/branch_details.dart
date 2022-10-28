import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/components/trainer_list.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';

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
      cubit.getTrainers(branchId: '${widget.id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Details'),
      body: BlocBuilder<BranchCubit, BranchState>(
        buildWhen: (prv, crr) =>
            crr is BranchLoaded ||
            crr is BranchLoading ||
            crr is TrainersLoaded,
        builder: (context, state) {
          Branch? branch = cubit.branch;
          List<Trainer>? trainers = cubit.trainers;
          if (state is BranchLoading) {
            return const LoadingView();
          }
          return Column(
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
                        Text(branch?.branchName ?? ''),
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
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${branch?.address}, ${branch?.pincode}',
                    ),
                    SizedBox(
                      height: 16.h,
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
                      'Assigned Branch Manager',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                      width: double.infinity,
                    ),
                    Text(
                      branch?.managerDetail?.user?.name ?? 'NA',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Text(
                'Assigned Trainers List',
              ),
              SizedBox(
                height: 16.h,
              ),
              if (trainers != null)
                TrainerList(
                  trainers: trainers,
                ),
            ],
          );
        },
      ),
    );
  }
}
