import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/provider_ref_extension.dart';

final airtimeAmountProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);
