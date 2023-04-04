import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/training_days.dart';
import 'package:part_app/view/components/components.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    BatchModel? batchModel = cubit.batchModel;
    Batch? batch = cubit.batch;

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
                      BranchField(
                        initialBranch: batchModel?.branchId,
                        onSelect: (value) {
                          branchId = value;
                          context.read<BranchCubit>().getBranchTrainers(
                                branchId: '$branchId',
                                clean: true,
                              );
                        },
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
                      BatchRequest request = BatchRequest(
                        branchId: branchId,
                        days: cubit.buildDaysList(),
                        batchName: batchName,
                        batchStatus: batchStatus,
                        subjectId: subjectId,
                        courseId: courseId,
                        feeAmount: fee,
                        admissionFees: admissionFee,
                      );

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
