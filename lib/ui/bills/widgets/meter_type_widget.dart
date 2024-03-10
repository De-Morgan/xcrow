import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/ui/bills/provider/electricity.dart';
import 'package:xcrow/ui/shared/drop_down_widget.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class MeterTypeWidget extends ConsumerWidget {
  const MeterTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialMeter = ref.watch(selectedMeterType);
    return AppDropDownWidget<MeterType>(
      data: MeterType.values,
      initialData: initialMeter,
      title: 'Select package',
      builder: (MeterType data) {
        return Text(data.name.capitalize);
      },
    );
  }
}
