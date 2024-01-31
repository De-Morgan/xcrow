import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class RoundBorderWidget extends ConsumerWidget {
  const RoundBorderWidget(
      {Key? key,
      this.radius = 8,
      required this.child,
      this.height,
      this.width,
      this.onTap,
      this.color,
      this.padding = const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      this.borderColor})
      : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final double? height;
  final double? width;
  final Color? borderColor, color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                color: borderColor ??
                    context.listTileThemeData.iconColor ??
                    Colors.grey)),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
