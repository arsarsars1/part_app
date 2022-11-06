import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/view/components/checkbox.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/trainer_view.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class AddTrainerBranches extends StatefulWidget {
  static const route = '/trainer/select-branch';

  const AddTrainerBranches({Key? key}) : super(key: key);

  @override
  State<AddTrainerBranches> createState() => _AddTrainerBranchesState();
}

class _AddTrainerBranchesState extends State<AddTrainerBranches> {
  Set<String> selected = {};

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
            Navigator.popUntil(context, ModalRoute.withName(TrainerPage.route));
          } else if (state is CreatingTrainerFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.liteDark,
            borderRadius: BorderRadius.circular(4),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: cubit.branches.length,
            itemBuilder: (context, index) {
              Branch branch = cubit.branches[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextCheckBox(
                  onChange: (value) {
                    if (selected.contains(branch.id.toString())) {
                      selected.remove(branch.id.toString());
                    } else {
                      selected.add(branch.id.toString());
                    }
                  },
                  title: '${branch.branchName}',
                  selected: false,
                ),
              );
            },
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
                TrainerRequest request = trainerCubit.request.copyWith(
                  branchId: selected.toList(),
                );

                // update the data in cubit
                trainerCubit.updateRequest(
                  request,
                );

                // informs the cubit to create a trainer
                trainerCubit.createTrainer();
              },
              title: 'Continue',
            ),
          ),
        ),
      ),
    );
  }
}
