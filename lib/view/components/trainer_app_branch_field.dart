import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppBranchField extends StatefulWidget {
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final bool isMandatory;
  final String? title;
  final bool isDisable;
  final bool clearInitial;

  const TrainerAppBranchField({
    super.key,
    required this.onSelect,
    this.initialBranch,
    this.title,
    this.isMandatory = true,
    this.isDisable = false,
    this.clearInitial = false,
  });

  @override
  State<TrainerAppBranchField> createState() => _TrainerAppBranchFieldState();
}

class _TrainerAppBranchFieldState extends State<TrainerAppBranchField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AuthCubit? authCubit = context.read<AuthCubit>();
      context.read<BranchCubit>().getBranchesForTrainer(
            trainerId:
                authCubit.user?.trainerDetail?[authCubit.trainerIndex].id ?? 0,
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
          title: widget.title ?? 'Branch${widget.isMandatory ? " *" : ""}',
          hint: 'Select Branch',
          dropDown: true,
          defaultItem: widget.clearInitial
              ? null
              : branchCubit.initialBranch(
                  branchCubit.firstBranch?.id,
                ),
          disabled: widget.isDisable,
          dropDownItems: branchCubit.dropDownBranches(),
          onChange: (value) {
            if (widget.isDisable == false) {
              widget.onSelect(value.id);
            }
          },
          validator: widget.isMandatory
              ? (value) {
                  if (value == null) {
                    return 'Please select branch.';
                  }
                  return null;
                }
              : null,
        );
      },
    );
  }
}
