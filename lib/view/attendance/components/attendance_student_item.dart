import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';

import '../../../flavors.dart';

class AttendanceStudentItem extends StatelessWidget {
  final StudentAttendance student;
  final VoidCallback onTap;

  const AttendanceStudentItem(
      {Key? key, required this.student, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.liteDark,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  UserImage(
                    profilePic: student.profilePic != ''
                        ? '${F.baseUrl}'
                            '/admin/images/student/'
                            '${student.studentDetailId}/${student.profilePic}'
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  student.feeType == 'monthly'
                      ? Text(
                          'Monthly',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                        )
                      : Text(
                          'Class Based',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: AppColors.green,
                                  ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Attendance: ${student.present}',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppColors.textColor,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
