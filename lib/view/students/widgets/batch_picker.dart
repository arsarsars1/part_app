import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchPicker extends StatefulWidget {
  final String status;
  final int branchId;
  final ValueChanged<BatchModel> onSelect;

  final bool branchSearch;

  const BatchPicker({
    Key? key,
    required this.status,
    required this.branchId,
    required this.onSelect,
    this.branchSearch = false,
  }) : super(key: key);

  @override
  State<BatchPicker> createState() => _BatchPickerState();
}

class _BatchPickerState extends State<BatchPicker> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<BatchCubit>().getBatchesByStatus(
              status: widget.status,
              branchId: widget.branchId,
              branchSearch: widget.branchSearch,
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
                  cubit.batches.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text('Sorry, No batches found.'),
                        ))
                      : Expanded(
                          child:
                              cubit.batches.isEmpty && state is! FetchingBatches
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
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                ),
                                          ),
                                          subtitle: Text(
                                            '${batch.courseName}, ${batch.subjectName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
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
                        child:
                            const Center(child: Text('Fetching more items ..')),
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
