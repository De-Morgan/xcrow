import 'package:flutter/material.dart';
import 'package:xcrow/ui/utils/keyboard_utils.dart';

class CloseKeyboardWidget extends StatelessWidget {
  const CloseKeyboardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: KeyboardUtils.closeKeyboard, child: child);
  }
}
