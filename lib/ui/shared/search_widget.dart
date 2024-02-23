import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide:
                  context.inputDecorationTheme.enabledBorder!.borderSide),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide:
                  context.inputDecorationTheme.focusedBorder!.borderSide),
          prefixIconConstraints: const BoxConstraints(maxWidth: 56),
          hintText: 'Search',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: SvgWidget(
              svgPath: SvgPath.search,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(maxWidth: 62),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: SvgWidget(
              svgPath: SvgPath.calendar,
            ),
          )),
    );
  }
}
