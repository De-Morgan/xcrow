import 'package:flutter/material.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer(
      {super.key,
      this.child,
      this.label = '',
      this.borderRadius = 8,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      required this.onPressed});

  final Widget? child;
  final String label;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: child ??
            Text(
              label,
              style: context.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontFamily: FontFamily.light,
                  fontWeight: FontWeight.w300,
                  color: context
                      .themeData.elevatedButtonTheme.style?.foregroundColor
                      ?.resolve({MaterialState.focused})),
            ),
      ),
    );
  }
}
