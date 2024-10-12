import 'dart:convert';
import 'dart:developer';

import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/data_model/faq_list.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/model/data_model/shop_url.dart';
import 'package:part_app/model/data_model/student_app_calender_events.dart';
import 'package:part_app/model/data_model/student_dashboard.dart';
import 'package:part_app/model/service/api_client.dart';

class DashboardService {
  final _apiClient = ApiClient();

  Future<Dashboard?> getDashboard() async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/dashboard');
      // Dashboard dashboard = dashboardFromJson(jsonEncode(response));
      return dashboardFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Dashboard?> getDashboardForManagerApp({int? managerId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/managers/$managerId/dashboard');
      // Dashboard dashboard = dashboardFromJson(jsonEncode(response));
      return dashboardFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Dashboard?> getDashboardForTrainerApp({int? trainerId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/trainers/$trainerId/dashboard');
      // Dashboard dashboard = dashboardFromJson(jsonEncode(response));
      return dashboardFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentDashboard?> getStudentAppDashboard({int? studentId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/students/$studentId/dashboard');
      // StudentDashboard dashboard =
      //     studentDashboardFromJson(jsonEncode(response));
      return studentDashboardFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<StudentDashboard?> getTrainerAppDashboard({int? trainerId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/trainer/$trainerId/dashboard');
      // StudentDashboard dashboard =
      //     studentDashboardFromJson(jsonEncode(response));
      return studentDashboardFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
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

  Future<CalenderEventsList?> getCalenderEventsForTrainer(
      {required int trainerId, required String date}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/trainers/$trainerId/calendar/$date',
      );
      return calenderEventsListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<CalenderEventsList?> getCalenderEventsForManager(
      {required int managerId, required String date}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/managers/$managerId/calendar/$date',
      );
      return calenderEventsListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAppCalenderEvents?> getStudentAppCalenderEvents(
      {required String date, required int studentId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/students/$studentId/calendar/$date',
      );
      return studentAppCalenderEventsFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<NotificationList?> getNotifications({String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/notifications?page=$page',
      );
      return notificationListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<NotificationList?> getStudentAppNotifications(
      {int? studentId, String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/students/$studentId/notifications?page=$page',
      );
      return notificationListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<NotificationList?> getManagerAppNotifications(
      {int? managerId, String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/managers/$managerId/notifications?page=$page',
      );
      return notificationListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<NotificationList?> getTrainerAppNotifications(
      {int? trainerId, String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/trainers/$trainerId/notifications?page=$page',
      );
      return notificationListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> sendSupportRequest(Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/support',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> sendSupportRequestForTrainer(
      int trainerId, Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/support',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> sendSupportRequestForManager(
      int managerId, Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/managers/$managerId/support',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> sendStudentSupportRequest(
      int studentId, Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/students/$studentId/support',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<List<FaqList?>?> getFAQList({String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/faqs/admin',
      );
      return faqListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<List<FaqList?>?> getFAQListForStudent({String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/faqs/student',
      );
      return faqListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<List<FaqList?>?> getFAQListForTrainer({String? page}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/faqs/trainer',
      );
      return faqListFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> readNotification(String? notificationId) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/notifications/mark-as-read/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<ShopUrl?> getShopUrl({int? trainerId, int? studentId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: trainerId != null
            ? '/trainers/$trainerId/shop-url'
            : studentId != null
                ? '/students/$studentId/shop-url'
                : '/admin/shop-url',
      );
      return shopUrlFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> readNotificationForTrainer(
      int? trainerId, String? notificationId) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainers/$trainerId/notifications/mark-as-read/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> readStudentAppNotification(
      int? studentId, String? notificationId) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/students/$studentId/notifications/mark-as-read/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteNotification(String? notificationId) async {
    try {
      var response = await _apiClient.delete(
        queryPath: '/admin/notifications/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteNotificationForTrainer(
      int? trainerId, String? notificationId) async {
    try {
      var response = await _apiClient.delete(
        queryPath: '/trainers/$trainerId/notifications/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteStudentAppNotification(
      int? studentId, String? notificationId) async {
    try {
      var response = await _apiClient.delete(
        queryPath: '/students/$studentId/notifications/$notificationId',
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
