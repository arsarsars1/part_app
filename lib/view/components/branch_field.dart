import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class BranchField extends StatefulWidget {
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final String? title;
  final bool isMandatory;
  final bool isDisable;

  const BranchField({
    super.key,
    required this.onSelect,
    this.initialBranch,
    this.title,
    this.isMandatory = true,
    this.isDisable = false,
  });

  @override
  State<BranchField> createState() => _BranchFieldState();
}

class _BranchFieldState extends State<BranchField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
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
          title: widget.title ?? 'Branch ${widget.isMandatory ? "*" : ""}',
          hint: 'Select Branch',
          dropDown: true,
          disabled: widget.isDisable,
          defaultItem: branchCubit.initialBranch(
            branchCubit.firstBranch?.id,
          ),
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
