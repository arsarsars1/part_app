import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/components/cancel_class.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/trainer_app_cancelled_batch_class.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppCancelClass extends StatefulWidget {
  static const route = '/manager-app-batch/cancel-class';

  const ManagerAppCancelClass({super.key});

  @override
  State<ManagerAppCancelClass> createState() => _ManagerAppCancelClassState();
}

class _ManagerAppCancelClassState extends State<ManagerAppCancelClass> {
  String? selectedDate = "";
  var formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  TextEditingController dateController = TextEditingController();
  int _selectedValue = -1;
  AuthCubit? authCubit;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    var branchcubit = context.read<BranchCubit>();
    authCubit = context.read<AuthCubit>();
    return WillPopScope(
      onWillPop: () async {
        branchcubit.classes?.clear();
        selectedDate = "";
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
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
            if (state is CancellingClassBatch) {
              Loader(context).show();
            } else if (state is CancelledClassBatch) {
              cubit.second = true;
              Navigator.pushNamed(
                context,
                TrainerAppCancelledClasses.route,
              );
              Alert(context).show(message: 'Batch Cancelled.');
            } else if (state is CancelClassFailed) {
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
                        height: UIConstants.buttonHeight,
                        onTap: () => Navigator.pushNamed(
                          context,
                          TrainerAppCancelledClasses.route,
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
                    controller: dateController,
                    title: 'Select Date',
                    onSelect: (String value) {
                      setState(() {
                        selectedDate = value;
                        dateController.text = value;
                      });
                      context
                          .read<BranchCubit>()
                          .getBatchClassesOfDateForManager(
                            managerId: authCubit
                                    ?.user
                                    ?.managerDetail?[
                                        authCubit?.managerIndex ?? 0]
                                    .id ??
                                0,
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
                                            .bodyLarge
                                            ?.copyWith(),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        DateTime.parse(selectedDate ?? "")
                                            .toEEEDDMMYYY(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
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
                                                          .bodyLarge
                                                          ?.copyWith(),
                                                    ),
                                                    branchcubit.classes?[index]
                                                                .rescheduled ==
                                                            true
                                                        ? Text(
                                                            "Rescheduled from ${branchcubit.classes?[index].oldDate.toDateString()}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge
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
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge
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
                      if (formKey.currentState!.validate()) {
                        var formKey1 = GlobalKey<FormState>();
                        String? reason;

                        if (_selectedValue == -1) {
                          Alert(context).show(message: 'Select a class');
                        } else {
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
                              formKey1.currentState!.save();
                              if (formKey1.currentState!.validate()) {
                                Navigator.pop(context);
                                cubit.cancelClassForManager(
                                  {
                                    'start_time':
                                        "${branchcubit.classes?[_selectedValue].startTime}",
                                    'end_time':
                                        "${branchcubit.classes?[_selectedValue].endTime}",
                                    'class_date': "$selectedDate",
                                    'reason': reason,
                                  },
                                  authCubit
                                          ?.user
                                          ?.managerDetail?[
                                              authCubit?.managerIndex ?? 0]
                                          .id ??
                                      0,
                                );
                              }
                            },
                          ).show();
                        }
                        return;
                      }
                    },
                    title: 'Cancel Class',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
