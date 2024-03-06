import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class ElectricityPage extends ConsumerWidget {
  ElectricityPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final airtimeController = ref.watch(airtimeAmountProvider);
    return const ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Electricity',
        ),
      ),
    );
  }
}
