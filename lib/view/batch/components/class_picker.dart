import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class ClassPicker extends StatefulWidget {
  final int? branchId;
  final int? batchId;
  final String? date;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ValueChanged<ClassModel> onSave;
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
        if (state is ClassesLoading) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.65,
                ),
                child: const LoadingView(
                  hideColor: false,
                ),
              ),
            ],
          );
        } else if (state is ClassesFailed) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 500.h,
                width: MediaQuery.of(context).size.width,
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
                          '',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                    SizedBox(
                      height: 15.h,
                    ),
                    const Center(
                      child: Text('Something went wrong'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
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
                        'Select A Class',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                      ? Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            const Center(
                              child: Text(
                                  'Sorry, No classes scheduled for this date.'),
                            ),
                          ],
                        )
                      : cubit.classes!.isEmpty && state is! ClassesLoading
                          ? const LoadingView()
                          : ListView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: cubit.classes?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      widget.onSave(cubit.classes![index]);
                                      Navigator.pop(context);
                                    },
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${cubit.classes?[index].startTime} - ${cubit.classes?[index].endTime}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(),
                                            ),
                                          ],
                                        ),
                                        cubit.classes?[index].rescheduled ==
                                                true
                                            ? Text(
                                                "Rescheduled from ${cubit.classes?[index].oldDate.toDateString()}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.yellow,
                                                    ),
                                              )
                                            : Text(
                                                "Scheduled Class",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.yellow,
                                                    ),
                                              ),
                                      ],
                                    ),
                                  ),
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
