import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/rescheduled_classes.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Reschedule Class',
      ),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is ReschedulingBatch) {
            Loader(context).show();
          } else if (state is RescheduledBatch) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(RescheduledClasses.route),
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
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 75.w,
                    right: 75.w,
                    top: 16.h,
                  ),
                  child: const Text(
                    'Select from data and to for rescheduling a class',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              BatchItem(
                batch: cubit.batchModel!,
                hideTrainer: true,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 132.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                formKey.currentState?.save();
                if (!formKey.currentState!.validate()) {
                  return;
                }
                cubit.reschedule({
                  'previous_date': startDate,
                  'new_date': endDate,
                  'start_time': startTime,
                  'end_time': endTime,
                });
              },
              title: 'Reschedule Class',
            ),
          ),
        ),
      ),
    );
  }
}
