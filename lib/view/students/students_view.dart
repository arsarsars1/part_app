import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/students/add_student.dart';
import 'package:part_app/view/students/student/batch_picker.dart';
import 'package:part_app/view/students/student/student_item.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentsView extends StatefulWidget {
  static const route = '/students';

  const StudentsView({Key? key}) : super(key: key);

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  int? batchId;
  String? query;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      doSearch();
    });

    // Pagination listener
    scrollController.addListener(() {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Students',
      ),
      body: ListView(
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
                onTap: () => Navigator.pushNamed(context, AddStudent.route),
                title: 'Add New Student',
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

              doSearch();
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

              context.read<BatchCubit>().getBatchesByStatus(
                    branchId: branchId,
                    status: status!,
                    clean: true,
                  );
            },
            validator: (value) {
              return value == null ? 'Please select batch status.' : null;
            },
            onSubmit: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            onTap: () {
              scaffoldKey.currentState?.showBottomSheet(
                backgroundColor: Colors.transparent,
                (context) => BatchPicker(
                  branchId: branchId!,
                  status: status!,
                ),
              );
            },
            disabled: true,
            title: 'Batch *',
            hint: 'Select Batch',
            onChange: (value) {
              setState(() {
                batchId = value;
              });
              doSearch();
            },
            validator: (value) {
              return value == null ? 'Please select batch.' : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Search',
            hint: 'Search By Name or Phone Number',
            onChange: (value) {
              if (value.isEmpty) {
                query = null;
                doSearch();
              }
            },
            onSubmit: (value) {
              query = value;
              doSearch();
            },
            textInputAction: TextInputAction.search,
            prefixIcon: const Icon(Icons.search),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              var cubit = context.read<StudentCubit>();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabButton(
                      onChange: (String value) {},
                      options: const [
                        'Active Students',
                        'Inactive Students',
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.students?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Student student = cubit.students![index];
                      StudentDetail detail = student.studentDetail![0];
                      return StudentItem(
                        student: student,
                        onTap: () {
                          cubit.studentDetails(detail.id);
                          Navigator.pushNamed(
                            context,
                            StudentDetails.route,
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void doSearch() {
    context.read<StudentCubit>().getStudents(
          status: status,
          branchId: branchId,
          batchId: batchId,
          searchQuery: query,
        );
  }
}
