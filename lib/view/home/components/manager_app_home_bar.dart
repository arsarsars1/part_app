import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/home/components/manager_app_profile_button.dart';
import 'package:part_app/view/notifications/manager_app_notification_screen.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/home/home_cubit.dart';
import 'package:part_app/view_model/notification/cubit/notification_cubit.dart';

class ManagerAppHomeBar extends StatelessWidget {
  const ManagerAppHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    var homeCubit = context.read<HomeCubit>();
    var notificationCubit = context.read<NotificationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      NotificationList? list = await homeCubit.getManagerAppNotificationList(
          managerId: context
                  .read<AuthCubit>()
                  .user
                  ?.managerDetail?[context.read<AuthCubit>().managerIndex]
                  .id ??
              0,
          clean: true);
      notificationCubit.emitNotificationBadge(list);
    });
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(right: 32.w),
                    child: Text(
                      (cubit.user?.managerDetail?[cubit.managerIndex].academy
                              ?.academyName ??
                          'N/A'),
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18.sp,
                          ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                DateTime.now().toEEMMDD(),
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.violet,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ]),
      ),
      const ManagerProfileButton(),
      SizedBox(
        width: 8.w,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ManagerAppNotificationScreen.route);
        },
        child: Stack(children: [
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
                    ]),
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
        ]),
      ),
    ]);
  }
}
