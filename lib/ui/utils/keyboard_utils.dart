import 'package:flutter/material.dart';

class KeyboardUtils {
  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
