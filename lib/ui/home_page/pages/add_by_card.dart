import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/round_border_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AddByCardPage extends StatelessWidget {
  const AddByCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Add By Card',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Text(
                'You will be charge for adding money with a card',
                style: context.titleMedium?.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 4),
              RoundBorderWidget(
                padding: EdgeInsets.fromLTRB(24, 16, 32, 16),
                borderColor: context.titleMedium?.color,
                child: Row(
                  children: [
                    Text(
                      'Naira Card',
                      style: TextStyle(fontSize: 13),
                    ),
                    Spacer(),
                    Text(
                      'N100+ 1.5% of Amount',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AppListTile(
                title: 'Saved Cards',
                subtitle: 'You currently do not have any saved card',
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 18),
              AppButton.elevatedButton(
                label: 'Add New Card',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
