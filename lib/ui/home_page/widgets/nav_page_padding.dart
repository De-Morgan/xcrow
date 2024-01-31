import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/padded_container.dart';

class ScaffoldPagePaddingWidget extends StatelessWidget {
  const ScaffoldPagePaddingWidget(
      {super.key, this.horizontal = 16, required this.child});
  final Widget child;
  final double horizontal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        horizontalPadding: horizontal,
        child: child,
      ),
    );
  }
}
