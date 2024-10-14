import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/attendance/components/attendance_student_item.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppMonthlyAttendanceView extends StatefulWidget {
  static const route = '/manager-app-month_or_year_attendance';

  const ManagerAppMonthlyAttendanceView({super.key});

  @override
  State<ManagerAppMonthlyAttendanceView> createState() =>
      _ManagerAppMonthlyAttendanceViewState();
}

class _ManagerAppMonthlyAttendanceViewState
    extends State<ManagerAppMonthlyAttendanceView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;
  BatchModel? batch;
  int? year;
  int? month;
  DateTime? finalDate = DateTime.now();
  String? activeStatus;
  AuthCubit? authCubit;
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authCubit = context.read<AuthCubit>();
      context.read<StudentCubit>().clean();
      var branchCubit = context.read<BranchCubit>();
      branchId = branchCubit.firstBranch?.id;
      finalDate = null;
      dateController.clear();
      setState(() {
        context.read<BatchCubit>().getBatchesByStatusForManager(
              managerId: authCubit
                      ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                  0,
              branchId: branchId,
              clean: true,
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Monthly Class Attendance',
      ),
      body: BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          if (state is CreatedStudent || state is UpdatedStudent) {
            doSearch(true);
          }
          var cubit = context.read<AttendanceCubit>();
          return Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       left: 16.w,
                    //       right: 16.w,
                    //       top: 16.h,
                    //     ),
                    //     child: Button(
                    //       height: UIConstants.buttonHeight,
                    //       onTap: () {
                    //         Navigator.pushNamed(context, AttendanceCalenderView.route);
                    //       },
                    //       title: 'Update Attendance',
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TrainerAppBranchField(
                      onSelect: (value) {
                        setState(() {
                          branchId = value;
                          finalDate = null;
                          dateController.clear();
                        });
                        batchController.clear();
                        batch = null;
                        cubit.reset();

                        context.read<BatchCubit>().getBatchesByStatusForManager(
                              managerId: authCubit
                                      ?.user
                                      ?.managerDetail?[
                                          authCubit?.managerIndex ?? 0]
                                      .id ??
                                  0,
                              branchId: branchId,
                              clean: true,
                            );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      disabled: branchId == null,
                      title: 'Batch Status *',
                      hint: 'Select Batch Status',
                      dropDown: true,
                      dropDownItems: DefaultValues().batchStatus,
                      onChange: (value) {
                        status = value.id;
                        cubit.reset();
                        context.read<BatchCubit>().getBatchesByStatusForManager(
                              managerId: authCubit
                                      ?.user
                                      ?.managerDetail?[
                                          authCubit?.managerIndex ?? 0]
                                      .id ??
                                  0,
                              branchId: branchId,
                              status: status!,
                              clean: true,
                            );
                        batchController.clear();
                        batch = null;
                      },
                      validator: (value) {
                        return value == null
                            ? 'Please select batch status.'
                            : null;
                      },
                      onSubmit: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      controller: batchController,
                      onTap: () {
                        if (branchId != null && status != null) {
                          scaffoldKey.currentState?.showBottomSheet(
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => BatchPicker(
                              branchId: branchId!,
                              status: status!,
                              onSelect: (value) {
                                setState(() {
                                  finalDate = null;
                                  dateController.clear();
                                  cubit.reset();
                                  batch = value;
                                  batchController.text = value.name;
                                });
                              },
                            ),
                          );
                        } else {
                          Alert(context).show(
                            message: 'Please select Branch and Status.',
                          );
                        }
                      },
                      disabled: true,
                      title: 'Batch *',
                      hint: 'Select Batch',
                      onChange: (value) {},
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.white24,
                        ),
                      ),
                      validator: (value) {
                        return value == null ? 'Please select batch.' : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ScheduleField(
                      title: 'Month, Year',
                      hint: 'Select month & year',
                      dateMonth: true,
                      onDateSelect: (DateTime value) {
                        year = value.year;
                        month = value.month;
                        finalDate = value;
                        doSearch(true);
                      },
                      time: false,
                      onlyMonth: true,
                      selectedDate: finalDate,
                      controller: dateController,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        cubit.studentAttendanceDetails == null ||
                                cubit.studentAttendanceDetails!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(64),
                                child: Center(
                                  child: Text(
                                    query == null
                                        ? 'Sorry, No matching results found'
                                        : state is StudentsAttendanceFetched
                                            ? 'Sorry, No matching results found'
                                            : 'Select a batch to list the students.',
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Text(
                                        'Total Classes Taken: ${cubit.conductedClassCount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              color: AppColors.textColor,
                                            ),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: cubit
                                            .studentAttendanceDetails?.length ??
                                        0,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      // StudentModel student = cubit.students![index];
                                      StudentAttendance student = cubit
                                          .studentAttendanceDetails![index];
                                      return AttendanceStudentItem(
                                        student: student,
                                        onTap: () {},
                                      );
                                    },
                                  ),
                                ],
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<AttendanceCubit>().getStudentsMonthlyForManager(
          managerId: authCubit
                  ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
              0,
          batchId: batch?.id,
          searchQuery: query,
          activeStatus: activeStatus,
          year: year,
          month: month,
          clean: clean,
        );
  }
}
