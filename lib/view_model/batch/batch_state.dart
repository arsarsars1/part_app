part of 'batch_cubit.dart';

@immutable
abstract class BatchState {}

class BatchInitial extends BatchState {}

class DaysUpdated extends BatchState {}

class GettingCourses extends BatchState {}

class CoursesUpdated extends BatchState {}
