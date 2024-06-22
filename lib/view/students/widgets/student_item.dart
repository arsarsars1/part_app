import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/launcher.dart';
import 'package:part_app/view/components/user_image.dart';

class StudentItem extends StatelessWidget {
  final StudentModel student;
  final VoidCallback onTap;

  const StudentItem({Key? key, required this.student, required this.onTap})
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
              flex: 3,
              child: Row(
                children: [
                  UserImage(
                    profilePic: student.profilePic != ""
                        ? '${F.baseUrl}'
                            '/admin/images/student/'
                            '${student.detailId}/${student.profilePic}'
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
                  InkWell(
                    onTap: () {
                      if (student.whatsappNo != null) {
                        Launcher.openWhatsapp(
                          context: context,
                          text: '',
                          number:
                              '+${student.countryCode}${student.whatsappNo}',
                        );
                      }
                    },
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00F260),
                      ),
                      child: SvgPicture.asset(
                        Assets.whatsApp,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Launcher.makePhoneCall(
                        '+${student.countryCode}${student.mobileNo}',
                        context,
                      );
                    },
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0072FF),
                      ),
                      child: SvgPicture.asset(
                        Assets.phone,
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
  }
}
