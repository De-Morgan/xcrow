import 'package:flutter/material.dart';

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
      this.alignment = Alignment.topRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        alignment: alignment,
        child: child,
      ),
    );
  }
}