import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

typedef DropDownBuilder<T> = Widget Function(T data);

class AppDropDownWidget<T> extends HookConsumerWidget {
  final String title;
  final List<T> data;
  final Stream<bool>? loading;
  final T? initialData;
  final DropDownBuilder<T> builder;
  final ValueChanged<T>? onChange;
  final Color? fillColor;
  final bool readOnly;

  const AppDropDownWidget({
    this.title = '',
    this.data = const [],
    required this.builder,
    this.fillColor,
    this.onChange,
    this.initialData,
    this.loading,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedData = useState<T?>(initialData);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: fillColor,
          border: Border.all(
              color: context
                  .themeData.inputDecorationTheme.border!.borderSide.color)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Column(
        children: [
          DropdownButton<T?>(
            isExpanded: true,
            hint: Row(
              children: [
                Text(
                  title,
                  style: context.inputDecorationTheme.hintStyle,
                ),
              ],
            ),
            underline: const SizedBox.shrink(),
            value: selectedData.value,
            items: data
                .map(
                  (e) => DropdownMenuItem<T>(value: e, child: builder(e)),
                )
                .toList(),
            onChanged: readOnly
                ? null
                : (e) {
                    if (e == null) return;
                    selectedData.value = e;
                    onChange?.call(e);
                  },
            alignment: Alignment.center,
            style: context.textTheme.bodyLarge,
          ),
          StreamBuilder<bool>(
              stream: loading,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.requireData) {
                  return const LinearProgressIndicator(
                    minHeight: 1,
                  );
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
