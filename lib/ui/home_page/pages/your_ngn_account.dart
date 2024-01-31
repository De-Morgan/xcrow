import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class YourNgnAccountPage extends StatelessWidget {
  const YourNgnAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Your NGN Account',
      ),
      body: SingleChildScrollView(
        child: PaddedContainer(
          horizontalPadding: 48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                "Money Transfers sent to this bank account number will automatically top up your Paytal wallet. Receive your salary or fund from any bank account locally, directly into your Paytal wallet.",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 24),
              AppListTile(
                title: 'Account Name',
                subtitle: 'Goodness Bassey Davies',
                padding: EdgeInsets.zero,
                trailing: _CopyRow(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
              AppListTile(
                title: 'Account Number',
                subtitle: '7788103395',
                padding: EdgeInsets.zero,
                trailing: _CopyRow(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
              AppListTile(
                title: 'Bank Name',
                subtitle: 'Paytal Digital service Bank',
                padding: EdgeInsets.zero,
                trailing: _CopyRow(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CopyRow extends StatelessWidget {
  const _CopyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgWidget(
          svgPath: SvgPath.copy,
        ),
        const SizedBox(width: 8),
        Text(
          'Copy',
          style: TextStyle(fontSize: 13),
        )
      ],
    );
  }
}
