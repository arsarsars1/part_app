import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerBranches extends StatefulWidget {
  static const route = '/trainer/edit-branches';

  const TrainerBranches({Key? key}) : super(key: key);

  @override
  State<TrainerBranches> createState() => _TrainerBranchesState();
}

class _TrainerBranchesState extends State<TrainerBranches> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BranchCubit>();
    var trainerCubit = context.read<TrainerCubit>();
    Trainer? trainer = trainerCubit.trainer?.trainerDetail?[0];
    return Scaffold(
      appBar: const CommonBar(title: 'Allocate Trainers to Branches'),
      body: BlocListener<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is TrainerUpdated) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(TrainerDetails.route),
            );
            Alert(context).show(message: 'Trainer Updated successfully.');
          }
          if (state is UpdatingTrainerFailed) {
            Alert(context).show(message: state.message);
          }
        },
        child: BlocBuilder<BranchCubit, BranchState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(16),
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
                            if (!value) {
                              CommonDialog(
                                context: context,
                                message:
                                    'Do you want to remove ${trainer?.name} from ${branch.branchName}?',
                                onTap: () {
                                  trainerCubit.updateBranchSelection(branch.id);
                                  Navigator.pop(context);
                                },
                              ).show();
                            } else {
                              trainerCubit.updateBranchSelection(branch.id);
                            }
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
            );
          },
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
                  TrainerRequest request = const TrainerRequest(
                    branchId: "",
                  );
                  trainerCubit.updateTrainer(request);
                } else {
                  trainerCubit.updateTrainer(
                    TrainerRequest(
                      branchId: trainerCubit.selectedBranches
                          .map((e) => '$e')
                          .toList(),
                    ),
                  );
                }
              },
              title: 'Update',
            ),
          ),
        ),
      ),
    );
  }
}
