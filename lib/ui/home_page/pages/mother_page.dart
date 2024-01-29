import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/pages/home_page.dart';
import 'package:xcrow/ui/home_page/widgets/button_nav_widget.dart';

class MotherPage extends ConsumerWidget {
  const MotherPage({super.key});

  static const pages = [
    HomePage(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
