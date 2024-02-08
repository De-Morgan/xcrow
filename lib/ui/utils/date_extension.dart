import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DataTimeExtension on DateTime? {
  /// 5 Jul, 2021
  String formatDateReadable() {
    if (this == null) return '';
    return DateFormat('dd MMM, yyyy').format(this!.toLocal());
  }

  /// Jul 5, 2021
  String formatDateReadableMonthFirst() {
    if (this == null) return '';
    return DateFormat('MMM dd, yyyy').format(this!.toLocal());
  }

  /// July 5, 2021
  String formatDateReadableMonthFirstFull() {
    if (this == null) return '';
    return DateFormat('MMMM dd, yyyy').format(this!.toLocal());
  }

  /// 5, July
  String formatDayMonth() {
    if (this == null) return '';
    return DateFormat('d MMMM').format(this!.toLocal());
  }

  /// 5, July
  String formatOnlyDay() {
    if (this == null) return '';
    return DateFormat('d').format(this!.toLocal());
  }

  /// 5 July, 2021
  String formatReadableDateFull() {
    if (this == null) return '';
    return DateFormat('dd MMMM, yyyy').format(this!.toLocal());
  }

  /// 10/12/2022, 10:30 AM
  String formatDateWithTime() {
    if (this == null) return '';
    return DateFormat('dd/MM/yyyy,').add_jm().format(this!.toLocal());
  }

  /// 10-12-2022
  String formatDateDashSeparated() {
    if (this == null) return '';
    return DateFormat('dd-MM-yyyy').format(this!.toLocal());
  }

  String formatUse() {
    if (this == null) return '';
    String suffix = "th";
    final digit = this!.day % 10;
    if ((digit > 0 && digit < 4) && (this!.day < 11 || this!.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("MMM d'$suffix'").format(this!.toLocal());
  }

  //  Jul 5th
  String formatDateReadable2() {
    if (this == null) return '';
    if (isSameDay(DateTime.now())) {
      return 'Today';
    }
    if (DateTime.now().isYesterday(this!)) {
      return 'Yesterday';
    }
    String suffix = "th";
    final digit = this!.day % 10;
    if ((digit > 0 && digit < 4) && (this!.day < 11 || this!.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("MMM d'$suffix'").format(this!.toLocal());
  }

  String formatToWeekday() {
    if (this == null) return '';
    if (isSameDay(DateTime.now())) {
      return 'Today';
    }
    if (DateTime.now().isYesterday(this!.toLocal())) {
      return 'Yesterday';
    }
    return DateFormat('EEEE').format(this!.toLocal());
  }

  String formatToWeekdayShort() {
    if (this == null) return '';
    return DateFormat('EEE').format(this!.toLocal());
  }

  // Monday, January 30:
  String formatToWeekdayMonthDay() {
    if (this == null) return '';
    return DateFormat('EEEE, MMMM dd:').format(this!.toLocal());
  }

  // Monday, January 30, 2023
  String formatToWeekdayMonthDayYear() {
    if (this == null) return '';
    return DateFormat('EEEE, MMMM dd, yyyy').format(this!.toLocal());
  }

  String formatMonth() {
    if (this == null) return '';
    return DateFormat('MMMM').format(this!.toLocal());
  }

  String formatOnlyYear() {
    if (this == null) return '';
    return DateFormat('yyyy').format(this!.toLocal());
  }

  String formatMonthShort() {
    if (this == null) return '';
    return DateFormat('MMM').format(this!.toLocal());
  }

  String formatShortMonthYear() {
    if (this == null) return '';
    return DateFormat('MMM, yyyy').format(this!.toLocal());
  }

  //Thursday 11:41am
  String formatToWeekNdTime() {
    if (this == null) return '';
    return DateFormat('EEEE').add_jm().format(this!.toLocal());
  }

  String formatOnlyTime() {
    if (this == null) return '';
    return DateFormat.jm().format(this!.toLocal());
  }

  bool isSameDay(DateTime other) {
    if (this == null) return false;
    return this!.year == other.year &&
        this!.month == other.month &&
        this!.day == other.day;
  }

  bool isYesterday(DateTime other) {
    if (this == null) return false;
    return this!.year == other.year &&
        this!.month == other.month &&
        this!.day - other.day == 1;
  }

  DateTime? get toDateDay {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day);
  }

  DateTime? addTimeOfDay(TimeOfDay time) {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day, time.hour, time.minute);
  }

  int? differenceInDays(DateTime? other) {
    if (this == null || other == null) return null;
    return this!.difference(other).inDays;
  }
}
