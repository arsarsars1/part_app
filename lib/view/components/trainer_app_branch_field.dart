import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppBranchField extends StatefulWidget {
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final String? title;
  final bool isDisable;

  const TrainerAppBranchField(
      {Key? key,
      required this.onSelect,
      this.initialBranch,
      this.title,
      this.isDisable = false})
      : super(key: key);

  @override
  State<TrainerAppBranchField> createState() => _TrainerAppBranchFieldState();
}

class _TrainerAppBranchFieldState extends State<TrainerAppBranchField> {
  AuthCubit? authCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authCubit = context.read<AuthCubit>();
      context.read<BranchCubit>().getBranchesForTrainer(
            trainerId: authCubit
                    ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        var branchCubit = context.read<BranchCubit>();
        if (state is BranchLoadingFailed) {
          return const SizedBox();
        }
        return CommonField(
          title: widget.title ?? 'Branch *',
          hint: 'Select Branch',
          dropDown: true,
          defaultItem: branchCubit.initialBranch(
            branchCubit.firstBranch?.id,
          ),
          disabled: widget.isDisable,
          dropDownItems: branchCubit.dropDownBranches(),
          onChange: (value) {
            if (widget.isDisable == false) {
              widget.onSelect(value.id);
            }
          },
          validator: (value) {
            if (value == null) {
              return 'Please select branch.';
            }
            return null;
          },
        );
      },
    );
  }
}
