import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/trainer_app_assign_student_batch.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppAssignBatch extends StatefulWidget {
  static const route = '/trainer-app-students/add/batches';
  final bool editStudent;

  const TrainerAppAssignBatch({super.key, required this.editStudent});

  @override
  State<TrainerAppAssignBatch> createState() => _TrainerAppAssignBatchState();
}

class _TrainerAppAssignBatchState extends State<TrainerAppAssignBatch> {
  int? branchId;

  bool searched = false;
  ScrollController scrollController = ScrollController();
  AuthCubit? authCubit;
  String? search;

  @override
  void initState() {
    super.initState();
    var branchCubit = context.read<BranchCubit>();
    branchId = branchCubit.firstBranch?.id;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authCubit = context.read<AuthCubit>();
      context.read<BatchCubit>().reset();
      context.read<BatchCubit>().getBatchesByStatusForTrainer(
            trainerId: authCubit
                    ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
            branchId: branchId,
            clean: true,
            branchSearch: false,
          );
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<BatchCubit>().getBatchesByStatusForTrainer(
              trainerId: authCubit
                      ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                  0,
              branchId: branchId,
              search: search,
              branchSearch: true,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var studentCubit = context.read<StudentCubit>();
    String student = 'Not Available';
    if (widget.editStudent) {
      student = studentCubit.student?.studentDetail?[0].name ?? 'Not Available';
    } else {
      student = studentCubit.studentRequest.name ?? 'Not Available';
    }
    return Scaffold(
      appBar: const CommonBar(title: 'Assign Batches'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                Center(
                  child: Text(student),
                ),
                const SizedBox(
                  height: 20,
                ),
                TrainerAppBranchField(
                  onSelect: (value) {
                    setState(() {
                      branchId = value;
                      searched = true;
                    });

                    context.read<BatchCubit>().getBatchesByStatusForTrainer(
                          trainerId: authCubit
                                  ?.user
                                  ?.trainerDetail?[authCubit?.trainerIndex ?? 0]
                                  .id ??
                              0,
                          branchId: value,
                          clean: true,
                          branchSearch: false,
                        );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  disabled: branchId == null,
                  title: 'Search',
                  hint: 'Search with Batch Name',
                  onChange: (value) {
                    if (value.isEmpty) {
                      search = null;
                      context.read<BatchCubit>().getBatchesByStatusForTrainer(
                            trainerId: authCubit
                                    ?.user
                                    ?.trainerDetail?[
                                        authCubit?.trainerIndex ?? 0]
                                    .id ??
                                0,
                            branchId: branchId,
                            search: null,
                            clean: true,
                            branchSearch: false,
                          );
                    }
                  },
                  prefixIcon: const Icon(Icons.search),
                  onSubmit: (value) {
                    search = value;
                    if (value.isNotEmpty) {
                      context.read<BatchCubit>().getBatchesByStatusForTrainer(
                            trainerId: authCubit
                                    ?.user
                                    ?.trainerDetail?[
                                        authCubit?.trainerIndex ?? 0]
                                    .id ??
                                0,
                            branchId: branchId,
                            search: value,
                            clean: true,
                            branchSearch: true,
                          );
                    }
                  },
                  textInputAction: TextInputAction.search,
                ),
                BlocConsumer<BatchCubit, BatchState>(
                  listener: (context, state) {},
                  buildWhen: (prv, crr) =>
                      crr is BatchesFetched ||
                      crr is FetchingBatches ||
                      crr is BatchInitial,
                  builder: (context, state) {
                    var batchCubit = context.read<BatchCubit>();
                    if (batchCubit.batches.isEmpty &&
                        state is FetchingBatches) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: LoadingView(
                          hideColor: true,
                        ),
                      );
                    }
                    if (batchCubit.batches.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(64.0),
                          child: Text(
                            searched
                                ? 'Sorry, No batches found.'
                                : 'Select a branch to get started',
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: batchCubit.activeBatches.length,
                      itemBuilder: (context, index) {
                        BatchModel batch = batchCubit.activeBatches[index];
                        return BatchItem(
                          reschedule: true,
                          addBatch: true,
                          batch: batch,
                          enrolled:
                              studentCubit.enrolledBatches.contains(batch.id),
                          onAddToBatch: () {
                            context.read<BatchCubit>().getBatchForTrainer(
                                trainerId: authCubit
                                        ?.user
                                        ?.trainerDetail?[
                                            authCubit?.trainerIndex ?? 0]
                                        .id ??
                                    0,
                                acadamyId: authCubit
                                        ?.user
                                        ?.trainerDetail?[
                                            authCubit?.trainerIndex ?? 0]
                                        .academy
                                        ?.academyTypeId ??
                                    0,
                                batchId: '${batch.id}');
                            Navigator.pushNamed(
                              context,
                              TrainerAppAssignStudentBatch.route,
                              arguments: widget.editStudent,
                            );
                          },
                          onTap: () {},
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<BatchCubit, BatchState>(
            builder: (context, state) {
              return AnimatedContainer(
                height: state is FetchingBatches && state.pagination ? 30 : 0,
                color: Colors.black,
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: const Center(child: Text('Fetching more items ..')),
              );
            },
          ),
        ],
      ),
    );
  }
}
