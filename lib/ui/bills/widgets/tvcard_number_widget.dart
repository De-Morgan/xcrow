



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/provider_ref_extension.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class TvCardNumberWidget extends ConsumerWidget {
  const TvCardNumberWidget({super.key});

  int get meterNumberLength => 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =  ref.watch(tvCardNumberTxtCtrProvider);
    return TextFormField(
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(meterNumberLength)
      ],
      decoration: const InputDecoration(
          hintText: 'Smart Card Numbers'
      ),
      validator: (value) => value.nullToEmpty.length < 5
          ? 'Enter a valid card number'
          : null,
    );
  }
}

final tvCardNumberProvider = StateProvider.autoDispose<String>((ref) => '');
final tvCardNumberTxtCtrProvider = Provider.autoDispose<TextEditingController>((ref) => ref.textController);
