import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/home/components/student_app_profile_button.dart';
import 'package:part_app/view/notifications/student_app_notification_screen.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/home/home_cubit.dart';

import '../../../model/data_model/notification_list.dart';
import '../../../view_model/notification/cubit/notification_cubit.dart';

class StudentAppHomeBar extends StatelessWidget {
  const StudentAppHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    var homeCubit = context.read<HomeCubit>();
    var notificationCubit = context.read<NotificationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      NotificationList? list = await homeCubit.getStudentAppNotificationList(
          studentId: context
              .read<AuthCubit>()
              .user
              ?.studentDetail?[context.read<AuthCubit>().studentIndex]
              .id,
          clean: true);
      notificationCubit.emitNotificationBadge(list);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'part',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 48.sp,
                        ),
                  ),
                  TextSpan(
                    text: 'app.in',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const StudentProfileButton(),
            SizedBox(
              width: 16.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, StudentAppNotificationScreen.route);
              },
              child: Stack(
                children: [
                  Container(
                    height: 36.r,
                    width: 36.r,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Container(
                        color: const Color(0xFFECECEC),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.notification,
                              semanticsLabel: 'Notification Logo',
                              height: 18.h,
                              width: 18.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<NotificationCubit, NotificationState>(
                    builder: (context, state) {
                      if (state is NotificationInitial) {
                        return const SizedBox();
                      }
                      return Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 12.r,
                            width: 12.r,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: Text(
                cubit.user?.studentDetail?[cubit.studentIndex].academy
                        ?.academyName ??
                    'N/A',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                    ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          DateTime.now().toEEMMDD(),
        ),
      ],
    );
  }
}
