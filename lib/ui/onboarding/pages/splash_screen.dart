import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:xcrow/ui/home_page/pages/master_page.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(
          const Duration(milliseconds: 500),
          () => context.pushReplacement(
                const MasterPage(),
              ));
      return;
    }, const []);
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child: const SvgWidget(
          svgPath: SvgPath.splashLogo,
        ),
      ),
    );
  }
}
