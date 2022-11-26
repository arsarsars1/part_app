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

  String toDDMMYYY() {
    return DateFormat('dd MMM, yyyy').format(this);
  }

  String toTime() {
    return DateFormat.jm().format(this);
  }

  /// Formats the [ DateTime ] to 12th Aug, 2021
  String formattedString() {
    try {
      var suffix = "th";
      var digit = day % 10;
      if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
        suffix = ["st", "nd", "rd"][digit - 1];
      }
      return DateFormat("d'$suffix' MMM, yyyy").format(this);
    } catch (e) {
      return '';
    }
  }
}

extension StringExtension on String {
  String currencyFormat() {
    return NumberFormat("#,##,###", "en_US").format(double.parse(this));
  }

  String capitalize() {
    if (trim().isEmpty) return "";

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String removeLast() {
    if (length > 0) {
      return trim().substring(0, length - 1);
    }

    return '';
  }
}
