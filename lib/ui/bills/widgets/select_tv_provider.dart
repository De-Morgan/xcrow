

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/ui/bills/pages/select_electricity_provider.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class SelectTvProviderWidget extends HookConsumerWidget {
  const SelectTvProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return TextField(
      onTap: () async {

        //controller.text = electricity?.code ?? '';
      },
      controller: controller,
      readOnly: true,
      decoration: const InputDecoration(
        hintText: 'Choose a provider',
      ),
    );
  }
}


class SelectTvPackageWidget extends HookConsumerWidget {
  const SelectTvPackageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return TextField(
      onTap: () async {

        //controller.text = electricity?.code ?? '';
      },
      controller: controller,
      readOnly: true,
      decoration: const InputDecoration(
        hintText: 'Choose a package',
      ),
    );
  }
}

