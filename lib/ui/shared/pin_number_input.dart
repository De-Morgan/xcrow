import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class PinNumberInputWidget extends HookConsumerWidget {
  const PinNumberInputWidget(
      {Key? key,
      required this.controller,
      this.showFingerPrint = false,
      this.fieldLength = 6})
      : super(key: key);
  final TextEditingController controller;
  final bool showFingerPrint;
  final int fieldLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onNumberPressed(int value) {
      if (controller.text.length < fieldLength) {
        controller.text = '${controller.text}${value.toString()}';
      }
    }

    const Widget deleteIcon = SizedBox.shrink();

    final Widget clearWidget = IconButton(
        onPressed: () {
          controller.text = controller.text.substring(
            0,
            max(controller.text.length - 1, 0),
          );
        },
        icon: const Text('Delete'));

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            childAspectRatio: 100 / 96,
            mainAxisExtent: 96,
            crossAxisSpacing: 12),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return deleteIcon;
          }
          if (index == 11) {
            return clearWidget;
          }
          return InkResponse(
            onTap: () {
              if (index == 10) {
                onNumberPressed.call(0);
              } else {
                onNumberPressed.call(index + 1);
              }
            },
            radius: 40,
            child: Container(
              height: 96,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                index == 10 ? '0' : '${index + 1}',
                style: context.textTheme.titleMedium
                    ?.copyWith(fontSize: 40, fontFamily: FontFamily.light),
              ),
            ),
          );
        });
  }
}
