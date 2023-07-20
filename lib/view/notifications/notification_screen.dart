import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/notifications/widgets/custom_container_for_notification.dart';
import 'package:part_app/view_model/cubits.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notifications';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Notifications',
      ),
      body: FutureBuilder(
        future: cubit.getNotificationList(clean: false),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is GetNotificationsFailed) {
                Alert(context).show(message: state.message);
              } else if (state is ReadNotificationFailed) {
                Alert(context).show(message: state.message);
              } else if (state is ReadNotification) {
                Alert(context).show(message: state.message);
                cubit.getNotificationList(clean: false);
              } else if (state is DeleteNotificationFailed) {
                Alert(context).show(message: state.message);
              } else if (state is DeletedNotification) {
                Alert(context).show(message: state.message);
                cubit.getNotificationList(clean: false);
              }
            },
            builder: (context, state) {
              if (state is GettingNotifications ||
                  state is ReadingNotification ||
                  state is DeletingNotification) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  itemCount: cubit.notifications?.length,
                  itemBuilder: (context, index) {
                    NotificationData? notification =
                        cubit.notifications?[index];
                    return GestureDetector(
                      onTap: () {
                        cubit.readNotification(notification?.id);
                      },
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                cubit.deleteNotification(notification?.id);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${notification?.data?.title}'),
                                  Text(
                                      "${cubit.getTimeDifference(notification?.createdAt ?? DateTime.now())} ago"),
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
              );
            },
          );
        },
      ),
    );
  }
}
