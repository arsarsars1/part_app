import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/add_student.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view/students/widgets/student_item.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentsView extends StatefulWidget {
  static const route = '/students';

  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DropDownItem? status;
  int? branchId;
  String? query;
  BatchModel? batch;

  TextEditingController batchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
      context.read<BranchCubit>().getBranches();
      doSearch(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var branchCubit = context.read<BranchCubit>();
    var cubit = context.read<StudentCubit>();

    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(title: 'Students List'),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is CreatedStudent || state is UpdatedStudent) {
            doSearch(true);
          }

          if (state is FetchingStudents && cubit.students == null ||
              cubit.students!.isEmpty) {
            if (query == null) {
              return const LoadingView(hideColor: true);
            }
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification) {
                doSearch(false);
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                            onTap: () =>
                                Navigator.pushNamed(context, AddStudent.route)
                                    .then((value) {
                              if (value != null && value == true) {
                                doSearch(true);
                              }
                            }),
                            title: 'Add New Student',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<BranchCubit, BranchState>(
                        builder: (context, state) {
                          // if (state is BranchesLoading) {
                          //   return const LoadingView(hideColor: true);
                          // }
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Branch',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField<DropDownItem>(
                                  dropdownColor: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
                                  value: branchId != null
                                      ? branchCubit
                                          .dropDownBranches()
                                          .where((test) => test.id == branchId)
                                          .first
                                      : const DropDownItem(id: -1),
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 32),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: const DropDownItem(id: -1),
                                      child: SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          'All',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                        ),
                                      ),
                                    ),
                                    ...branchCubit.dropDownBranches().map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: SizedBox(
                                          width: 200.w,
                                          child: Text(
                                            e.title ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                  onChanged: (value) {
                                    if (value?.id == -1) {
                                      setState(() {
                                        batch = null;
                                        branchId = null;
                                        query = null;
                                        status = null;
                                        batchController.clear();
                                        doSearch(true);
                                      });
                                    } else {
                                      branchId = value?.id;
                                      batch = null;
                                      query = null;
                                      status = null;
                                      batchController.clear();
                                      doSearch(true);
                                      setState(() {});
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Visibility(
                        visible: branchId != null,
                        child: const SizedBox(
                          height: 20,
                        ),
                      ),
                      Visibility(
                        visible: branchId != null,
                        child: CommonField(
                          disabled: branchId == null,
                          title: 'Batch Status *',
                          hint: 'Select Batch Status',
                          dropDown: true,
                          defaultItem: status,
                          dropDownItems: DefaultValues().batchStatus,
                          onChange: (value) async {
                            status = value;

                            batchController.clear();
                            batch = null;
                            cubit.clean();
                            await context.read<BatchCubit>().getBatchesByStatus(
                                  branchId: branchId,
                                  status: status!.id,
                                  clean: true,
                                );
                            if (context.mounted &&
                                context.read<BatchCubit>().batches.isNotEmpty) {
                              batch = context.read<BatchCubit>().batches.first;
                              batchController.text = batch?.name ?? "";
                              setState(() {});
                              doSearch(true);
                            }
                          },
                          validator: (value) {
                            return value == null
                                ? 'Please select batch status.'
                                : null;
                          },
                          onSubmit: (value) {},
                        ),
                      ),
                      Visibility(
                        visible: branchId != null,
                        child: const SizedBox(
                          height: 20,
                        ),
                      ),
                      Visibility(
                        visible: branchId != null,
                        child: CommonField(
                          controller: batchController,
                          onTap: () {
                            if (branchId != null && status != null) {
                              scaffoldKey.currentState?.showBottomSheet(
                                elevation: 10,
                                backgroundColor: Colors.transparent,
                                (context) => BatchPicker(
                                  branchId: branchId!,
                                  status: status!.id,
                                  onSelect: (value) {
                                    batch = value;
                                    batchController.text = value.name;

                                    doSearch(true);
                                    // setState(() {});
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
                            return value == null
                                ? 'Please select batch.'
                                : null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        // disabled: batch == null,
                        title: 'Search',
                        hint: 'Search By Name or Phone Number',
                        onChange: (value) {
                          if (value.isEmpty) {
                            query = null;
                          } else {
                            query = value;
                          }
                          setState(() {});
                          doSearch(true);
                        },
                        onSubmit: (value) {
                          if (value.isEmpty) {
                            query = null;
                          } else {
                            query = value;
                          }
                          setState(() {});
                          doSearch(true);
                        },
                        textInputAction: TextInputAction.search,
                        prefixIcon: const Icon(Icons.search),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          cubit.students == null || cubit.students!.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(64),
                                  child: Center(
                                    child: Text(
                                      query == null
                                          ? 'Add a student to get started'
                                          : state is StudentsFetched
                                              ? 'Sorry, No matching results found'
                                              : 'Select a batch to list the students.',
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cubit.students?.length ?? 0,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    StudentModel student =
                                        cubit.students![index];
                                    return StudentItem(
                                      student: student,
                                      onTap: () {
                                        cubit.studentDetails(student.detailId);
                                        Navigator.pushNamed(
                                          context,
                                          StudentDetails.route,
                                        );
                                      },
                                    );
                                  },
                                ),
                        ],
                      )
                    ],
                  ),
                  AnimatedContainer(
                    height:
                        state is FetchingStudents && state.pagination ? 30 : 0,
                    color: Colors.black,
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    child: const Center(child: Text('Fetching more items ..')),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> doSearch(bool clean) async {
    await context.read<StudentCubit>().getStudents(
          branchId: branchId,
          batchId: batch?.id,
          searchQuery: query,
          activeStatus: status?.title?.toLowerCase(),
          clean: clean,
        );
  }
}
