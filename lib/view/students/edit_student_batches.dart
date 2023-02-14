import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/assign_batch.dart';
import 'package:part_app/view/students/edit_assigned_batch.dart';
import 'package:part_app/view/students/widgets/remove_student.dart';
import 'package:part_app/view_model/cubits.dart';

class EditStudentBatches extends StatefulWidget {
  static const route = '/students/details/assigned-batches';

  const EditStudentBatches({Key? key}) : super(key: key);

  @override
  State<EditStudentBatches> createState() => _EditStudentBatchesState();
}

class _EditStudentBatchesState extends State<EditStudentBatches> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentCubit>();
    Student? student = cubit.student;
    StudentDetail? details = student?.studentDetail![0];
    return Scaffold(
      appBar: const CommonBar(
        title: 'Assigned Batches',
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
        child: ListView(
          children: [
            Center(
              child: Text(
                cubit.student?.studentDetail?[0].name ?? 'Not Available',
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
            BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.batches.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    BatchModel batch = cubit.batches[index];

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
                          subMessage:
                              '${cubit.student?.studentDetail?[0].name}',
                          message:
                              'Do You Want To Deactivate The Student\n From ${batch.name}?'
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
                            if (formKey.currentState!.validate()) {
                              Navigator.pop(context);
                              cubit.removeStudentBatch(
                                batch.id,
                                date: rejoining!,
                                reason: remark,
                              );
                            }
                          },
                        ).show();
                      },
                      onEdit: () {
                        context
                            .read<BatchCubit>()
                            .getBatch(batchId: '${batch.id}');
                        Navigator.pushNamed(context, EditAssignedBatch.route);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
