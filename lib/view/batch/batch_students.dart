import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchStudents extends StatefulWidget {
  final ValueChanged<bool> onChange;

  const BatchStudents({Key? key, required this.onChange}) : super(key: key);

  @override
  State<BatchStudents> createState() => _BatchStudentsState();
}

class _BatchStudentsState extends State<BatchStudents> {
  String studentText = 'Active Students';
  @override
  Widget build(BuildContext context) {
    var studentCubit = context.read<StudentCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabButton(
            onChange: (String value) {
              if (value == 'Active Students') {
                widget.onChange(true);
              } else {
                widget.onChange(false);
              }

              setState(() {
                studentText = value;
              });
            },
            options: const [
              'Active Students',
              'Inactive Students',
            ],
          ),
        ),
        BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            var students = studentCubit.students ?? [];
            if (state is FetchingStudents && students.isEmpty) {
              return const LoadingView(
                hideColor: true,
              );
            }
            if (state is StudentsFetched && students.isEmpty) {
              return const Center(
                child: Text('No students added.'),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                      '$studentText : ${studentCubit.students?.length ?? 0}'),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: studentCubit.students?.length ?? 0,
                  itemBuilder: (context, index) {
                    StudentModel student = studentCubit.students![index];

                    return GestureDetector(
                      onTap: () {
                        studentCubit.studentDetails(student.detailId);
                        Navigator.pushNamed(
                          context,
                          StudentDetails.route,
                        );
                      },
                      child: Container(
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
                              profilePic: student.profilePic != ""
                                  ? '${F.baseUrl}'
                                      '/admin/images/student/'
                                      '${student.detailId}/${student.profilePic}'
                                  : '',
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student.name ?? '',
                                  ),
                                  student.pivot?.feeType == "monthly"
                                      ? Text(
                                          'Monthly',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.primaryColor,
                                              ),
                                        )
                                      : Text(
                                          'Class Based',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.green,
                                              ),
                                        ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
