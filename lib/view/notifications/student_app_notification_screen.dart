import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/notifications/widgets/custom_container_for_notification.dart';
import 'package:part_app/view_model/cubits.dart';

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
  AuthCubit? authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
      context.read<HomeCubit>().getStudentAppNotificationList(
          studentId: authCubit?.user?.studentDetail?[0].id, clean: true);
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().getStudentAppNotificationList(
            studentId: authCubit?.user?.studentDetail?[0].id, clean: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
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
                      studentId: authCubit?.user?.studentDetail?[0].id,
                      clean: true);
                } else if (state is DeleteNotificationFailed) {
                  Alert(context).show(message: state.message);
                } else if (state is DeletedNotification) {
                  Alert(context).show(message: state.message);
                  cubit.getStudentAppNotificationList(
                      studentId: authCubit?.user?.studentDetail?[0].id,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: cubit.notifications?.length,
                          itemBuilder: (context, index) {
                            NotificationData? notification =
                                cubit.notifications?[index];
                            return GestureDetector(
                              onTap: () {
                                cubit.readStudentAppNotification(
                                    authCubit?.user?.studentDetail?[0].id,
                                    notification?.id);
                              },
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        cubit.deleteStudentAppNotification(
                                            authCubit
                                                ?.user?.studentDetail?[0].id,
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
                                          Text('${notification?.data?.title}'),
                                          Text(
                                            cubit.getTimeDifference(notification
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
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      AnimatedContainer(
                        height:
                            state is GettingNotifications && state.pagination
                                ? 30
                                : 0,
                        color: Colors.black,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child:
                            const Center(child: Text('Fetching more items ..')),
                      )
                    ],
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
