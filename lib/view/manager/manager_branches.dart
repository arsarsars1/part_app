import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/view/components/checkbox.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerBranches extends StatefulWidget {
  static const route = '/manager/branches';

  const ManagerBranches({Key? key}) : super(key: key);

  @override
  State<ManagerBranches> createState() => _ManagerBranchesState();
}

class _ManagerBranchesState extends State<ManagerBranches> {
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
    var managerCubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Allocate Branches'),
      body: Column(
        children: [
          Text(
            managerCubit.manager?.user?.name ?? 'N/A',
          ),
          BlocBuilder<BranchCubit, BranchState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: cubit.branches.length,
                  itemBuilder: (context, index) {
                    Branch branch = cubit.branches[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextCheckBox(
                        onChange: (value) {
                          managerCubit.updateBranchSelection(branch.id);
                        },
                        title: branch.branchName ?? 'N/A',
                        selected: managerCubit.selectedBranches.contains(
                          branch.id,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                managerCubit.updateManager(request: {
                  'branch_id[]': managerCubit.selectedBranches.toList(),
                });
              },
              title: 'Update',
            ),
          ),
        ),
      ),
    );
  }
}
