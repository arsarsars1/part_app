import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentBatchPicker extends StatefulWidget {
  final String status;
  final int studentId;
  final ValueChanged<BatchModel> onSelect;

  final bool branchSearch;

  const StudentBatchPicker({
    Key? key,
    required this.status,
    required this.studentId,
    required this.onSelect,
    this.branchSearch = false,
  }) : super(key: key);

  @override
  State<StudentBatchPicker> createState() => _StudentBatchPickerState();
}

class _StudentBatchPickerState extends State<StudentBatchPicker> {
  ScrollController scrollController = ScrollController();
  String? query;

  @override
  void initState() {
    super.initState();
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<BatchCubit>().getStudentBatchesByStatus(
              status: widget.status,
              studentId: widget.studentId,
              studentSearch: widget.branchSearch,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentCubit>();
    return BlocBuilder<StudentCubit, StudentState>(
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
                      context.read<BatchCubit>().getStudentBatchesByStatus(
                            studentId: widget.studentId,
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
                  cubit.batches.isEmpty
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
                                  itemCount: cubit.batches.length,
                                  itemBuilder: (context, index) {
                                    BatchModel batch = cubit.batches[index];
                                    return ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        widget.onSelect(batch);
                                      },
                                      title: Text(
                                        batch.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 15,
                                            ),
                                      ),
                                      subtitle: Text(
                                        '${batch.courseName}, ${batch.subjectName}',
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
