import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/padded_container.dart';

class ScaffoldPagePaddingWidget extends StatelessWidget {
  const ScaffoldPagePaddingWidget(
      {super.key,
      this.horizontal = 16,
      this.alignment = Alignment.topLeft,
      required this.child});

  final Widget child;
  final double horizontal;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        horizontalPadding: horizontal,
        alignment: alignment,
        child: child,
      ),
    );
  }
}
