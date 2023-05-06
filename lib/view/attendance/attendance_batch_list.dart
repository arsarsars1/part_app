import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendancePage extends StatefulWidget {
  static const route = '/attendance';

  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  int? branchId;
  String? query;
  String status = 'ongoing';

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // initial call to show the batches
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*context.read<BatchCubit>().getBatchesByStatus(
            status: status,
            clean: true,
          );*/
    });

    // Pagination listener
    scrollController.addListener(() {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
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
      appBar: const CommonBar(title: 'Class Attendance'),
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
                        width: 185.w,
                        onTap: () {
                          cubit.days.clear();
                          Navigator.pushNamed(context, AddBatch.route);
                        },
                        title: 'View Monthly Attendance',
                      ),
                    ),
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
                                  } else {
                                    status = 'completed';
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
                                  crr is FetchingBatches,
                              builder: (context, state) {
                                if (state is BatchNetworkError) {
                                  AlertBox.showErrorAlert(context);
                                }
                                if (cubit.batches.isEmpty &&
                                    state is FetchingBatches) {
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
