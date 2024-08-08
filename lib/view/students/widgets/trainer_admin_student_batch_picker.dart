import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerStudentBatchPicker extends StatefulWidget {
  final String status;
  final int? trainerId;
  final int? studentId;
  final bool isTrainer;
  final ValueChanged<BatchModel> onSelect;

  const TrainerStudentBatchPicker({
    super.key,
    required this.status,
    required this.onSelect,
    this.isTrainer = false,
    this.trainerId,
    this.studentId,
  });

  @override
  State<TrainerStudentBatchPicker> createState() =>
      _TrainerStudentBatchPickerState();
}

class _TrainerStudentBatchPickerState extends State<TrainerStudentBatchPicker> {
  ScrollController scrollController = ScrollController();
  List<BatchModel>? searchBatches;
  String? query;

  @override
  void initState() {
    super.initState();
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch(null);
      }
    });
  }

  Future<void> doSearch(String? search) async {
    if (widget.isTrainer && widget.trainerId != null) {
      await context.read<StudentCubit>().getStudentBatchesForTrainers(
            clean: true,
            trainerId: widget.trainerId!,
            status: 'ongoing',
            // search: search
          );
    } else {
      await context.read<StudentCubit>().getStudentAdminBatches(
            clean: true,
            status: 'ongoing',
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentCubit>();
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        return Container(
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
                onChange: (value) {
                  if (value.isEmpty) {
                    query = null;
                    searchBatches = null;
                  } else {
                    searchBatches = [];
                    query = value;
                    if (cubit.batches.isNotEmpty) {
                      searchBatches = searchBatchesFun(query, cubit.batches);
                    } else {
                      query = null;
                      searchBatches = null;
                    }
                  }
                  setState(() {});
                },
                prefixIcon: const Icon(Icons.search),
                textInputAction: TextInputAction.search,
              ),
              const Divider(
                color: Colors.white24,
              ),
              state is FetchingBatches
                  ? const LoadingView(color: Colors.transparent)
                  : cubit.batches.isEmpty ||
                          (searchBatches != null && searchBatches!.isEmpty)
                      ? const Center(
                          child: Text('Sorry, No batches found.'),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount:
                              searchBatches?.length ?? cubit.batches.length,
                          itemBuilder: (context, index) {
                            BatchModel batch =
                                searchBatches?[index] ?? cubit.batches[index];
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
              BlocBuilder<BatchCubit, BatchState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    height:
                        state is FetchingBatches && state.pagination ? 30 : 0,
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
        );
      },
    );
  }

  List<BatchModel>? searchBatchesFun(String? query, List<BatchModel> batches) {
    if (query == null) {
      return null;
    }
    List<String> queryWords = query.toLowerCase().split(' ');

    return batches.where((batch) {
      List<String> batchNameWords = batch.name.toLowerCase().split(' ');
      return queryWords.every((queryWord) =>
          batchNameWords.any((batchWord) => batchWord.contains(queryWord)));
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
