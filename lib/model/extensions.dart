import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toDateString() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toServerString() {
    return DateFormat('yyyy/MM/dd').format(this);
  }

  String toEEMMDD() {
    return DateFormat('EEEE, MMMM dd').format(this);
  }

  String toTime() {
    return DateFormat.jm().format(this);
  }

  /// Formats the [ DateTime ] to 12th Aug, 2021
  String formattedString() {
    var suffix = "th";
    var digit = day % 10;
    if ((digit > 0 && digit < 4) && day < 11 || day > 13) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMM, yyyy").format(this);
  }
}
