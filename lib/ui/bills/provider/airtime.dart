import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/network.dart';
import 'package:xcrow/ui/utils/provider_ref_extension.dart';

final amountProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);

final phoneNumberProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);

final selectedAirtimeProvider = StateProvider<Network?>((ref) {
  return null;
});
