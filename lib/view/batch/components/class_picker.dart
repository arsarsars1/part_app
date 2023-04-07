import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class ClassPicker extends StatefulWidget {
  final int? branchId;
  final int? batchId;
  final String? date;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ValueChanged<String> onSave;
  final ValueChanged<String>? onSelect;

  const ClassPicker({
    Key? key,
    this.branchId,
    this.date,
    this.onSelect,
    this.batchId,
    this.scaffoldKey,
    required this.onSave,
  }) : super(key: key);

  @override
  State<ClassPicker> createState() => _ClassPickerState();
}

class _ClassPickerState extends State<ClassPicker> {
  ScrollController scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    // log(widget.batchId.toString());
    // log(widget.branchId.toString());
    // log(widget.date.toString());
    context.read<BranchCubit>().getBatchClassesOfDate(
          batchId: '${widget.batchId}',
          branchId: '${widget.branchId}',
          date: '${widget.date}',
          clean: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BranchCubit>();
    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black54,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.liteDark,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Class',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  cubit.classes!.isEmpty
                      ? const Center(
                          child: Text('Sorry, No trainers found.'),
                        )
                      : cubit.classes!.isEmpty && state is! ClassesLoading
                          ? const LoadingView()
                          : ListView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: cubit.classes?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {},
                                  title: const Text("data"),
                                );
                              },
                            ),
                  // BlocBuilder<BranchCubit, BranchState>(
                  //   builder: (context, state) {
                  //     return AnimatedContainer(
                  //       height: state is BranchesLoading && state.pagination
                  //           ? 30
                  //           : 0,
                  //       color: Colors.black,
                  //       duration: const Duration(
                  //         milliseconds: 250,
                  //       ),
                  //       child: const Center(
                  //         child: Text('Fetching more items ..'),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
