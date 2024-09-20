import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
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
import 'package:part_app/view/trainer/students_picker.dart';
import 'package:part_app/view/trainer/trainer_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchDetails extends StatefulWidget {
  static const route = '/batch/details';

  const BatchDetails({super.key});

  @override
  State<BatchDetails> createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails>
    with SingleTickerProviderStateMixin {
  final GlobalKey _widgetKey = GlobalKey();
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double _height = 0;

  @override
  void initState() {
    context.read<BatchCubit>().studentData.clear();
    super.initState();
    _getSize();
  }

  void _getSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
          _widgetKey.currentContext?.findRenderObject() as RenderBox?;
      final size = renderBox?.size;
      setState(() => _height = size?.height ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    var size = MediaQuery.of(context).size;
    double emptyHeight = size.height - _height;
    return WillPopScope(
      onWillPop: () async {
        if (batchCubit.isFromBatch) {
          batchCubit.getBatchesByStatus(
            branchId: batch?.branchId,
            status: context.read<BatchCubit>().tempStatus,
            clean: true,
          );
        }
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonBar(
          title: 'Batch Details',
          onPressed: () {
            if (batchCubit.isFromBatch) {
              batchCubit.getBatchesByStatus(
                branchId: batch?.branchId,
                status: context.read<BatchCubit>().tempStatus,
                clean: true,
              );
            }
            Navigator.pop(context);
          },
        ),
        body: Column(
          key: _widgetKey,
          children: [
            Expanded(
              child: BlocConsumer<BatchCubit, BatchState>(
                listener: (context, state) {
                  if (state is UpdatedBatch) {
                    Alert(context).show(message: 'Batch Updated Successfully.');
                    batchCubit.studentData.clear();
                    doSearch(true, clean: true);
                  } else if (state is UpdateBatchFailed) {
                    Alert(context).show(message: state.message);
                  }
                  if (state is FetchedBatch) {
                    doSearch(true);
                  }
                },
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
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        doSearch(true, clean: false);
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.liteDark,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${batch?.name}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${batch?.branchName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: AppColors.primaryColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          EditBatchDetails.route,
                                        );
                                      },
                                      child: Container(
                                        width: 24.w,
                                        height: 24.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black54,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 15.w,
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     Share.share(
                                    //         'Hello ${context.read<AuthCubit>().user?.adminDetail?.academy?.academyName} Student,\nWelcome To PartApp!!!\nNever miss another update from ${context.read<AuthCubit>().user?.adminDetail?.academy?.academyName} again.\n\nYou are only 50 seconds away from being part of a dynamic community of artists!!! \n\nStep 1: Download PartApp here\n ${F.baseUrl.replaceAll('/api', '')}/join-batch/${batch?.sharedToken}\n\nStep 2: Click the link to register as a student in ${context.read<AuthCubit>().user?.adminDetail?.academy?.academyName}\'s PartApp.\n\nNB: We request you to avoid using the \'Join Now\' button in the app. Kindly use the second link to register as a Student.');
                                    //   },
                                    //   child: Container(
                                    //     width: 24.w,
                                    //     height: 24.w,
                                    //     decoration: BoxDecoration(
                                    //       shape: BoxShape.circle,
                                    //       color: Colors.black54,
                                    //       border: Border.all(
                                    //         color: Colors.white,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //     child: const Icon(
                                    //       Icons.share,
                                    //       size: 16,
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${batch?.courseName}, ${batch?.subjectName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${batch?.days[index]}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    );
                                  },
                                  itemCount: batch?.days.length ?? 0,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Admission Fees: ₹${batch?.admissionFee.toString().currencyFormat()}/-',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Fees: ₹${batch?.fee.toString().currencyFormat()}/-',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Button(
                                  height: UIConstants.buttonHeight,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    RescheduleClass.route,
                                  ),
                                  backgroundColor: AppColors.defaultBlue,
                                  title: 'Reschedule',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                      ),
                                ).expanded(shouldExpand: true),
                                const SizedBox(
                                  width: 16,
                                ),
                                Button(
                                  height: UIConstants.buttonHeight,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    CancelClass.route,
                                  ),
                                  title: 'Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                      ),
                                ).expanded(shouldExpand: true),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Button(
                              height: UIConstants.buttonHeight,
                              fullWidget: true,
                              onTap: () async {
                                batchCubit.isFromBatchDetail = true;
                                await Navigator.pushNamed(
                                    context, StudentPicker.route,
                                    arguments: {"isTrainer": false});
                              },
                              backgroundColor: AppColors.defaultBlue,
                              title: 'Add Students',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.liteDark,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Batch Trainers')
                                        .expanded(shouldExpand: true),
                                    GestureDetector(
                                      onTap: () {
                                        List<int?> trainers = [];
                                        if (true) {
                                          trainers = batch?.trainers
                                                  ?.map((e) => e.userId)
                                                  .toList() ??
                                              [];
                                        }

                                        if (batch?.branchId == null) return;
                                        scaffoldKey.currentState
                                            ?.showBottomSheet(
                                          elevation: 10,
                                          backgroundColor: Colors.transparent,
                                          (context) => TrainerPicker(
                                            branchId: batch?.branchId!,
                                            selectedTrainers: trainers,
                                            onSave: (List<Trainer?> value) {
                                              selectedTrainer(value);
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 24.w,
                                        height: 24.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black54,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SelectedTrainers(
                                  batchDetails: true,
                                  showAddButton: false,
                                  branchId: batch?.branchId,
                                  scaffoldKey: scaffoldKey,
                                  trainers: batch?.trainers,
                                  selectedTrainers: (List<Trainer?> value) {
                                    selectedTrainer(value);
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          BatchStudents(
                            height: emptyHeight,
                            onChange: (bool value) async {
                              isActive = value;
                              await doSearch(value, clean: true);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                return AnimatedContainer(
                  height:
                      state is FetchingStudents && state.pagination ? 30 : 0,
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
      ),
    );
  }

  Future<void> doSearch(bool active, {bool clean = true}) async =>
      await context.read<StudentCubit>().getBatchStudents(
            batchId: batch?.id,
            searchQuery: null,
            activeStatus: active ? null : 'inactive-students',
            clean: clean,
          );

  void selectedTrainer(List<Trainer?> value) {
    if (value.isEmpty) {
      BatchRequest request = const BatchRequest(
        trainers: "",
      );
      context.read<BatchCubit>().updateBatch(request);
    } else {
      var trainerList = value.map((e) => e?.id).toList();
      BatchRequest request = BatchRequest(
        trainers: context
            .read<BranchCubit>()
            .trainers
            ?.where((element) => trainerList.contains(
                  element.id,
                ))
            .map((e) => e.trainerDetail?[0].id)
            .toList(),
      );
      context.read<BatchCubit>().updateBatch(request);
    }
  }
}
