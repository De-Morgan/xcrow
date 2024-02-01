import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/pages/mother_page.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class SignUpStepThree extends StatelessWidget {
  const SignUpStepThree({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Step 3/3',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  "Please enter your email or phone\nnumber to continue !",
                  style: context.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.light,
                      height: 16.4 / 14),
                ),
                const SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(hintText: 'Date of birth'),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(hintText: 'Passwords'),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(hintText: 'Confirm passwords'),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your password must have a minimum of 10 characters. Which should include Uppercase, lowercase, number and special characters.',
                  textAlign: TextAlign.center,
                  style:
                      context.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 32),
                AppButton.elevatedButton(
                  onPressed: () {
                    context.push(MotherPage());
                  },
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
