import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppBranchField extends StatefulWidget {
  final ValueChanged<int?> onSelect;
  final int? initialBranch;
  final String? title;

  const StudentAppBranchField(
      {Key? key, required this.onSelect, this.initialBranch, this.title})
      : super(key: key);

  @override
  State<StudentAppBranchField> createState() => _StudentAppBranchFieldState();
}

class _StudentAppBranchFieldState extends State<StudentAppBranchField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getStudentAppBranches(
          studentId: context
              .read<AuthCubit>()
              .user
              ?.studentDetail?[context.read<AuthCubit>().studentIndex]
              .id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        var branchCubit = context.read<BranchCubit>();
        return CommonField(
          title: widget.title ?? 'Branch *',
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
