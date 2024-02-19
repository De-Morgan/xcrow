import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_bar_circle.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/button_container.dart';
import 'package:xcrow/ui/shared/copy_row.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const AppBarWidget(
          centerTitle: true,
          title: 'Transaction',
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 330,
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  ButtonContainer(
                      borderRadius: 0,
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      label: 'Phone & Internet'),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                        text: 'On ',
                        style: context.bodyMedium,
                        children: [
                          TextSpan(
                              text: 'FEB 08, ',
                              style: context.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600)),
                          const TextSpan(text: '2024 at 10:18 AM')
                        ]),
                  ),
                  const SizedBox(height: 32),
                  AppListTile(
                    titleWidget: Text(
                      'N600.00',
                      style: context.bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: 'MTN NG DATA 09031193287',
                  ),
                  const Divider(
                    height: 0,
                  ),
                  AppListTile(
                    titleWidget: Text(
                      'TO',
                      style: context.bodySmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    subtitleWidget: Text(
                      'MTN NG DATA',
                      style: context.bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: const AppBarCircle(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  AppListTile(
                    titleWidget: Text(
                      'Description ',
                      style: context.bodySmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    subtitleWidget: Text(
                      '8.5GB FOR 2 DAYS purchase',
                      style: context.bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  AppListTile(
                    titleWidget: Text(
                      'Payment method',
                      style: context.bodySmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    subtitleWidget: Text(
                      'Bills',
                      style: context.bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Fees',
                          style: context.bodySmall?.copyWith(
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'N0.00',
                          style: context.bodySmall?.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  AppListTile(
                    titleWidget: Text(
                      '\t\t\t\t\t Status',
                      style: context.bodySmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    subtitleWidget: Row(
                      children: [
                        const CircleAvatar(
                          maxRadius: 5,
                          backgroundColor: Color(0xff00DE00),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Successful',
                          style: context.bodySmall?.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  AppListTile(
                    titleWidget: Text(
                      'Transaction Reference',
                      style: context.bodySmall?.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    subtitleWidget: Text(
                      'BM22dce71eb7e',
                      style: context.bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: const CopyRow(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  const AppListTile(
                    title: 'Repeat Transaction',
                    subtitle: 'Report on issues with the payment',
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  const AppListTile(
                    title: 'Report Transaction',
                    subtitle: 'Report on issues with the payment',
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  Row(
                    children: [
                      AppButton.textButton(
                        onPressed: () {},
                        label: 'More Actions',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
