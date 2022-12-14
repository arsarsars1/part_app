import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/view_model/cubits.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  StudentRequest _studentRequest = const StudentRequest();

  StudentRequest get studentRequest => _studentRequest;

  void setStudent(StudentRequest request) {
    _studentRequest = request;
  }
}
