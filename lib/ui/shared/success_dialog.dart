import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme<DashboardTheme>();
    return Container(
      decoration: BoxDecoration(
          color: theme.background, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          CircleAvatar(
            radius: 48,
            backgroundColor: context.primaryColor,
            child: const SvgWidget(svgPath: SvgPath.check),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 20,
                      fontFamily: FontFamily.light,
                      color: context.primaryColor,
                      fontWeight: FontWeight.w200),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: AppButton.elevatedButton(
              label: 'Okay',
              onPressed: () {
                context.pop(true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
