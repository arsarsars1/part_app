import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/selected_trainers.dart';
import 'package:part_app/view/batch/trainer_app_batch_students.dart';
import 'package:part_app/view/batch/trainer_app_cancel_batch_class.dart';
import 'package:part_app/view/batch/trainer_app_edit_batch_details.dart';
import 'package:part_app/view/batch/trainer_app_reschedule_class.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/students_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppBatchDetails extends StatefulWidget {
  static const route = '/trainer-app-batch/details';

  const TrainerAppBatchDetails({super.key});

  @override
  State<TrainerAppBatchDetails> createState() => _TrainerAppBatchDetailsState();
}

class _TrainerAppBatchDetailsState extends State<TrainerAppBatchDetails> {
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  AuthCubit? authCubit;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    return WillPopScope(
      onWillPop: () async {
        if (batchCubit.isFromBatch) {
          batchCubit.getBatchesByStatusForTrainer(
            trainerId: authCubit
                    ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
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
              batchCubit.getBatchesByStatusForTrainer(
                trainerId: authCubit?.user
                        ?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                    0,
                branchId: batch?.branchId,
                status: context.read<BatchCubit>().tempStatus,
                clean: true,
              );
            }
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<BatchCubit, BatchState>(
                listener: (context, state) {
                  if (state is UpdatedTrainerStudentBatch) {
                    Alert(context)
                        .show(message: 'Student Updated Successfully.');
                    doSearch(clean: true);
                  } else if (state is UpdatedBatch) {
                    Alert(context).show(message: 'Batch Updated Successfully.');
                  } else if (state is UpdateBatchFailed) {
                    Alert(context).show(message: state.message);
                  }
                  if (state is FetchedBatch) {
                    doSearch();
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
                        doSearch(clean: false);
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
                                          TrainerAppEditBatchDetails.route,
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
                                    //         'Hello ${authCubit?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].academy?.academyName} Student,\nWelcome To PartApp!!!\nNever miss another update from ${authCubit?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].academy?.academyName} again.\n\nYou are only 50 seconds away from being part of a dynamic community of artists!!! \n\nStep 1: Download PartApp here\n ${F.baseUrl.replaceAll('/api', '')}/join-batch/${batchCubit.sharedToken}\n\nStep 2: Click the link to register as a student in ${authCubit?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].academy?.academyName}\'s PartApp.\n\nNB: We request you to avoid using the \'Join Now\' button in the app. Kindly use the second link to register as a Student.');
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
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    TrainerAppRescheduleClass.route,
                                  ),
                                  child: Container(
                                    height: 34.h,
                                    width: 158.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.defaultBlue,
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          'Reschedule',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 12,
                                              ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    TrainerAppCancelClass.route,
                                  ),
                                  child: Container(
                                    height: 34.h,
                                    width: 158.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          'Cancel',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 12,
                                              ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: GestureDetector(
                              onTap: () {
                                batchCubit.isFromBatchDetail = true;
                                Navigator.pushNamed(
                                  context,
                                  StudentPicker.route,
                                  arguments: {"isTrainer": true},
                                );
                              },
                              child: Container(
                                height: 34.h,
                                decoration: BoxDecoration(
                                  color: AppColors.defaultBlue,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      'Add Students',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
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
                                const Text('Batch Trainers'),
                                const SizedBox(
                                  height: 16,
                                ),
                                SelectedTrainers(
                                  batchDetails: true,
                                  branchId: batch?.branchId,
                                  scaffoldKey: scaffoldKey,
                                  trainers: batch?.trainers,
                                  selectedTrainers: (List<Trainer?> value) {
                                    var trainerList =
                                        value.map((e) => e?.id).toList();
                                    if (value.isEmpty) {
                                      BatchRequest request =
                                          const BatchRequest(trainers: "");
                                      context
                                          .read<BatchCubit>()
                                          .updateBatchForTrainer(
                                              authCubit
                                                      ?.user
                                                      ?.trainerDetail?[authCubit
                                                              ?.trainerIndex ??
                                                          0]
                                                      .id ??
                                                  0,
                                              request);
                                    } else {
                                      BatchRequest request = BatchRequest(
                                        trainers: context
                                            .read<BranchCubit>()
                                            .trainers
                                            ?.where((element) =>
                                                trainerList.contains(
                                                  element.id,
                                                ))
                                            .map((e) => e.trainerDetail?[0].id)
                                            .toList(),
                                      );
                                      context
                                          .read<BatchCubit>()
                                          .updateBatchForTrainer(
                                              authCubit
                                                      ?.user
                                                      ?.trainerDetail?[authCubit
                                                              ?.trainerIndex ??
                                                          0]
                                                      .id ??
                                                  0,
                                              request);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          TrainerAppBatchStudents(
                            onChange: (bool value) {
                              isActive = value;
                              doSearch();
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

  void doSearch({bool clean = true}) {
    context.read<StudentCubit>().getStudentsForTrainer(
          trainerId: authCubit
                  ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
              0,
          batchId: batch?.id,
          searchQuery: null,
          activeStatus: isActive ? null : 'inactive-students',
          clean: clean,
        );
  }
}
