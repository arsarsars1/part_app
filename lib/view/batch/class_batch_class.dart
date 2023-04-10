import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/components/cancel_class.dart';
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
  String? selectedDate = "";
  var formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    var branchcubit = context.read<BranchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: CommonBar(
        title: 'Cancel Class',
        onPressed: () {
          branchcubit.classes?.clear();
          selectedDate = "";
          Navigator.pop(context);
        },
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
                    setState(() {
                      selectedDate = value;
                    });
                    context.read<BranchCubit>().getBatchClassesOfDate(
                          batchId: '${cubit.batchModel?.id}',
                          branchId: '${cubit.batchModel?.branchId}',
                          date: "$selectedDate",
                          clean: true,
                        );
                  },
                  time: false,
                ),
                if (selectedDate != "")
                  BlocBuilder<BranchCubit, BranchState>(
                    builder: (context, state) {
                      return branchcubit.classes!.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                const Center(
                                  child: Text(
                                      'Sorry, No classes scheduled for this date.'),
                                ),
                              ],
                            )
                          : branchcubit.classes!.isEmpty &&
                                  state is! ClassesLoading
                              ? const LoadingView()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      'Following are the classes\nscheduled on\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      DateTime.parse(selectedDate ?? "")
                                          .toEEEDDMMYYY(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    ListView.builder(
                                      controller: scrollController,
                                      shrinkWrap: true,
                                      itemCount: branchcubit.classes?.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.liteDark,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                // widget.onSave(cubit.classes![index]);
                                                // Navigator.pop(context);
                                              },
                                              trailing: Theme(
                                                data: ThemeData.dark(),
                                                child: Radio<int>(
                                                  value: index,
                                                  groupValue: _selectedValue,
                                                  activeColor: Colors.white,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      _selectedValue = value!;
                                                    });
                                                  },
                                                ),
                                              ),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${branchcubit.classes?[index].startTime} - ${branchcubit.classes?[index].endTime}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(),
                                                  ),
                                                  branchcubit.classes?[index]
                                                              .rescheduled ==
                                                          true
                                                      ? Text(
                                                          "Rescheduled from ${branchcubit.classes?[index].oldDate.toDateString()}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .yellow,
                                                                  ),
                                                        )
                                                      : Text(
                                                          "Scheduled Class",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .yellow,
                                                                  ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                    },
                  ),
                SizedBox(
                  height: 15.h,
                ),
                Button(
                  onTap: () {
                    var formKey1 = GlobalKey<FormState>();
                    String? reason;
                    CommonDialog(
                      context: context,
                      message:
                          'Do You Want To cancel the class on\nDate: ${DateTime.parse(selectedDate ?? "").toDDMMYYY()}\nTime: ${branchcubit.classes?[_selectedValue].startTime}-${branchcubit.classes?[_selectedValue].endTime} ?'
                          '\n\nNote: Students and Trainers will be\nnotified.',
                      subContent: CancelClassPopUp(
                        formKey: formKey1,
                        reason: (value) {
                          reason = value;
                        },
                      ),
                      onTap: () {
                        formKey.currentState!.save();
                        // if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                        cubit.cancelClass({
                          'start_time':
                              "${branchcubit.classes?[_selectedValue].startTime}",
                          'end_time':
                              "${branchcubit.classes?[_selectedValue].endTime}",
                          'class_date': "$selectedDate",
                          'reason': reason,
                        });
                      },
                    ).show();
                    // formKey.currentState?.save();
                    // if (!formKey.currentState!.validate()) {
                    //   return;
                    // }
                  },
                  title: 'Cancel Class',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
