import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/notifications/widgets/custom_container_for_notification.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/notification/cubit/notification_cubit.dart';

class NotificationScreen extends StatefulWidget {
  static const route = '/notifications';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StudentCubit>().clean();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    var notificationCubit = context.read<NotificationCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Notifications',
      ),
      body: FutureBuilder(
        future: cubit.getNotificationList(clean: true),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is GetNotificationsFailed) {
                Alert(context).show(message: state.message);
              } else if (state is ReadNotificationFailed) {
                Alert(context).show(message: state.message);
              } else if (state is ReadNotification) {
                Alert(context).show(message: state.message);
                cubit.getNotificationList(clean: true);
              } else if (state is DeleteNotificationFailed) {
                Alert(context).show(message: state.message);
              } else if (state is DeletedNotification) {
                Alert(context).show(message: state.message);
                cubit.getNotificationList(clean: true);
              }
            },
            builder: (context, state) {
              if (state is ReadingNotification ||
                  state is DeletingNotification) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (cubit.notifications == null || cubit.notifications!.isEmpty) {
                return const Center(child: Text('No notification'));
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        context
                            .read<HomeCubit>()
                            .getNotificationList(clean: false);
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.notifications?.length,
                            itemBuilder: (context, index) {
                              NotificationData? notification =
                                  cubit.notifications?[index];
                              return GestureDetector(
                                onTap: () async {
                                  //if notification is read, bagde is refreshed
                                  final isSuccess = await cubit
                                      .readNotification(notification?.id);
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
                                          cubit.deleteNotification(
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
              }
            },
          );
        },
      ),
    );
  }
}
