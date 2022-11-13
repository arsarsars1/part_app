import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/batch_request.dart';

part 'batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  BatchCubit() : super(BatchInitial());

  List<Days> _days = [];

  List<Days> get days => _days;

  void addDay(Days day) {
    _days.removeWhere((element) => element.day == day.day);
    _days.add(day);
    print(_days);
    emit(DaysUpdated());
  }
}
