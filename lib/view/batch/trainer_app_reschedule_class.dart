import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/components/trainer_app_class_picker.dart';
import 'package:part_app/view/batch/trainer_app_rescheduled_classes.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppRescheduleClass extends StatefulWidget {
  static const route = '/trainer-app-batch/reschedule-class';

  const TrainerAppRescheduleClass({Key? key}) : super(key: key);

  @override
  State<TrainerAppRescheduleClass> createState() =>
      _TrainerAppRescheduleClassState();
}

class _TrainerAppRescheduleClassState extends State<TrainerAppRescheduleClass> {
  String? startTime;
  String? endTime;
  String? startDate;
  String? endDate;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  ClassModel? selectedclass;
  var formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AuthCubit? authCubit;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    authCubit = context.read<AuthCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Reschedule Class',
      ),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is ReschedulingBatch) {
            Loader(context).show();
          } else if (state is RescheduledBatch) {
            cubit.second = true;
            Navigator.pushNamed(
              context,
              TrainerAppRescheduledClasses.route,
            );
            Alert(context).show(message: 'Batch Rescheduled.');
          } else if (state is RescheduleFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
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
                      onTap: () => Navigator.pushNamed(
                        context,
                        TrainerAppRescheduledClasses.route,
                      ),
                      title: 'Rescheduled List',
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 75.w,
                      right: 75.w,
                      top: 16.h,
                    ),
                    child: const Text(
                      'Select "From Date" and "To Date" for rescheduling a class',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                BatchItem(
                  batch: cubit.batchModel!,
                  hideTrainer: false,
                  reschedule: true,
                  onTap: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ScheduleField(
                        controller: startDateController,
                        title: 'From Date',
                        onSelect: (String value) {
                          startDate = value;
                          setState(() {
                            selectedclass = null;
                          });
                          scaffoldKey.currentState?.showBottomSheet(
                            enableDrag: false,
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => TrainerAppClassPicker(
                              branchId: cubit.batchModel?.branchId,
                              batchId: cubit.batchModel?.id,
                              date: startDate,
                              scaffoldKey: scaffoldKey,
                              onSave: (ClassModel value1) {
                                setState(() {
                                  selectedclass = value1;
                                  startDateController.text =
                                      DateTime.parse(startDate ?? "")
                                          .toDateString();
                                });
                              },
                            ),
                          );
                        },
                        time: false,
                      ),
                    ),
                    Expanded(
                      child: ScheduleField(
                        controller: endDateController,
                        title: 'To Date',
                        onSelect: (String value) async {
                          endDate = value;
                          endDateController.text = value;
                          await context
                              .read<BranchCubit>()
                              .getBranchClassesOfDateForTrainer(
                                trainerId: authCubit
                                        ?.user
                                        ?.trainerDetail?[
                                            authCubit?.trainerIndex ?? 0]
                                        .id ??
                                    0,
                                branchId: '${cubit.batchModel?.branchId}',
                                date: '$endDate',
                                clean: true,
                              );
                          setState(() {});
                        },
                        time: false,
                      ),
                    ),
                  ],
                ),
                if (selectedclass != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Selected class scheduled on',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "${DateTime.parse(startDate ?? "").formattedDay2()}, ${DateTime.parse(startDate ?? "").formattedString()}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.liteDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${selectedclass?.startTime} - ${selectedclass?.endTime}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                              ],
                            ),
                            selectedclass?.rescheduled == true
                                ? Text(
                                    "Rescheduled from ${selectedclass?.oldDate.toDateString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.yellow,
                                        ),
                                  )
                                : Text(
                                    "Scheduled Class",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.yellow,
                                        ),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                if (endDate != null &&
                    (context.read<BranchCubit>().newClasses?.length ?? 0) > 0)
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Following are the classes scheduled on',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "${DateTime.parse(endDate ?? "").formattedDay2()}, ${DateTime.parse(endDate ?? "").formattedString()}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              context.read<BranchCubit>().newClasses?.length,
                          itemBuilder: (context, index) {
                            ClassModel? singleClass =
                                context.read<BranchCubit>().newClasses?[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.liteDark,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${singleClass?.batchName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "${singleClass?.courseName}, ${singleClass?.subjectName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                  Text(
                                    "Trainers- ${singleClass?.trainers}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "${DateTime.parse(endDate ?? "").formattedDay2()} ${singleClass?.startTime} - ${singleClass?.endTime}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ScheduleField(
                        controller: startTimeController,
                        title: 'Start Time',
                        onSelect: (String value) {
                          startTime = value;
                          startTimeController.text = value;
                        },
                        time: true,
                      ),
                    ),
                    Expanded(
                      child: ScheduleField(
                        controller: endTimeController,
                        title: 'End Time',
                        onSelect: (String value) {
                          endTime = value;
                          endTimeController.text = value;
                        },
                        time: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Button(
                  onTap: () {
                    formKey.currentState?.save();
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    if (selectedclass == null) {
                      Alert(context).show(
                          message:
                              "No class is scheduled for the selected date !!");
                      return;
                    }
                    CommonDialog(
                      context: context,
                      message:
                          'Do you want to continue with rescheduling of class on',
                      buttonText: 'Yes',
                      subColor: AppColors.primaryColor,
                      subContent: Column(
                        children: [
                          Text(
                            'Date : ${DateTime.parse(startDate ?? "").formattedString()} '
                            '\nTime : ${selectedclass?.startTime.toAmPM()} - '
                            '${selectedclass?.endTime.toAmPM()}',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                          Text(
                            'to',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(),
                          ),
                          Text(
                            'Date : ${DateTime.parse(endDate ?? "").formattedString()} '
                            '\nTime : ${startTime?.toAmPM()} - '
                            '${endTime?.toAmPM()} ?',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Text(
                            'Note: Students and Trainers will be \nnotified.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onTap: () {
                        cubit.rescheduleForTrainer(
                          {
                            'old_date': startDate,
                            'old_start_time': "${selectedclass?.startTime}",
                            'old_end_time': "${selectedclass?.endTime}",
                            'new_date': endDate,
                            'new_start_time': startTime,
                            'new_end_time': endTime,
                          },
                          authCubit
                                  ?.user
                                  ?.trainerDetail?[authCubit?.trainerIndex ?? 0]
                                  .id ??
                              0,
                        );
                      },
                    ).show();
                  },
                  title: 'Reschedule Class',
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 132.h,
      //   child: BottomAppBar(
      //     color: Colors.black,
      //     child: Center(
      //       child: ,
      //     ),
      //   ),
      // ),
    );
  }
}
