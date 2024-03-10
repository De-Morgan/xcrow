import 'package:flutter/material.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class CircleLoadingIndicator extends StatelessWidget {
  const CircleLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: context.primaryColor,
    );
  }
}
