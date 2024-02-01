import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/round_border_widget.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/string_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._Social.values.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: RoundBorderWidget(
                  //width: 114,
                  height: 42,
                  child: FittedBox(
                    child: Row(
                      children: [
                        SvgWidget(
                          svgPath: e.svgPath,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          e.name.capitalize,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: FontFamily.light,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )),
            ))
      ],
    );
  }
}

enum _Social { google, facebook, apple }

extension on _Social {
  String get svgPath => switch (this) {
        _Social.google => SvgPath.google,
        _Social.facebook => SvgPath.facebook,
        _Social.apple => SvgPath.apple,
      };
}
