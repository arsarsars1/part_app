import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/ClassesToday.dart';
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

  Future getClassesToday() async {
    emit(FetchingClassesToday());
    ClassesToday? response = await _classesTodayService.getClassesToday();

    if (response?.classes != null) {
      _classes = response?.classes?? [];
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
