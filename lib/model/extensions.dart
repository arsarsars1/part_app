import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toDateString() {
    return DateFormat('yyyy/MM/dd').format(this);
  }
}
