import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/text_action_row.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: '',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  'Confirm your Email Address',
                  style: context.titleMedium?.copyWith(
                      fontSize: 17,
                      fontFamily: FontFamily.light,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  "We'll send a code to your email address to confirm that it's actually yours.",
                  style: context.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.light,
                      height: 16.4 / 14),
                ),
                const SizedBox(height: 32),
                Text(
                  'contactblugraviti@gmail.com',
                  style: context.titleMedium?.copyWith(
                      fontSize: 16,
                      fontFamily: FontFamily.light,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Verification Code",
                  style: context.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.light,
                      height: 16.4 / 14),
                ),
                const SizedBox(height: 24),
                TextField(),
                const SizedBox(height: 12),
                Text(
                  'Resend Code',
                  style: context.bodyMedium?.copyWith(
                      //todo
                      color: Color(0xff33F413),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 52),
                TextActionRow(
                  title: 'Email address is not correct? ',
                  action: 'Edit',
                ),
                const SizedBox(height: 16),
                AppButton.elevatedButton(
                  onPressed: () {},
                  label: 'Next',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
