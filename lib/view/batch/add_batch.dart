// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/view/batch/batch_list.dart';
import 'package:part_app/view/batch/components/selected_trainers.dart';
import 'package:part_app/view/batch/components/training_days.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:share_plus/share_plus.dart';

class AddBatch extends StatefulWidget {
  static const route = '/batch/add';

  const AddBatch({Key? key}) : super(key: key);

  @override
  State<AddBatch> createState() => _AddBatchState();
}

class _AddBatchState extends State<AddBatch> {
  TextEditingController dobController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AuthCubit? authCubit;
  String? batchName;
  int? branchId;
  int? courseId;
  String? fee;
  String? admissionFee;
  String? batchStatus;
  int? subjectId;
  List<int?> selectedTrainers = [];

  bool selected = false;

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();

  // Files
  File? image;
  File? doc1;
  File? doc2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authCubit = context.read<AuthCubit>();
      context.read<BatchCubit>().getCourses();
      var branchCubit = context.read<BranchCubit>();
      branchId = branchCubit.firstBranch?.id;
      setState(() {
        branchCubit.getBranchTrainers(
          branchId: '$branchId',
          clean: true,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(title: 'Add New Batch'),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is BatchNetworkError) {
            AlertBox.showErrorAlert(context);
          } else if (state is CreatingBatch) {
            Loader(context).show();
          } else if (state is CreatedBatch) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(BatchesPage.route),
            );
            Alert(context).show(message: 'Batch created successfully.');
            CommonDialog(
              context: context,
              message: 'Do you want to share the link for adding students ?',
              buttonText: 'Proceed',
              subColor: AppColors.primaryColor,
              onTap: () {
                Share.share(
                    'Hello ${authCubit?.user?.adminDetail?.academy?.academyName} Student,\nWelcome To PartApp!!!\nNever miss another update from ${authCubit?.user?.adminDetail?.academy?.academyName} again.\n\nYou are only 50 seconds away from being part of a dynamic community of artists!!! \n\nStep 1: Download PartApp here\n ${F.baseUrl.replaceAll('/api', '')}/join-batch/${cubit.sharedToken}\n\nStep 2: Click the link to register as a student in ${authCubit?.user?.adminDetail?.academy?.academyName}\'s PartApp.\n\nNB: We request you to avoid using the \'Join Now\' button in the app. Kindly use the second link to register as a Student.');
              },
            ).show();
          } else if (state is CreateBatchFailed) {
            Alert(context).show(message: state.message);
            Navigator.pop(context);
          }
        },
        child: Form(
          key: formKey,
          child: BlocBuilder<BatchCubit, BatchState>(
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      BranchField(
                        onSelect: (value) {
                          branchId = value;
                          setState(() {
                            context.read<BranchCubit>().getBranchTrainers(
                                  branchId: '$branchId',
                                  clean: true,
                                );
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        length: 100,
                        title: 'Batch Name *',
                        hint: 'Enter Batch Name',
                        onChange: (value) {
                          batchName = value;
                        },
                        validator: (value) {
                          return value == null || value.toString().isEmpty
                              ? 'Please enter batch name.'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        title: 'Course *',
                        hint: 'Select Course',
                        dropDown: true,
                        dropDownItems: cubit.getCoursesDropDown(),
                        onChange: (value) {
                          courseId = value?.id;
                          cubit.getSubjects(courseId: courseId);
                        },
                        validator: (value) {
                          return value == null ? 'Please select course.' : null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      state is GettingCourses
                          ? const Offstage()
                          : CommonField(
                              title: 'Subject *',
                              hint: 'Select Subject',
                              dropDown: true,
                              defaultItem: null,
                              dropDownItems: cubit.getSubjectsDropDown(),
                              onChange: (value) {
                                subjectId = value?.id;
                              },
                              validator: (value) {
                                return value == null
                                    ? 'Please select subject.'
                                    : null;
                              },
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        inputType: const TextInputType.numberWithOptions(),
                        title: 'Admission Fees *',
                        hint: 'Enter Admission Fees',
                        onChange: (value) {
                          admissionFee = value;
                        },
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return 'Please enter admission fees.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        inputType: const TextInputType.numberWithOptions(),
                        length: 50,
                        title: 'Fees *',
                        hint: 'Enter Fees',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return 'Please enter fees';
                          }
                          return null;
                        },
                        onChange: (value) {
                          fee = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TrainingDays(
                        edit: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        title: 'Batch Status *',
                        hint: 'Select Batch Status',
                        dropDown: true,
                        dropDownItems: DefaultValues().batchStatus,
                        onChange: (value) {
                          batchStatus = value?.id;
                        },
                        validator: (value) {
                          return value == null
                              ? 'Please select batch status.'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.liteDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Batch Trainers'),
                            const SizedBox(
                              height: 16,
                            ),
                            SelectedTrainers(
                              trainers: context
                                  .read<BranchCubit>()
                                  .trainers
                                  ?.where(
                                      (element) => selectedTrainers.contains(
                                            element.id,
                                          ))
                                  .toList(),
                              branchId: branchId,
                              scaffoldKey: scaffoldKey,
                              selectedTrainers: (List<Trainer?> value) {
                                setState(() {
                                  selectedTrainers =
                                      value.map((e) => e?.id).toList();
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 15),
                            child: Button(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (cubit.days.isEmpty) {
                                    Alert(context).show(
                                      message:
                                          'Please select the training days.',
                                    );
                                    return;
                                  } else {
                                    BatchRequest request = BatchRequest(
                                      branchId: branchId,
                                      days: cubit.buildDaysList(),
                                      batchName: batchName,
                                      batchStatus: batchStatus,
                                      subjectId: subjectId,
                                      courseId: courseId,
                                      feeAmount: int.parse(fee!),
                                      trainers: context
                                          .read<BranchCubit>()
                                          .trainers
                                          ?.where((element) =>
                                              selectedTrainers.contains(
                                                element.id,
                                              ))
                                          .map((e) => e.trainerDetail?[0].id)
                                          .toList(),
                                      admissionFees: int.parse(admissionFee!),
                                    );

                                    cubit.createBatch(request);
                                  }
                                } else {
                                  scrollController.animateTo(
                                    0.5,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              title: 'Save Batch',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
