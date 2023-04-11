import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/components/class_picker.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/rescheduled_classes.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class RescheduleClass extends StatefulWidget {
  static const route = '/batch/reschedule-class';

  const RescheduleClass({Key? key}) : super(key: key);

  @override
  State<RescheduleClass> createState() => _RescheduleClassState();
}

class _RescheduleClassState extends State<RescheduleClass> {
  String? startTime;
  String? endTime;
  String? startDate;
  String? endDate;
  ClassModel? selectedclass;
  var formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
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
              RescheduledClasses.route,
            );
            Alert(context).show(message: 'Batch Rescheduled.');
          } else if (state is RescheduleFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Form(
          key: formKey,
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
                      RescheduledClasses.route,
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
                          (context) => ClassPicker(
                            branchId: cubit.batchModel?.branchId,
                            batchId: cubit.batchModel?.id,
                            date: startDate,
                            scaffoldKey: scaffoldKey,
                            onSave: (ClassModel value) {
                              setState(() {
                                selectedclass = value;
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
                      title: 'To Date',
                      onSelect: (String value) {
                        endDate = value;
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
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      DateTime.parse(startDate ?? "").formattedString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                                    .bodyText1
                                    ?.copyWith(),
                              ),
                            ],
                          ),
                          selectedclass?.rescheduled == true
                              ? Text(
                                  "Rescheduled from ${selectedclass?.oldDate.toDateString()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.yellow,
                                      ),
                                )
                              : Text(
                                  "Scheduled Class",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ScheduleField(
                      title: 'Start Time',
                      onSelect: (String value) {
                        startTime = value;
                      },
                      time: true,
                    ),
                  ),
                  Expanded(
                    child: ScheduleField(
                      title: 'End Time',
                      onSelect: (String value) {
                        endTime = value;
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
                  cubit.reschedule({
                    'old_date': startDate,
                    'old_start_time':
                        "${cubit.batchModel?.batchDetail?[0].startTime}:00",
                    'old_end_time':
                        "${cubit.batchModel?.batchDetail?[0].endTime}:00",
                    'new_date': endDate,
                    'new_start_time': startTime,
                    'new_end_time': endTime,
                  });
                },
                title: 'Reschedule Class',
              )
            ],
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
