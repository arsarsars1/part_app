import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/students/assign_batch.dart';
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
    return Scaffold(
      appBar: const CommonBar(
        title: 'Assigned Batches',
      ),
      body: ListView(
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
                itemBuilder: (context, index) {
                  BatchModel batch = cubit.batches[index];
                  return BatchItem(
                    edit: true,
                    batch: batch,
                    onTap: () {},
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
