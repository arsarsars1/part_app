// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/faq_list.dart';
import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/model/data_model/student_dashboard.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/model/service/dashboard/dashboard_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _service = DashboardService();
  List<Banner>? _banner;
  StudentDashboard? _studentDashboardItems;
  List<NotificationData>? _notifications;
  List<FaqList?>? _faqList;
  int? _totalStudents;
  String? _dailyCollection;
  String? _monthlyCollection;
  List<Banner>? get banner => _banner;
  List<FaqList?>? get faqList => _faqList;
  List<NotificationData?>? get notifications => _notifications;
  StudentDashboard? get studentDashboardItems => _studentDashboardItems;
  int? get totalStudents => _totalStudents;
  String? get dailyCollection => _dailyCollection;
  String? get monthlyCollection => _monthlyCollection;
  late DateTime selectedDate;

  // pagination
  int page = 1;
  String? nextPageUrl = '';

  String? feePayments;
  List<TrainerSalaryPayment?>? trainerSalaryPayments;
  List<ScheduledClass?>? scheduledClasses;
  List<ScheduledClass?>? rescheduledClasses;
  List<StudentsJoined?>? studentsJoined;
  List<TrainersJoined?>? trainersJoined;
  List<Lead?>? followUpLeads;
  List<Lead?>? newLeads;

  bool flag = false;

  Future getDashboard() async {
    emit(DashboardLoading());
    var tempDash = await _service.getDashboard();
    if (tempDash?.status == 1) {
      _totalStudents = tempDash?.totalStudents;
      _dailyCollection = tempDash?.totalPaymentsDaily;
      _monthlyCollection = tempDash?.totalPaymentsMonthly;
      _banner = tempDash?.banners;
      emit(DashboardLoaded());
    }
  }

  Future getStudentAppDashboard({int? studentId}) async {
    emit(DashboardLoading());
    var tempDash = await _service.getStudentAppDashboard(studentId: studentId);
    if (tempDash?.status == 1) {
      _studentDashboardItems = tempDash;
      emit(DashboardLoaded());
    }
  }

  Future getCalenderEvents({
    required String date,
    bool clean = true,
  }) async {
    if (clean) {
      feePayments = null;
      trainerSalaryPayments?.clear();
      scheduledClasses?.clear();
      rescheduledClasses?.clear();
      studentsJoined?.clear();
      trainersJoined?.clear();
      followUpLeads?.clear();
      newLeads?.clear();
      emit(GettingCalenderEvents());
    } else {
      emit(GettingCalenderEvents(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(GotCalenderEvents());
      return;
    }

    CalenderEventsList? temp = await _service.getCalenderEvents(
      date: date,
    );
    if (temp?.status == 1) {
      feePayments = temp?.data?.feePayments;
      trainerSalaryPayments = temp?.data?.trainerSalaryPayments;
      scheduledClasses = temp?.data?.scheduledClasses;
      rescheduledClasses = temp?.data?.rescheduledClasses;
      studentsJoined = temp?.data?.studentsJoined;
      trainersJoined = temp?.data?.trainersJoined;
      followUpLeads = temp?.data?.followUpLeads;
      newLeads = temp?.data?.newLeads;
      emit(GotCalenderEvents());
    } else {
      emit(GetCalenderEventsFailed('Failed to get the calender events list'));
    }
  }

  Future getNotificationList({
    bool clean = true,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      notifications?.clear();
      emit(GettingNotifications());
    } else {
      emit(GettingNotifications(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(GotNotifications());
      return;
    }

    NotificationList? temp =
        await _service.getNotifications(page: (page).toString());
    if (temp?.status == 1) {
      nextPageUrl = temp?.notifications?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      var items = temp?.notifications?.data ?? [];

      List<NotificationData> tempNotifications = [];

      for (var notification in items) {
        tempNotifications.add(notification);
      }

      _notifications?.addAll(tempNotifications);
      _notifications?.forEach((element) {
        if (element.readAt == null) {
          flag = true;
        }
      });
      emit(GotNotifications());
    } else {
      emit(GetNotificationsFailed('Failed to get the notification list'));
    }
  }

  Future getStudentAppNotificationList({
    int? studentId,
    bool clean = true,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      notifications?.clear();
      emit(GettingNotifications());
    } else {
      emit(GettingNotifications(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(GotNotifications());
      return;
    }

    NotificationList? temp = await _service.getStudentAppNotifications(
        studentId: studentId, page: (page).toString());
    if (temp?.status == 1) {
      nextPageUrl = temp?.notifications?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = temp?.notifications?.data ?? [];

      List<NotificationData> tempNotifications = [];

      for (var notification in items) {
        tempNotifications.add(notification);
      }

      _notifications?.addAll(tempNotifications);

      _notifications?.forEach((element) {
        if (element.readAt == null) {
          flag = true;
        }
      });
      emit(GotNotifications());
    } else {
      emit(GetNotificationsFailed('Failed to get the notification list'));
    }
  }

  Future readNotification(String? notificationId) async {
    try {
      emit(ReadingNotification());
      Common? response = await _service.readNotification(notificationId);

      if (response?.status == 1) {
        emit(ReadNotification(response?.message ?? 'Notification Read'));
      } else {
        emit(ReadNotificationFailed(
            response?.message ?? 'Failed to read notification'));
      }
    } catch (e) {
      return null;
    }
  }

  String createTrainerString(List<String>? trainers) {
    String trainer = '';
    if (trainers != null && trainers.isNotEmpty) {
      for (var element in trainers) {
        trainer += '$element, ';
      }
      trainer = trainer.trimRight().removeLast();
    } else {
      trainer = 'No Trainer Allocated';
    }
    return trainer;
  }

  Future readStudentAppNotification(
      int? studentId, String? notificationId) async {
    try {
      emit(ReadingNotification());
      Common? response =
          await _service.readStudentAppNotification(studentId, notificationId);

      if (response?.status == 1) {
        emit(ReadNotification(response?.message ?? 'Notification Read'));
      } else {
        emit(ReadNotificationFailed(
            response?.message ?? 'Failed to read notification'));
      }
    } catch (e) {
      return null;
    }
  }

  Future deleteNotification(String? notificationId) async {
    try {
      emit(DeletingNotification());
      Common? response = await _service.deleteNotification(notificationId);

      if (response?.status == 1) {
        emit(DeletedNotification(response?.message ?? 'Notification Deleted'));
      } else {
        emit(DeleteNotificationFailed(
            response?.message ?? 'Failed to delete notification'));
      }
    } catch (e) {
      return null;
    }
  }

  Future deleteStudentAppNotification(
      int? studentId, String? notificationId) async {
    try {
      emit(DeletingNotification());
      Common? response = await _service.deleteNotification(notificationId);

      if (response?.status == 1) {
        emit(DeletedNotification(response?.message ?? 'Notification Deleted'));
      } else {
        emit(DeleteNotificationFailed(
            response?.message ?? 'Failed to delete notification'));
      }
    } catch (e) {
      return null;
    }
  }

  String getTimeDifference(DateTime targetDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(targetDateTime);

    if (difference.isNegative) {
      return "The target time has already passed.";
    }

    int years = difference.inDays ~/ 365;
    int months = (difference.inDays % 365) ~/ 30;
    int weeks = (difference.inDays % 365) ~/ 7;
    int days = difference.inDays % 7;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    String timeDifference = "";

    if (years > 0) {
      timeDifference = "${years}y ";
      return timeDifference.trim();
    }

    if (months > 0) {
      timeDifference = "${months}m ";
      return timeDifference.trim();
    }

    if (weeks > 0) {
      timeDifference = "${weeks}w ";
      return timeDifference.trim();
    }

    if (days > 0) {
      timeDifference = "${days}d ";
      return timeDifference.trim();
    }

    if (hours > 0) {
      timeDifference = "${hours}h ";
      return timeDifference.trim();
    }

    if (minutes > 0) {
      timeDifference = "${minutes}m ";
      return timeDifference.trim();
    }

    if (seconds > 0) {
      timeDifference = "${seconds}s ";
      return timeDifference.trim();
    }
    return timeDifference.trim();
  }

  /// this method is used to get the classes of a batch in a particular month
  Future getFAQ() async {
    _faqList?.clear();
    emit(FetchingFAQ());
    List<FaqList?>? response = await _service.getFAQList();
    if ((response ?? []).isNotEmpty) {
      _faqList = response;
      emit(FetchedFAQ());
    } else {
      emit(FetchFAQFailed("Error fetching the FAQ List"));
    }
  }

  Future<int> sendSupportRequest(Map<String, dynamic> data) async {
    try {
      Common? response = await _service.sendSupportRequest(data);

      if (response?.status == 1) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}
