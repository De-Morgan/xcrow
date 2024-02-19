import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class CopyRow extends StatelessWidget {
  const CopyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SvgWidget(
          svgPath: SvgPath.copy,
        ),
        SizedBox(width: 8),
        Text(
          'Copy',
          style: TextStyle(fontSize: 13),
        )
      ],
    );
  }
}
