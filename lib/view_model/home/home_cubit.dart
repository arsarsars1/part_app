// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/data_model/notification_list.dart';
import 'package:part_app/model/service/dashboard/dashboard_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _service = DashboardService();
  List<Banner>? _banner;
  int? _totalStudents;
  String? _dailyCollection;
  String? _monthlyCollection;
  List<Banner>? get banner => _banner;
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
  List<NotificationData>? notifications;

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
      notifications?.clear();
      emit(GettingNotifications());
    } else {
      emit(GettingNotifications(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(GotNotifications());
      return;
    }

    NotificationList? temp = await _service.getNotifications();
    if (temp?.status == 1) {
      notifications = temp?.notifications;
      emit(GotNotifications());
    } else {
      emit(GetNotificationsFailed('Failed to get the calender events list'));
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

  String getTimeDifference(DateTime targetDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(targetDateTime);

    if (difference.isNegative) {
      return "The target time has already passed.";
    }

    // int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    // int seconds = difference.inSeconds.remainder(60);

    String timeDifference = "";

    // if (days > 0) {
    //   timeDifference += "${days}d ";
    // }

    if (hours > 0) {
      timeDifference += "${hours}h ";
    }

    if (minutes > 0) {
      timeDifference += "${minutes}m ";
    }

    // if (seconds > 0) {
    //   timeDifference += "${seconds}s ";
    // }

    return timeDifference.trim();
  }
}
