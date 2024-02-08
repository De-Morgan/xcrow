import 'package:flutter/material.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

class PlatFormDatePicker {
  static Future<DateTime?> pickData(BuildContext context,
      {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    return showPlatformDatePicker(
      context: context,
      firstDate: firstDate ?? DateTime(DateTime.now().year - 120),
      initialDate: initialDate ?? DateTime(DateTime.now().year - 21),
      lastDate: lastDate ?? DateTime(DateTime.now().year + 1),
    );
  }

  static Future<TimeOfDay?> pickTime(BuildContext context,
      {required TimeOfDay initialTime}) async {
    return showTimePicker(
        context: context,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!),
        initialTime: initialTime);
  }
}
