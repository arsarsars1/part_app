import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/batch_students.dart';
import 'package:part_app/view/batch/cancel_batch_class.dart';
import 'package:part_app/view/batch/components/selected_trainers.dart';
import 'package:part_app/view/batch/edit_batch_details.dart';
import 'package:part_app/view/batch/reschedule_class.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceCalenderView extends StatefulWidget {
  static const route = '/batch-calender-view';

  const AttendanceCalenderView({Key? key}) : super(key: key);

  @override
  State<AttendanceCalenderView> createState() => _AttendanceCalenderViewState();
}

class _AttendanceCalenderViewState extends State<AttendanceCalenderView> {
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // context.read<BatchCubit>().getBatchesByStatus(
        //       branchId: batch?.branchId,
        //       status: context.read<BatchCubit>().tempStatus,
        //       clean: true,
        //     );
        // Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: const CommonBar(
          title: 'Class Attendence',
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<BatchCubit, BatchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  batch = context.read<BatchCubit>().batchModel;
                  if (state is FetchingBatch || state is UpdatingBatch) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is FetchBatchFailed) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Text(
                          "${batch?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${batch?.branchName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "${batch?.courseName}, ${batch?.subjectName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Trainer - ${batch?.trainersString}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 25.h),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(
                              '${batch?.days[index]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          },
                          itemCount: batch?.days.length ?? 0,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          "Current Date - ${DateTime.now().toDateString()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          "Note : Select current date to take today's attendance of ${batch?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
