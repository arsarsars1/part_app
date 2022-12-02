import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/view/components/checkbox.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerBranches extends StatefulWidget {
  static const route = '/manager/branches';

  const ManagerBranches({Key? key}) : super(key: key);

  @override
  State<ManagerBranches> createState() => _ManagerBranchesState();
}

class _ManagerBranchesState extends State<ManagerBranches> {
  List<String> selected = [];

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
    Manager? details = managerCubit.manager?.managerDetail?[0];
    String managerName = details?.name ?? '';
    return Scaffold(
      appBar: const CommonBar(title: 'Allocate Branches'),
      body: BlocListener<ManagerCubit, ManagerState>(
        listener: (context, state) {
          if (state is UpdatingManager) {
            Loader(context).show();
          } else if (state is UpdatedManager) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(ManagerDetails.route),
            );
            Alert(context).show(message: 'Updated manager branches.');
          } else if (state is UpdatingManagerFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Column(
          children: [
            Text(
              managerName,
            ),
            BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                if (state is BranchesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BranchesLoaded) {
                  var branches = cubit.branchesForManager(details?.id);
                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: branches.length,
                      itemBuilder: (context, index) {
                        Branch branch = branches[index];

                        return BlocBuilder<ManagerCubit, ManagerState>(
                          buildWhen: (prv, crr) =>
                              crr is BranchSelectionUpdated,
                          builder: (context, state) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.liteDark,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: TextCheckBox(
                                onChange: (value) {
                                  if (!value) {
                                    CommonDialog(
                                      context: context,
                                      message:
                                          'Do you want to remove $managerName from ${branch.branchName}?',
                                      onTap: () {
                                        Navigator.pop(context);
                                        managerCubit
                                            .updateBranchSelection(branch.id);
                                      },
                                    ).show();
                                  } else {
                                    managerCubit
                                        .updateBranchSelection(branch.id);
                                  }
                                },
                                title: branch.branchName ?? 'N/A',
                                subTitle:
                                    '${branch.district?.districtName}, ${branch.state?.stateName}',
                                selected:
                                    managerCubit.selectedBranches.contains(
                                  branch.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                managerCubit.updateManager(
                  request: {
                    'branch_id[]': managerCubit.selectedBranches
                        .map(
                          (e) => '$e',
                        )
                        .toList(),
                  },
                );
              },
              title: 'Update',
            ),
          ),
        ),
      ),
    );
  }
}
