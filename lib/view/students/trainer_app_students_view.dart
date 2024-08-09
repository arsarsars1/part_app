import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/trainer_app_add_student.dart';
import 'package:part_app/view/students/trainer_app_student_details.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view/students/widgets/student_item.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppStudentsView extends StatefulWidget {
  static const route = '/trainer-app-students';

  const TrainerAppStudentsView({super.key});

  @override
  State<TrainerAppStudentsView> createState() => _TrainerAppStudentsViewState();
}

class _TrainerAppStudentsViewState extends State<TrainerAppStudentsView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;
  BatchModel? batch;
  DropDownItem? selectedItem;
  String? activeStatus;
  AuthCubit? authCubit;
  TextEditingController batchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
      context.read<BranchCubit>().getBranchesForTrainer(
            trainerId: authCubit
                    ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
          );
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
            // if (query == null) {
            return const LoadingView(hideColor: true);
            // }
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
                            onTap: () => Navigator.pushNamed(
                                    context, TrainerAppAddStudent.route)
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
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Branch',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  DropdownButtonFormField<DropDownItem>(
                                    dropdownColor: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    value: selectedItem ??
                                        const DropDownItem(id: -1),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                        ),
                                      ),
                                      ...branchCubit
                                          .dropDownBranches()
                                          .map((e) {
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
                                      }),
                                    ],
                                    onChanged: (value) {
                                      if (value?.id == -1) {
                                        setState(() {
                                          branchId = null;
                                          selectedItem = value;
                                          batchController.clear();
                                          doSearch(true);
                                        });
                                      } else {
                                        branchId = value?.id;
                                        selectedItem = value;
                                        batchController.clear();
                                        setState(() {
                                          doSearch(true);
                                        });
                                      }
                                    },
                                  ),
                                ]),
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
                          dropDownItems: DefaultValues().batchStatus,
                          onChange: (value) {
                            status = value.id;

                            context
                                .read<BatchCubit>()
                                .getBatchesByStatusForTrainer(
                                  trainerId: authCubit
                                          ?.user
                                          ?.trainerDetail?[
                                              authCubit?.trainerIndex ?? 0]
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
                            context.read<StudentCubit>().getStudentsForTrainer(
                                  trainerId: authCubit
                                          ?.user
                                          ?.trainerDetail?[
                                              authCubit?.trainerIndex ?? 0]
                                          .id ??
                                      0,
                                  batchId: batch?.id,
                                  searchQuery: query,
                                  activeStatus: activeStatus,
                                  clean: true,
                                );
                          } else {
                            query = value;
                            doSearch(true);
                          }
                        },
                        onSubmit: (value) {
                          if (value.isEmpty) {
                            query = null;
                          } else {
                            query = value;
                            doSearch(true);
                          }
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
                                        cubit.studentDetailsForTrainer(
                                            trainerId: authCubit
                                                    ?.user
                                                    ?.trainerDetail?[authCubit
                                                            ?.trainerIndex ??
                                                        0]
                                                    .id ??
                                                0,
                                            studentId: student.detailId);
                                        Navigator.pushNamed(
                                          context,
                                          TrainerAppStudentDetails.route,
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

  void doSearch(bool clean) {
    context.read<StudentCubit>().getStudentsForTrainer(
          trainerId: authCubit
                  ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
              0,
          batchId: batch?.id,
          searchQuery: query,
          activeStatus: activeStatus,
          clean: clean,
        );
  }
}
