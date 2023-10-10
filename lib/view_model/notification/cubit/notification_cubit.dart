// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/data_model/notification_list.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  NotificationList? notificationList;

  refreshBadge(String? notificationId) {
    NotificationData? dataElement = notificationList?.notifications?.data
        ?.firstWhere((element) => element.id == notificationId);
    final newData =
        dataElement?.copyWith(readAt: DateTime.now().toIso8601String());

    emitNotificationBadge(notificationList?.copyWith(
        notifications: notificationList?.notifications?.copyWith(
            data: notificationList?.notifications?.data?.toList()
              ?..remove(dataElement)
              ..add(newData!))));
  }

  emitNotificationBadge(NotificationList? temp) {
    notificationList = temp;
    if (temp?.status == 1) {
      var items = temp?.notifications?.data ?? [];

      List<NotificationData> tempNotifications = [];

      List<NotificationData>? notifications;

      bool flag = false;

      for (var notification in items) {
        tempNotifications.add(notification);
      }

      for (var notification in tempNotifications) {
        notifications = [...notifications ?? [], notification];
      }

      notifications?.forEach((element) {
        if (element.readAt == null) {
          flag = true;
        }
      });
      flag ? emit(NotificationBadge()) : emit(NotificationInitial());
    } else {
      emit(NotificationInitial());
    }
  }

  emitNotificationNew() {
    emit(NotificationBadge());
  }
}
