import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/classes_today.dart';
import 'package:part_app/model/service/admin/classes_today_service.dart';

import '../cubits.dart';

part 'classes_today_state.dart';

class ClassesTodayCubit extends Cubit<ClassesTodayState> {
  ClassesTodayCubit() : super(ClassesTodayInitial());

  final _classesTodayService = ClassesTodayService();
  List<Class>? _classes;
  List<Class>? get classes => _classes;

  void clearClasses() {
    _classes?.clear();
  }

  Future getClassesToday({required String date}) async {
    emit(FetchingClassesToday());
    ClassesToday? response = await _classesTodayService.getClassesToday(
      date: date,
    );

    if (response?.classes != null) {
      _classes = response?.classes ?? [];
      emit(FetchedTodaysClasses());
    } else {
      emit(ClassesTodayLoadingFailed('Failed to fetch the trainers'));
    }
  }

  Future getClassesTodayForManager({required String date, required int managerId}) async {
    emit(FetchingClassesToday());
    ClassesToday? response =
        await _classesTodayService.getClassesTodayForManager(
      date: date,
      managerId: managerId,
    );

    if (response?.classes != null) {
      _classes = response?.classes ?? [];
      emit(FetchedTodaysClasses());
    } else {
      emit(ClassesTodayLoadingFailed('Failed to fetch the trainers'));
    }
  }

  /// reset
  void reset() {
    _classes?.clear();
    emit(ClassesTodayInitial());
  }
}
