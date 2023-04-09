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

class CancelClass extends StatefulWidget {
  static const route = '/batch/cancel-class';

  const CancelClass({Key? key}) : super(key: key);

  @override
  State<CancelClass> createState() => _RescheduleClassState();
}

class _RescheduleClassState extends State<CancelClass> {
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
        title: 'Cancel Class',
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
                    title: 'Cancelled List',
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
                    'Select date for cancelling a\nscheduled class',
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
              ScheduleField(
                title: 'Select Date',
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
                title: 'Cancel Class',
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
