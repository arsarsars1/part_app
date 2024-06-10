import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/trainer_app_home.dart';
import 'package:part_app/view/students/trainer_app_assign_batch.dart';
import 'package:part_app/view/students/trainer_app_edit_assigned_batch.dart';
import 'package:part_app/view/students/trainer_app_student_details.dart';
import 'package:part_app/view/students/widgets/remove_student.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppEditStudentBatches extends StatefulWidget {
  static const route = '/trainer-app-students/details/assigned-batches';
  final bool editStudent;
  const TrainerAppEditStudentBatches({Key? key, required this.editStudent})
      : super(key: key);

  @override
  State<TrainerAppEditStudentBatches> createState() =>
      _TrainerAppEditStudentBatchesState();
}

class _TrainerAppEditStudentBatchesState
    extends State<TrainerAppEditStudentBatches> {
  AuthCubit? authCubit;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var studentCubit = context.read<StudentCubit>();
    return WillPopScope(
      onWillPop: () async {
        if (widget.editStudent) {
          if (studentCubit.second) {
            studentCubit.second = false;
            Navigator.pushNamedAndRemoveUntil(
              context,
              TrainerAppHome.route,
              (route) => false,
            );
          } else {
            Navigator.pop(context);
          }
        } else {
          studentCubit.second = false;
          Navigator.pushNamedAndRemoveUntil(
            context,
            TrainerAppHome.route,
            (route) => false,
          );
        }
        return false;
      },
      child: Scaffold(
        appBar: CommonBar(
          title: 'Assigned Batches',
          onPressed: () {
            if (widget.editStudent) {
              if (studentCubit.second) {
                studentCubit.second = false;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  TrainerAppHome.route,
                  (route) => false,
                );
              } else {
                Navigator.pop(context);
              }
            } else {
              studentCubit.second = false;
              Navigator.pushNamedAndRemoveUntil(
                context,
                TrainerAppHome.route,
                (route) => false,
              );
            }
          },
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 132.h,
            child: BottomAppBar(
              color: Colors.black,
              child: Center(
                child: Button(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TrainerAppStudentDetails.route,
                    );
                  },
                  title: 'View Student Profile',
                ),
              ),
            ),
          ),
        ),
        body: BlocListener<StudentCubit, StudentState>(
          listener: (context, state) {
            if (state is RemovingStudent) {
              Loader(context, message: 'Removing student..').show();
            } else if (state is RemovedStudent) {
              Alert(context).show(message: 'Removed the student from batch');
              Navigator.pop(context);
            } else if (state is RemoveStudentFailed) {
              Alert(context).show(message: state.message);
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              return ListView(
                children: [
                  Center(
                    child: Text(
                      // studentCubit.studentRequest.name ??
                      studentCubit.student?.studentDetail?[0].name ??
                          'Not Available',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
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
                        width: 200,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            TrainerAppAssignBatch.route,
                            arguments: true,
                          );
                        },
                        title: 'Enroll To Other Batches',
                      ),
                    ),
                  ),
                  studentCubit.batches.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: Text(
                              "${studentCubit.student?.studentDetail?[0].name} is not enrolled to any batches yet",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: studentCubit.batches.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            BatchModel batch = studentCubit.batches[index];

                            return BatchItem(
                              edit: true,
                              batch: batch,
                              onTap: () {},
                              onRemove: () {
                                var formKey = GlobalKey<FormState>();
                                String? rejoining;
                                String? remark;
                                CommonDialog(
                                  context: context,
                                  message:
                                      'Do You Want To Deactivate ${studentCubit.student?.studentDetail?[0].name}\n From ${batch.name} ?'
                                      '\n\nSelect Date Of Leaving And Confirm',
                                  subContent: RemoveStudent(
                                    formKey: formKey,
                                    rejoiningDate: (value) {
                                      rejoining = value;
                                    },
                                    remark: (value) {
                                      remark = value;
                                    },
                                  ),
                                  onTap: () {
                                    formKey.currentState!.save();
                                    // if (formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    studentCubit.removeStudentBatchForTrainer(
                                      trainerId: authCubit
                                              ?.user
                                              ?.trainerDetail?[
                                                  authCubit?.trainerIndex ?? 0]
                                              .id ??
                                          0,
                                      batch.id,
                                      // date: rejoining!,
                                      date: rejoining ?? "",
                                      reason: remark == "" ? "Nil" : remark,
                                    );
                                    // }
                                  },
                                ).show();
                              },
                              onEdit: () {
                                context
                                    .read<BatchCubit>()
                                    .getBatchForTrainerDetail(
                                        trainerId: authCubit
                                                ?.user
                                                ?.trainerDetail?[
                                                    authCubit?.trainerIndex ??
                                                        0]
                                                .id ??
                                            0,
                                        batchId: '${batch.id}');
                                Navigator.pushNamed(
                                  context,
                                  TrainerAppEditAssignedBatch.route,
                                  arguments: true,
                                );
                              },
                            );
                          },
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
