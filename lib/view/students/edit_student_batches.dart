import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/home.dart';
import 'package:part_app/view/students/assign_batch.dart';
import 'package:part_app/view/students/edit_assigned_batch.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view/students/widgets/remove_student.dart';
import 'package:part_app/view_model/cubits.dart';

class EditStudentBatches extends StatefulWidget {
  static const route = '/students/details/assigned-batches';
  final bool editStudent;
  const EditStudentBatches({Key? key, required this.editStudent})
      : super(key: key);

  @override
  State<EditStudentBatches> createState() => _EditStudentBatchesState();
}

class _EditStudentBatchesState extends State<EditStudentBatches> {
  @override
  Widget build(BuildContext context) {
    var studentCubit = context.read<StudentCubit>();
    return Scaffold(
      appBar: CommonBar(
        title: 'Assigned Batches',
        onPressed: () {
          if (widget.editStudent) {
            if (studentCubit.second) {
              studentCubit.second = false;
              Navigator.pushNamedAndRemoveUntil(
                context,
                Home.route,
                (route) => false,
              );
            } else {
              Navigator.pop(context);
            }
          } else {
            studentCubit.second = false;
            Navigator.pushNamedAndRemoveUntil(
              context,
              Home.route,
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
                  // Navigator.pop(context);
                  // cubit.studentDetails(student.detailId);
                  Navigator.pushNamed(
                    context,
                    StudentDetails.route,
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
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                          AssignBatch.route,
                          arguments: true,
                        );
                      },
                      title: 'Enroll To Other Batches',
                    ),
                  ),
                ),
                ListView.builder(
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
                            studentCubit.removeStudentBatch(
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
                            .getBatch(batchId: '${batch.id}');
                        Navigator.pushNamed(
                          context,
                          EditAssignedBatch.route,
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
    );
  }
}
