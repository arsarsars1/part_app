import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/attendance/attendance_calender_view.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';
import '../../view_model/attendance/attendance_cubit.dart';
import 'monthly_attendance_view.dart';

class AttendanceBatchListPage extends StatefulWidget {
  static const route = '/attendance-batch-list';

  const AttendanceBatchListPage({Key? key}) : super(key: key);

  @override
  State<AttendanceBatchListPage> createState() =>
      _AttendanceBatchListPageState();
}

class _AttendanceBatchListPageState extends State<AttendanceBatchListPage> {
  int? branchId;
  String? query;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // initial call to show the batches
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*context.read<AttendanceCubit>().getBatchesByStatus(
            status: status,
            clean: true,
          );*/
    });

    // Pagination listener
    scrollController.addListener(() {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<AttendanceCubit>().getBatchesByStatus(
              branchId: branchId,
              search: query,
              branchSearch: false,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AttendanceCubit>();
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
                          left: 16.w, right: 16.w, top: 16.h, bottom: 20.h),
                      child: Button(
                        height: 30.h,
                        width: 185.w,
                        onTap: () {
                          cubit.days.clear();
                          Navigator.pushNamed(
                            context,
                            MonthlyAttendanceView.route,
                          );
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
                        context.read<AttendanceCubit>().getBatchesByStatus(
                              branchId: branchId,
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
                      context.read<AttendanceCubit>().getBatchesByStatus(
                            branchId: branchId,
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
                            const SizedBox(
                              height: 20,
                            ),
                            BlocConsumer<AttendanceCubit, AttendanceState>(
                              listener: (context, state) {},
                              buildWhen: (prv, crr) =>
                                  crr is FetchingAttendanceBatches ||
                                  crr is AttendanceBatchesFetched,
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
                                        context.read<AttendanceCubit>().id =
                                            batch.id;
                                        Navigator.pushNamed(
                                          context,
                                          AttendanceCalenderView.route,
                                        );
                                      },
                                    );
                                  },
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
