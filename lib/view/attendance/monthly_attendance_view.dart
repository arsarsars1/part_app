import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/attendance/components/attendance_student_item.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/attendance/attendance_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

class MonthlyAttendanceView extends StatefulWidget {
  static const route = '/month_or_year_attendance';

  const MonthlyAttendanceView({Key? key}) : super(key: key);

  @override
  State<MonthlyAttendanceView> createState() => _MonthlyAttendanceViewState();
}

class _MonthlyAttendanceViewState extends State<MonthlyAttendanceView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;
  BatchModel? batch;
  int? year;
  int? month;

  String? activeStatus;

  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
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
                          onTap: () {
                            // Navigator.pushNamed(context, AddStudent.route);
                          },
                          title: 'Update Attendance',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BranchField(
                      onSelect: (value) {
                        setState(() {
                          branchId = value;
                        });
                        batchController.clear();
                        batch = null;
                        cubit.reset();

                        context.read<BatchCubit>().getBatchesByStatus(
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
                        context.read<BatchCubit>().getBatchesByStatus(
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
                                batch = value;
                                batchController.text = value.name;
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
                      initialValue: DateTime.now().toMMMMYYYY(),
                      dateMonth: true,
                      onDateSelect: (DateTime value) {
                        year = value.year;
                        month = value.month;
                        doSearch(true);
                      },
                      time: false,
                      onlyMonth: true,
                    ),

                    /*CommonField(
                      controller: dateController,
                      title: 'Date *',
                      hint: 'Select the date',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.white24,
                        ),
                      ),
                      disabled: true,
                      onTap: () {
                        datePicker();
                      },
                      onChange: (value) {},
                      validator: (value) {
                        return value.isEmpty ? 'Please select the date.' : null;
                      },
                      onSubmit: (value) {},
                    ),*/

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
                                        ? 'Add a student to get started'
                                        : state is StudentsAttendanceFetched
                                            ? 'Sorry, No matching results found'
                                            : 'Select a batch to list the students.',
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    'Total Classes Taken: ${cubit.conductedClassCount}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.copyWith(
                                          color: AppColors.textColor,
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
    context.read<AttendanceCubit>().getStudentsMonthly(
          batchId: batch?.id,
          searchQuery: query,
          activeStatus: activeStatus,
          year: year,
          month: month,
          clean: clean,
        );
  }
}
