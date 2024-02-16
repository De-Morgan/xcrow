import 'package:flutter/material.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AppBarCircle extends StatelessWidget {
  const AppBarCircle({super.key, this.size = 46});
  final double size;
  @override
  Widget build(BuildContext context) {
    final homeCircularTheme = context.customTheme<HomeCircularTheme>();
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: homeCircularTheme.border, width: 8),
          color: homeCircularTheme.background,
          shape: BoxShape.circle),
    );
  }
}
