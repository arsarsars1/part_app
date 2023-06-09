import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/retain_student_check.dart';
import 'package:part_app/view/batch/components/training_days.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view_model/cubits.dart';

class EditBatchDetails extends StatefulWidget {
  static const route = '/batch/details/edit';

  const EditBatchDetails({Key? key}) : super(key: key);

  @override
  State<EditBatchDetails> createState() => _EditBatchDetailsState();
}

class _EditBatchDetailsState extends State<EditBatchDetails> {
  TextEditingController dobController = TextEditingController();

  String? batchName;
  int? branchId;
  int? courseId;
  int? retainStudent = 1;
  String? fee;
  String? admissionFee;
  String? batchStatus;
  int? subjectId;
  List<int> selectedTrainers = [];

  bool selected = false;

  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();

  // Files
  File? image;
  File? doc1;
  File? doc2;

  DropDownItem? selectedItem;

  final _dropDownKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    BatchModel? batchModel = cubit.batchModel;
    Batch? batch = cubit.batch;
    var branchCubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Edit Batch'),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is UpdatingBatch) {
            Loader(context, message: 'Updating batch..').show();
          } else if (state is UpdatedBatch) {
            Navigator.popUntil(
              context,
              ModalRoute.withName(BatchDetails.route),
            );
            Alert(context).show(message: 'Batch updated successfully.');
          } else if (state is UpdateBatchFailed) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonFormField<DropDownItem>(
                          key: _dropDownKey,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select branch.';
                            }
                            return null;
                          },
                          dropdownColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          value: selectedItem ??
                              branchCubit.initialBranch(
                                batchModel?.branchId,
                              ),
                          items: branchCubit.dropDownBranches().map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value?.title == batchModel?.branchName) {
                              return;
                            }
                            String branchName = '';
                            for (var item
                                in context.read<BranchCubit>().branches) {
                              if (item.id == value?.id) {
                                branchName = item.branchName ?? "";
                                break;
                              }
                            }
                            CommonDialog(
                              context: context,
                              message:
                                  'You are switching ${batchModel?.name} from ${batchModel?.branchName} to $branchName.',
                              buttonText: 'Yes',
                              subColor: AppColors.primaryColor,
                              subContent: Column(
                                children: [
                                  Text(
                                    'Do you want to retain the students assigned in the batch?',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  )
                                ],
                              ),
                              onCancelTap: () {
                                _dropDownKey.currentState?.reset();
                                Navigator.pop(context);
                              },
                              hasClose: true,
                              onClose: () {
                                selectedItem = value;
                                branchId = value?.id;
                                retainStudent = 0;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              onTap: () {
                                selectedItem = value;
                                branchId = value?.id;
                                retainStudent = 1;
                                Navigator.pop(context);
                                setState(() {});
                              },
                            ).show();
                          },
                        ),
                      ),
                      if (branchId != null)
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            RetainStudentCheckButton(
                              selected: retainStudent == 1 ? true : false,
                              onChange: (bool value) {
                                setState(() {
                                  retainStudent = value ? 1 : 0;
                                });
                              },
                              onNumberChange: (int value) {
                                retainStudent = value;
                              },
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        title: 'Batch Name *',
                        hint: 'Enter Batch Name',
                        initialValue: batchModel?.name,
                        onChange: (value) {
                          batchName = value;
                        },
                        validator: (value) {
                          return value == null || value.toString().isEmpty
                              ? 'Please enter batch name.'
                              : null;
                        },
                        length: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        title: 'Course *',
                        hint: 'Select Course',
                        dropDown: true,
                        defaultItem: cubit.defaultCourse,
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
                              defaultItem: cubit.defaultSubject,
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
                        initialValue: '${batchModel?.admissionFee}',
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
                        initialValue: '${batchModel?.fee}',
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
                        edit: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonField(
                        title: 'Batch Status *',
                        hint: 'Select Batch Status',
                        dropDown: true,
                        defaultItem: cubit.getBatchStatusItem(
                          batch?.batchStatus,
                        ),
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  formKey.currentState!.save();
                  if (formKey.currentState!.validate()) {
                    if (cubit.days.isEmpty) {
                      Alert(context).show(
                        message: 'Please select the training days.',
                      );
                      return;
                    } else {
                      BatchRequest request;
                      if (branchId == batchModel?.branchId) {
                        request = BatchRequest(
                          days: cubit.buildDaysList(),
                          batchName: batchName,
                          batchStatus: batchStatus,
                          subjectId: subjectId,
                          courseId: courseId,
                          feeAmount: fee,
                          admissionFees: admissionFee,
                        );
                      } else {
                        request = BatchRequest(
                          branchId: branchId,
                          retainStudents: retainStudent,
                          days: cubit.buildDaysList(),
                          batchName: batchName,
                          batchStatus: batchStatus,
                          subjectId: subjectId,
                          courseId: courseId,
                          feeAmount: fee,
                          admissionFees: admissionFee,
                        );
                      }

                      cubit.updateBatch(request);
                    }
                  }
                },
                title: 'Update Batch',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
