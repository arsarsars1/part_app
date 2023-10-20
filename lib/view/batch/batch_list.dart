import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchesPage extends StatefulWidget {
  static const route = '/batches';

  const BatchesPage({Key? key}) : super(key: key);

  @override
  State<BatchesPage> createState() => _BatchesPageState();
}

class _BatchesPageState extends State<BatchesPage> {
  int? branchId;
  String? query;
  String status = 'ongoing';

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // initial call to show the batches
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var branchCubit = context.read<BranchCubit>();
      await branchCubit.getBranches();
      branchId = branchCubit.firstBranch.id;
      setState(() {
        context.read<BatchCubit>().getBatchesByStatus(
              branchId: branchId,
              status: status,
              clean: true,
            );
      });
    });

    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<BatchCubit>().getBatchesByStatus(
              status: status,
              branchId: branchId,
              search: query,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    cubit.reset();

    return Scaffold(
      appBar: const CommonBar(title: 'Batches'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 16.h,
                      ),
                      child: Button(
                        height: 30.h,
                        onTap: () {
                          cubit.days.clear();
                          Navigator.pushNamed(context, AddBatch.route);
                        },
                        title: 'Add New Batch',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BranchField(
                    title: 'Select A Branch To List Batches',
                    onSelect: (value) {
                      branchId = value;
                      setState(() {
                        context.read<BatchCubit>().getBatchesByStatus(
                              branchId: branchId,
                              status: status,
                              clean: true,
                            );
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonField(
                    title: 'Search',
                    hint: 'Search Batch',
                    onChange: (value) {},
                    prefixIcon: const Icon(Icons.search),
                    onSubmit: (value) {
                      if (value.isEmpty) {
                        query = null;
                      } else {
                        query = value;
                      }
                      context.read<BatchCubit>().getBatchesByStatus(
                            branchId: branchId,
                            status: status,
                            search: query,
                            clean: true,
                          );
                    },
                    textInputAction: TextInputAction.search,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  branchId != null
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TabButton(
                                onChange: (String value) {
                                  if (value == 'Ongoing Batches') {
                                    status = 'ongoing';
                                    cubit.tempStatus = status;
                                  } else {
                                    status = 'completed';
                                    cubit.tempStatus = status;
                                  }
                                  context.read<BatchCubit>().getBatchesByStatus(
                                        branchId: branchId,
                                        status: status,
                                        search: query,
                                        clean: true,
                                      );
                                },
                                options: const [
                                  'Ongoing Batches',
                                  'Completed Batches',
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BlocConsumer<BatchCubit, BatchState>(
                              listener: (context, state) {},
                              buildWhen: (prv, crr) =>
                                  crr is BatchesFetched ||
                                  crr is FetchingBatches ||
                                  crr is CreatedBatch,
                              builder: (context, state) {
                                if (state is BatchNetworkError) {
                                  AlertBox.showErrorAlert(context);
                                }
                                if (state is CreatedBatch) {
                                  context.read<BatchCubit>().getBatchesByStatus(
                                        branchId: branchId,
                                        status: status,
                                        search: query,
                                        clean: true,
                                      );
                                }
                                if (state is FetchingBatches) {
                                  return const Padding(
                                    padding: EdgeInsets.only(top: 32),
                                    child: LoadingView(
                                      hideColor: true,
                                    ),
                                  );
                                }
                                if (cubit.batches.isEmpty) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(64.0),
                                      child: Text(
                                        branchId == null
                                            ? 'Add Batch to Get Started'
                                            : 'Sorry, No Matching Results Found.',
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.batches.length,
                                  itemBuilder: (context, index) {
                                    BatchModel batch = cubit.batches[index];
                                    return BatchItem(
                                      batch: batch,
                                      onTap: () {
                                        context.read<BatchCubit>().isFromBatch =
                                            true;
                                        context
                                            .read<BatchCubit>()
                                            .getBatch(batchId: '${batch.id}');
                                        context
                                            .read<BranchCubit>()
                                            .getBranchTrainers(
                                              branchId: '${batch.branchId}',
                                              clean: true,
                                            );
                                        Navigator.pushNamed(
                                            context, BatchDetails.route);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            BlocBuilder<BatchCubit, BatchState>(
                              builder: (context, state) {
                                return AnimatedContainer(
                                  height: state is FetchingBatches &&
                                          state.pagination
                                      ? 30
                                      : 0,
                                  color: Colors.black,
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  child: const Center(
                                      child: Text('Fetching more items ..')),
                                );
                              },
                            ),
                          ],
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.all(64.0),
                            child: Text(
                              'Please select a branch',
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
