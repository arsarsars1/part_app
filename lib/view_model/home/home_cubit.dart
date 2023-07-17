// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/calender_events_list.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/service/dashboard/dashboard_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _service = DashboardService();
  List<Banner>? _banner;

  List<Banner>? get banner => _banner;

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

  Future getDashboard() async {
    emit(DashboardLoading());
    var tempDash = await _service.getDashboard();
    _banner = tempDash?.banners;
    emit(DashboardLoaded());
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
}
