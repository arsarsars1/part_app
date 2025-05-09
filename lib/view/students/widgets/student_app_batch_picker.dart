import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/student_app_batch_response.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppBatchPicker extends StatefulWidget {
  final String status;
  final int studentId;
  final int branchId;
  final ValueChanged<StudentAppBatchDetail> onSelect;

  final bool branchSearch;

  const StudentAppBatchPicker({
    super.key,
    required this.status,
    required this.studentId,
    required this.branchId,
    required this.onSelect,
    this.branchSearch = false,
  });

  @override
  State<StudentAppBatchPicker> createState() => _StudentAppBatchPickerState();
}

class _StudentAppBatchPickerState extends State<StudentAppBatchPicker> {
  ScrollController scrollController = ScrollController();
  String? query;

  @override
  void initState() {
    super.initState();
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        context.read<BatchCubit>().getStudentBatchesByStatus(
              status: widget.status,
              studentId: widget.studentId,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return BlocBuilder<BatchCubit, BatchState>(
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
                        'Select Batch',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<BatchCubit>()
                              .getStudentAppBatchesByStatus(
                                studentId: context
                                    .read<AuthCubit>()
                                    .user
                                    ?.studentDetail?[
                                        context.read<AuthCubit>().studentIndex]
                                    .id,
                                branchId: widget.branchId,
                                status: widget.status,
                                clean: true,
                              );
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
                  CommonField(
                    title: '',
                    hint: 'Search Batch',
                    onChange: (value) {},
                    prefixIcon: const Icon(Icons.search),
                    onSubmit: (value) {
                      if (value.isEmpty) {
                        query = null;
                      } else {
                        query = value;
                      }
                      context.read<BatchCubit>().getStudentAppBatchesByStatus(
                            studentId: widget.studentId,
                            branchId: widget.branchId,
                            status: widget.status,
                            search: query,
                            clean: true,
                          );
                    },
                    textInputAction: TextInputAction.search,
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  cubit.studentAppBatches.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text('Sorry, No batches found.'),
                        ))
                      : Expanded(
                          child: state is FetchingBatches
                              ? const LoadingView()
                              : ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemCount: cubit.studentAppBatches.length,
                                  itemBuilder: (context, index) {
                                    StudentAppBatchDetail batch =
                                        cubit.studentAppBatches[index];
                                    return ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        widget.onSelect(batch);
                                      },
                                      title: Text(
                                        "${batch.batchName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 15,
                                            ),
                                      ),
                                      subtitle: Text(
                                        '${batch.course?.courseName}, ${batch.subject?.subjectName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                  BlocBuilder<BatchCubit, BatchState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        height: state is FetchingBatches && state.pagination
                            ? 30
                            : 0,
                        color: Colors.black,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child: const Center(
                          child: Text('Fetching more items ..'),
                        ),
                      );
                    },
                  ),
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
