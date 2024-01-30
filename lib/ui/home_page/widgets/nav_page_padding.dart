import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/padded_container.dart';

class ScaffoldPagePaddingWidget extends StatelessWidget {
  const ScaffoldPagePaddingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        horizontalPadding: 16,
        child: child,
      ),
    );
  }
}
