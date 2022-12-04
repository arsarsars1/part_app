import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/view/components/list_card.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchStudents extends StatefulWidget {
  const BatchStudents({Key? key}) : super(key: key);

  @override
  State<BatchStudents> createState() => _BatchStudentsState();
}

class _BatchStudentsState extends State<BatchStudents> {
  @override
  Widget build(BuildContext context) {
    var batch = context.read<BatchCubit>();
    return BlocBuilder<BatchCubit, BatchState>(
      builder: (context, state) {
        if (batch.students == null) {
          // todo
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: batch.students?.length ?? 0,
          itemBuilder: (context, index) {
            Student student = batch.students![index];
            return ListCard(
              onTap: () {},
              title: '${student.studentDetail?[0].name}',
              subTitle: '',
            );
          },
        );
      },
    );
  }
}
