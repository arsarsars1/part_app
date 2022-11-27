import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class BranchField extends StatefulWidget {
  final ValueChanged<int?> onSelect;
  final int? initialBranch;

  const BranchField({Key? key, required this.onSelect, this.initialBranch})
      : super(key: key);

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
        return CommonField(
          title: 'Branch *',
          hint: 'Select Branch',
          dropDown: true,
          defaultItem: branchCubit.initialBranch(
            widget.initialBranch,
          ),
          dropDownItems: branchCubit.dropDownBranches(),
          onChange: (value) {
            widget.onSelect(value.id);
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
