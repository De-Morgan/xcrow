import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/close_keyboard_widget.dart';

class PaddedContainer extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;
  final Widget child;
  final Alignment alignment;
  final Color? color;

  const PaddedContainer(
      {Key? key,
      this.horizontalPadding = 24,
      this.verticalPadding = 0,
      required this.child,
      this.color,
      this.alignment = Alignment.topLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CloseKeyboardWidget(
        child: Container(
          color: color,
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}
