import 'dart:convert';

import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/model/service/api_client.dart';

class DashboardService {
  final _apiClient = ApiClient();

  Future<Dashboard?> getDashboard() async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/dashboard');
      Dashboard dashboard = dashboardFromJson(json.encode(response));
      return dashboard;
    } catch (e) {
      return null;
    }
  }

  Future<CalenderEventsList?> getCalenderEvents({required String date}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/calendar/$date',
      );
      return calenderEventsListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<NotificationList?> getNotifications() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/notifications',
      );
      return notificationListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> readNotification(
      String? notificationId) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/notifications/mark-as-read/5dc376a7-cde9-4f45-a5e0-5d46c40f0361',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
