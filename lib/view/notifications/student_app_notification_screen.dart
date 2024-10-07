// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/notifications/widgets/custom_container_for_notification.dart';
import 'package:part_app/view_model/cubits.dart';

import '../../view_model/notification/cubit/notification_cubit.dart';

class StudentAppNotificationScreen extends StatefulWidget {
  static const route = '/student-app-notifications';
  const StudentAppNotificationScreen({super.key});

  @override
  State<StudentAppNotificationScreen> createState() =>
      _StudentAppNotificationScreenState();
}

class _StudentAppNotificationScreenState
    extends State<StudentAppNotificationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    AuthCubit authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
      context.read<HomeCubit>().getStudentAppNotificationList(
          studentId: authCubit.user?.studentDetail?[authCubit.studentIndex].id,
          clean: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    var notificationCubit = context.read<NotificationCubit>();
    AuthCubit authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Notifications',
      ),
      body: (cubit.notifications ?? []).isNotEmpty
          ? BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetNotificationsFailed) {
                  Alert(context).show(message: state.message);
                } else if (state is ReadNotificationFailed) {
                  Alert(context).show(message: state.message);
                } else if (state is ReadNotification) {
                  Alert(context).show(message: state.message);
                  cubit.getStudentAppNotificationList(
                      studentId: authCubit
                          .user?.studentDetail?[authCubit.studentIndex].id,
                      clean: true);
                } else if (state is DeleteNotificationFailed) {
                  Alert(context).show(message: state.message);
                } else if (state is DeletedNotification) {
                  Alert(context).show(message: state.message);
                  cubit.getStudentAppNotificationList(
                      studentId: authCubit
                          .user?.studentDetail?[authCubit.studentIndex].id,
                      clean: true);
                }
              },
              builder: (context, state) {
                if (state is ReadingNotification ||
                    state is DeletingNotification) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        context.read<HomeCubit>().getStudentAppNotificationList(
                            studentId: authCubit.user
                                ?.studentDetail?[authCubit.studentIndex].id,
                            clean: false);
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.notifications?.length,
                            itemBuilder: (context, index) {
                              NotificationData? notification =
                                  cubit.notifications?[index];
                              return GestureDetector(
                                onTap: () async {
                                  //if notification is read, badge is refreshed
                                  final isSuccess =
                                      await cubit.readStudentAppNotification(
                                          authCubit
                                              .user
                                              ?.studentDetail?[
                                                  authCubit.studentIndex]
                                              .id,
                                          notification?.id);
                                  if (isSuccess) {
                                    notificationCubit
                                        .refreshBadge(notification?.id);
                                  }
                                },
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          cubit.deleteStudentAppNotification(
                                              authCubit
                                                  .user
                                                  ?.studentDetail?[
                                                      authCubit.studentIndex]
                                                  .id,
                                              notification?.id);
                                        },
                                        backgroundColor: AppColors.red,
                                        foregroundColor: AppColors.grey100,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: CustomContainerForNotification(
                                    color: notification?.readAt != null
                                        ? AppColors.liteDark.withOpacity(0.5)
                                        : AppColors.liteDark,
                                    widget: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${notification?.data?.title}'),
                                            Text(
                                              cubit.getTimeDifference(
                                                          notification
                                                                  ?.createdAt ??
                                                              DateTime.now()) !=
                                                      ""
                                                  ? "${cubit.getTimeDifference(notification?.createdAt ?? DateTime.now())} ago"
                                                  : "Now",
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          '${notification?.data?.message}',
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          AnimatedContainer(
                            height: state is GettingNotifications &&
                                    state.pagination
                                ? 30
                                : 0,
                            color: Colors.black,
                            duration: const Duration(
                              milliseconds: 250,
                            ),
                            child: const Center(
                                child: Text('Fetching more items ..')),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('No notifications'),
            ),
    );
  }
}
