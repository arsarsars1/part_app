import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabButton(
                onChange: (String value) {},
                options: const [
                  'Active Students',
                  'Inactive Students',
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text('Active Students : ${batch.students?.length}'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: batch.students?.length ?? 0,
              itemBuilder: (context, index) {
                Student student = batch.students![index];
                StudentDetail? detail = student.studentDetail?[0];
                return Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserImage(
                        profilePic: '${F.baseUrl}'
                            '/admin/images/trainer/'
                            '${student.id}/${detail?.profilePic}',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.studentDetail?[0].name ?? '',
                            ),
                            Text(
                              'N/A',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: AppColors.green,
                                  ),
                            ),
                            const Text(
                              'Class Attended: N/A',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
