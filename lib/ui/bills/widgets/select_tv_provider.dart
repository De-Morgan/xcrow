import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/core/models/tv_cable.dart';
import 'package:xcrow/ui/bills/pages/select_electricity_provider.dart';
import 'package:xcrow/ui/shared/drop_down_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

import 'package:xcrow/ui/bills/provider/tv_cable.dart';

class SelectTvProviderWidget extends ConsumerWidget {
  const SelectTvProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppDropDownWidget<TvCable>(
      data: TvCable.values,
      title: 'Choose a provider',
      builder: (TvCable data) => Text(data.desc),
      onChange: (value) =>
          ref.read(selectedTvCableProvider.notifier).state = value,
    );
  }
}

class SelectTvPackageWidget extends ConsumerWidget {
  const SelectTvPackageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceId =
        ref.watch(selectedTvCableProvider.select((value) => value?.name));
    final package = ref.watch(tvPackageProvider(serviceId));
    final variation = ref.watch(selectedTvPackageProvider);
    return package.maybeWhen(
        data: (packages) =>
            packages ==null?AppDropDownWidget(
              key: UniqueKey(),
              title: 'Choose a package',
              builder: (data) => const SizedBox(),
            ) :
            AppDropDownWidget<TvVariation>(
              key: UniqueKey(),
              data: packages.varations,
              initialData: variation,
              title: 'Choose a package',
              builder: (data) => Text('${data.name}'),
              onChange: (package)=>ref.read(selectedTvPackageProvider.notifier).state = package
            ),
        orElse: () => const SizedBox(),
        error: (error,_)=>Text('$error'),
        loading: () => AppDropDownWidget(
              title: 'Choose a package',
              key: UniqueKey(),
              loading: (StreamController<bool>()..add(true)).stream,
              builder: (data) => const SizedBox(),
            ));
  }
}

//,
