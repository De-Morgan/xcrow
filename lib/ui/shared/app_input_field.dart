import 'package:flutter/material.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AppInputField extends StatelessWidget {
  const AppInputField(
      {Key? key, this.title = '', this.titleWidget, required this.child})
      : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget ??
            Text(title, style: context.titleMedium?.copyWith(fontSize: 13)),
        const SizedBox(height: 9),
        child
      ],
    );
  }
}
