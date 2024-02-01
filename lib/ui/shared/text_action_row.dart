import 'package:flutter/material.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class TextActionRow extends StatelessWidget {
  const TextActionRow(
      {super.key,
      required this.title,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.action});
  final String title;
  final String action;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w200, fontFamily: FontFamily.light),
        ),
        Text(
          action,
          style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w200, fontFamily: FontFamily.light),
        )
      ],
    );
  }
}
