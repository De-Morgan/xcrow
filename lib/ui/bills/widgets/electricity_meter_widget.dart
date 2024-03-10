import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class ElectricityMeterNumber extends HookConsumerWidget {
  const ElectricityMeterNumber({super.key});

  int get meterNumberLength => 11;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    //
    // void transferNumberListener() {
    //   if (controller.text.length == meterNumberLength) {
    //     ref.read(meterNumberProvider.notifier).state = controller.text;
    //   } else {
    //     ref.invalidate(meterNumberProvider);
    //   }
    // }
    //
    // useEffect(
    //   () {
    //     controller.addListener(transferNumberListener);
    //     return () => controller.removeListener(transferNumberListener);
    //   },
    //   const [],
    // );
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: (value) =>
          ref.read(meterNumberProvider.notifier).state = value,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(meterNumberLength)
      ],
      decoration: const InputDecoration(hintText: 'Meter Number'),
      validator: (value) => value.nullToEmpty.length != meterNumberLength
          ? 'Enter a valid meter number'
          : null,
    );
  }
}

final meterNumberProvider = StateProvider.autoDispose<String>((ref) => '');
