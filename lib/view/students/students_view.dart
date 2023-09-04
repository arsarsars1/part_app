import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/students/add_student.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view/students/widgets/student_item.dart';
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
  String? query;
  BatchModel? batch;
  DropDownItem? selectedItem;
  String? activeStatus;

  TextEditingController batchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
      context.read<BranchCubit>().getBranches();
      context.read<StudentCubit>().getStudents(
            batchId: batch?.id,
            searchQuery: query,
            activeStatus: activeStatus,
            clean: true,
          );
    });
    // Pagination listener
    scrollController.addListener(() {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var branchCubit = context.read<BranchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Students List',
      ),
      body: BlocBuilder<StudentCubit, StudentState>(
        // buildWhen: (prv, crr) =>
        //     crr is FetchingStudents ||
        //     crr is CreatingStudent ||
        //     crr is CreatedStudent ||
        //     crr is StudentsFetched,
        builder: (context, state) {
          if (state is CreatedStudent || state is UpdatedStudent) {
            doSearch(true);
          }
          var cubit = context.read<StudentCubit>();
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
                          onTap: () =>
                              Navigator.pushNamed(context, AddStudent.route),
                          title: 'Add New Student',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<BranchCubit, BranchState>(
                      builder: (context, state) {
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
                                value:
                                    selectedItem ?? const DropDownItem(id: -1),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 30),
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                        ),
                                      ),
                                    );
                                  }).toList()
                                ],
                                onChanged: (value) {
                                  if (value?.id == -1) {
                                    setState(() {
                                      branchId = null;
                                      selectedItem = value;
                                      doSearch(true);
                                    });
                                  } else {
                                    branchId = value?.id;
                                    selectedItem = value;
                                    setState(() {
                                      doSearch(true);
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
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
                        return value == null ? 'Please select batch.' : null;
                      },
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
                          doSearch(true);
                        }
                      },
                      onSubmit: (value) {
                        if (branchId == null) {
                          Alert(context)
                              .show(message: 'Please select a branch');
                          return;
                        }
                        if (batch == null) {
                          Alert(context).show(message: 'Please select a batch');
                          return;
                        }
                        if (status == null) {
                          Alert(context)
                              .show(message: 'Please select a batch status');
                          return;
                        }
                        if (value.isEmpty) {
                          query = null;
                        } else {
                          query = value;
                        }

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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16),
                        //   child: TabButton(
                        //     onChange: (String value) {
                        //       if (branchId == null ||
                        //           status == null ||
                        //           batch == null) {
                        //         return;
                        //       }
                        //       if (value == 'Active Students') {
                        //         activeStatus = null;
                        //       } else {
                        //         activeStatus = 'inactive-students';
                        //       }
                        //       doSearch(true);
                        //     },
                        //     options: const [
                        //       'Active Students',
                        //       'Inactive Students',
                        //     ],
                        //   ),
                        // ),
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
                                  StudentModel student = cubit.students![index];
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
              ),
              AnimatedContainer(
                height: state is FetchingStudents && state.pagination ? 30 : 0,
                color: Colors.black,
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: const Center(child: Text('Fetching more items ..')),
              )
            ],
          );
        },
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<StudentCubit>().getStudents(
          batchId: batch?.id,
          searchQuery: query,
          activeStatus: activeStatus,
          clean: clean,
        );
  }
}
