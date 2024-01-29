import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class NewYearWidget extends StatelessWidget {
  const NewYearWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appAsset = context.customTheme<AppAssetTheme>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SvgWidget(
        svgPath: appAsset.newYearSvg,
      ),
    );
  }
}
