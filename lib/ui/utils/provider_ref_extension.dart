import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ProviderRefX on ProviderRef {
  TextEditingController get textController {
    final controller = TextEditingController();
    onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}
