import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

extension DateExtension on DateTime {
  String toDateString() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toServerString() {
    return DateFormat('yyyy/MM/dd').format(this);
  }

  /// format y-m-d
  String toServerYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toEEMMDD() {
    return DateFormat('EEEE, MMMM dd').format(this);
  }

  String toMMMMYYYY() {
    return DateFormat('MMMM, yyyy').format(this);
  }

  String toMMMM() {
    return DateFormat('MMMM').format(this);
  }

  String toYYYY() {
    return DateFormat('yyyy').format(this);
  }

  String toDDMMYYY() {
    return DateFormat('dd MMM, yyyy').format(this);
  }

  String toDDMMMYYY() {
    return DateFormat('dd MMMM, yyyy').format(this);
  }

  String toEEEDDMMYYY() {
    return DateFormat('EEE, dd MMMM yyyy').format(this);
  }

  String toEEEEDDMMYYY() {
    return DateFormat('EEEE, dd MMMM yyyy').format(this);
  }

  String toDay() {
    return DateFormat('EEEE').format(this);
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

  /// Formats the [ DateTime ] to 12th Aug
  String formattedDay() {
    try {
      var suffix = "th";
      var digit = day % 10;
      if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
        suffix = ["st", "nd", "rd"][digit - 1];
      }
      return DateFormat("d'$suffix' EEE").format(this);
    } catch (e) {
      return '';
    }
  }

  /// Formats the [ DateTime ] to Wed
  String formattedDay2() {
    try {
      return DateFormat("EEE").format(this);
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

  String toAmPM() {
    return DateFormat('jm').format(DateFormat('Hm').parse(this));
  }

  DateTime toDateTime() {
    return DateFormat('hh:mm a').parse(this);
  }
}

extension BoolExtension on bool {}

Future<File> getImageFileFromAssets(String assetName) async {
  final ByteData imageData = await rootBundle.load('assets/images/$assetName');
  final Directory tempDir = await getTemporaryDirectory();
  final File file = File('${tempDir.path}/$assetName');
  await file.writeAsBytes(imageData.buffer.asUint8List(), flush: true);
  return file;
}

extension ExpandableWidget on Widget {
  Widget expanded({bool shouldExpand = true}) {
    return shouldExpand ? Expanded(child: this) : this;
  }

  Widget expandButton({bool shouldExpand = true}) {
    return shouldExpand ? Row(children: [Expanded(child: this)]) : this;
  }
}

extension NullRemovalExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNulls() {
    removeWhere((key, value) => value == null || value.toString().isEmpty);
    return this;
  }
}

extension ListExtensions<T> on List<T>? {
  List<T>? updateWhere(bool Function(T) test, T newValue) {
    if (isNotNullAndNotEmpty) {
      for (int i = 0; i < this!.length; i++) {
        if (test(this![i])) {
          this![i] = newValue;
          return this;
        }
      }
    }
    return null;
  }

  bool get isNotNullAndNotEmpty {
    return this != null && this!.isNotEmpty;
  }
}
