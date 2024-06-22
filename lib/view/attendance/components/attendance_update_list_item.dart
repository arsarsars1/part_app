import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';

import '../../../flavors.dart';
import '../../components/user_image.dart';

class AttendanceUpdateListItem extends StatefulWidget {
  final List<StudentModel> students;
  final ValueChanged<StudentModel> onSelect;

  const AttendanceUpdateListItem({
    Key? key,
    required this.students,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<AttendanceUpdateListItem> createState() =>
      _AttendanceUpdateListItemState();
}

class _AttendanceUpdateListItemState extends State<AttendanceUpdateListItem> {
  late ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<TrainerCubit>().getRestOfTheTrainers(nextPage: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.students.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        StudentModel student = widget.students[index];
        return InkWell(
          onTap: () {
            // call back to parent widget
            widget.onSelect(student);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 8.w),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.grey800,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      UserImage(
                        profilePic: student.profilePic != ""
                            ? '${F.baseUrl}'
                                '/admin/images/trainer/'
                                '${student.id}/${student.profilePic}'
                            : '',
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          '${student.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25.0.h,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            trackColor: AppColors.grey500,
                            value: student.isActive == 1,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
