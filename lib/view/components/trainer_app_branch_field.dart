import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppBranchField extends StatefulWidget {
  final EdgeInsets? contentPaddingField;
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final bool isMandatory;
  final bool addAllItem;
  final String? title;
  final bool isDisable;
  final bool clearInitial;

  const TrainerAppBranchField({
    super.key,
    required this.onSelect,
    this.initialBranch,
    this.title,
    this.contentPaddingField,
    this.isMandatory = true,
    this.isDisable = false,
    this.clearInitial = false,
    this.addAllItem = false,
  });

  @override
  State<TrainerAppBranchField> createState() => _TrainerAppBranchFieldState();
}

class _TrainerAppBranchFieldState extends State<TrainerAppBranchField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AuthCubit? authCubit = context.read<AuthCubit>();
      await context.read<BranchCubit>().getBranchesForTrainer(
            trainerId:
                authCubit.user?.trainerDetail?[authCubit.trainerIndex].id ?? 0,
          );
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
            defaultItem: widget.clearInitial
                ? null
                : widget.initialBranch != null && widget.initialBranch == -1
                    ? const DropDownItem(
                        id: -1,
                        title: "All",
                      )
                    : (branchCubit.initialBranch(
                        widget.initialBranch ?? branchCubit.firstBranch?.id,
                      )),
            contentPaddingField: widget.contentPaddingField,
            disabled: widget.isDisable,
            dropDownItems: widget.addAllItem
                ? (branchCubit.dropDownBranches()
                  ..insert(
                      0,
                      const DropDownItem(
                        id: -1,
                        title: "All",
                      )))
                : branchCubit.dropDownBranches(),
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
