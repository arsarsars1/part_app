import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/view/branch/add_branch.dart';
import 'package:part_app/view/branch/branch_details.dart';
import 'package:part_app/view/components/button.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/list_card.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';

class BranchList extends StatefulWidget {
  static const route = '/branches';

  const BranchList({Key? key}) : super(key: key);

  @override
  State<BranchList> createState() => _BranchListState();
}

class _BranchListState extends State<BranchList> {
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
    return Scaffold(
      appBar: const CommonBar(title: 'Branches'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: Button(
                height: 30.h,
                onTap: () {
                  Navigator.pushNamed(context, AddBranch.route);
                },
                title: 'Add New Branch',
              ),
            ),
          ),
          BlocBuilder<BranchCubit, BranchState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: cubit.branches.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Branch branch = cubit.branches[index];
                    return ListCard(
                      onTap: () {
                        // opens the branch details page
                        // id is a required arguments
                        Navigator.pushNamed(
                          context,
                          BranchDetails.route,
                          arguments: branch.id,
                        );
                      },
                      title: branch.branchName ?? 'N/A',
                      subTitle: branch.address ?? 'N/A',
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
