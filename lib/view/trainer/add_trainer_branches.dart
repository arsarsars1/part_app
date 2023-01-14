import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/view/branch/branch_details.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/components/text_switch_button.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/trainer_view.dart';
import 'package:part_app/view_model/cubits.dart';

class AddTrainerBranches extends StatefulWidget {
  static const route = '/trainer/select-branch';

  const AddTrainerBranches({Key? key}) : super(key: key);

  @override
  State<AddTrainerBranches> createState() => _AddTrainerBranchesState();
}

class _AddTrainerBranchesState extends State<AddTrainerBranches> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    var cubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Add Trainer Branches'),
      body: BlocListener<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is CreatingTrainer) {
            Loader(context, message: 'Please wait while we create the trainer.')
                .show();
          } else if (state is TrainerCreated) {
            if (!state.fromBranch) {
              Navigator.popUntil(
                context,
                ModalRoute.withName(TrainerPage.route),
              );
            } else {
              Navigator.popUntil(
                context,
                ModalRoute.withName(BranchDetails.route),
              );
            }
            Alert(context).show(message: 'Trainer added successfully.');
          } else if (state is CreatingTrainerFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: cubit.activeBranches.isNotEmpty
            ? Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: cubit.activeBranches.length,
                  itemBuilder: (context, index) {
                    Branch branch = cubit.activeBranches[index];
                    return BlocBuilder<TrainerCubit, TrainerState>(
                      buildWhen: (prv, crr) => crr is BranchesUpdated,
                      builder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.liteDark,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: TextSwitchButton(
                            onChange: (value) {
                              trainerCubit.updateBranchSelection(branch.id);
                            },
                            title: branch.branchName ?? 'N/A',
                            subTitle:
                                '${branch.district?.districtName}, ${branch.state?.stateName}',
                            selected: trainerCubit.selectedBranches.contains(
                              branch.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'No Active Branches present, '
                    '\nPlease Add/Activate a Branch and come back again.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (trainerCubit.selectedBranches.isEmpty) {
                  return;
                }
                TrainerRequest request = trainerCubit.request.copyWith(
                  branchId:
                      trainerCubit.selectedBranches.map((e) => '$e').toList(),
                );

                // update the data in cubit
                trainerCubit.updateRequest(
                  request,
                );

                // informs the cubit to create a trainer
                trainerCubit.createTrainer();
              },
              title: 'Create',
            ),
          ),
        ),
      ),
    );
  }
}
