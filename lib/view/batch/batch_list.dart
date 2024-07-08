import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchesPage extends StatefulWidget {
  static const route = '/batches';

  const BatchesPage({super.key});

  @override
  State<BatchesPage> createState() => _BatchesPageState();
}

class _BatchesPageState extends State<BatchesPage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  final GlobalKey _widgetKey = GlobalKey();
  int? branchId;
  String? query;
  String status = 'ongoing';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BranchCubit branchCubit = context.read<BranchCubit>();
      branchCubit.clean();
      await branchCubit.getBranches();
      Future.delayed(const Duration(seconds: 2));
      branchId = branchCubit.firstBranch?.id;
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

    return Scaffold(
      key: _widgetKey,
      appBar: const CommonBar(title: 'Batches'),
      body: SafeArea(
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
                  height: UIConstants.buttonHeight,
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
                  cubit.getBatchesByStatus(
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
                cubit.getBatchesByStatus(
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
            BlocBuilder<BranchCubit, BranchState>(builder: (context, state) {
              if (state is BranchesLoading) {
                return const LoadingView(hideColor: true);
              }
              return branchId != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TabButton(
                            onChange: (String value) {
                              if (value == 'Ongoing Batches') {
                                status = 'ongoing';
                                cubit.tempStatus = status;
                              } else {
                                status = 'completed';
                                cubit.tempStatus = status;
                              }
                              cubit.getBatchesByStatus(
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
                              cubit.getBatchesByStatus(
                                branchId: branchId,
                                status: status,
                                search: query,
                                clean: true,
                              );
                            }
                            if (state is FetchingBatches) {
                              return const LoadingView(
                                hideColor: true,
                              );
                            }
                            if (cubit.batches.isEmpty) {
                              return Center(
                                child: Text(
                                  branchId == null
                                      ? 'Add Batch to Get Started'
                                      : 'Sorry, No Matching Results Found.',
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
                                    cubit.isFromBatch = true;
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
                              height:
                                  state is FetchingBatches && state.pagination
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
                    );
            }),
          ],
        ),
      ),
    );
  }
}
