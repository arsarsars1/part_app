import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/student_app_batch_response.dart';
import 'package:part_app/view/batch/components/student_app_batch_item.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/student_app_branch_field.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppBatchesPage extends StatefulWidget {
  static const route = '/student-app-batches';

  const StudentAppBatchesPage({Key? key}) : super(key: key);

  @override
  State<StudentAppBatchesPage> createState() => _StudentAppBatchesPageState();
}

class _StudentAppBatchesPageState extends State<StudentAppBatchesPage> {
  int? branchId;
  String? query;
  String status = 'ongoing';

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // initial call to show the batches
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*context.read<BatchCubit>().getStudentAppBatchesByStatus(
            status: status,
            clean: true,
          );*/
    });

    // Pagination listener
    scrollController.addListener(() {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // context.read<BatchCubit>().getStudentAppBatchesByStatus(
        //       studentId: context.read<AuthCubit>().user?.studentDetail?[0].id,
        //       status: status,
        //       branchId: branchId,
        //       search: query,
        //       clean: false,
        //     );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    cubit.reset();

    return Scaffold(
      appBar: const CommonBar(title: 'Enrolled Batches'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  StudentAppBranchField(
                    title: 'Select A Branch To List Batches',
                    onSelect: (value) {
                      branchId = value;
                      setState(() {
                        context.read<BatchCubit>().getStudentAppBatchesByStatus(
                              studentId: context
                                  .read<AuthCubit>()
                                  .user
                                  ?.studentDetail?[0]
                                  .id,
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
                  branchId != null
                      ? Column(
                          children: [
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
                                  context
                                      .read<BatchCubit>()
                                      .getStudentAppBatchesByStatus(
                                        studentId: context
                                            .read<AuthCubit>()
                                            .user
                                            ?.studentDetail?[0]
                                            .id,
                                        branchId: branchId,
                                        status: status,
                                        search: query,
                                        clean: true,
                                      );
                                }
                                if (cubit.studentAppBatches.isEmpty) {
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
                                  itemCount: cubit.studentAppBatches.length,
                                  itemBuilder: (context, index) {
                                    StudentAppBatchDetail batch =
                                        cubit.studentAppBatches[index];
                                    return StudentAppBatchItem(
                                      batch: batch,
                                      onTap: () {},
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
