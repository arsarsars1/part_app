import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class BranchField extends StatefulWidget {
  final EdgeInsets? contentPaddingField;
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final String? title;
  final bool isMandatory;
  final bool clearInitial;
  final bool isDisable;

  const BranchField({
    super.key,
    required this.onSelect,
    this.initialBranch,
    this.contentPaddingField,
    this.title,
    this.isMandatory = true,
    this.isDisable = false,
    this.clearInitial = false,
  });

  @override
  State<BranchField> createState() => _BranchFieldState();
}

class _BranchFieldState extends State<BranchField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<BranchCubit>().getBranches();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        var branchCubit = context.read<BranchCubit>();
        if (state is BranchLoadingFailed || state is BranchesLoading) {
          return const SizedBox();
        } else {
          return CommonField(
            title: widget.title ?? 'Branch${widget.isMandatory ? " *" : ""}',
            hint: 'Select Branch',
            dropDown: true,
            disabled: widget.isDisable,
            defaultItem: widget.clearInitial
                ? null
                : branchCubit.initialBranch(
                    widget.initialBranch ?? branchCubit.firstBranch?.id,
                  ),
            contentPaddingField: widget.contentPaddingField,
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
        }
      },
    );
  }
}
