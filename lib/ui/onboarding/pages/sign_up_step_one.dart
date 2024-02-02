import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/onboarding/pages/confirm_email_page.dart';
import 'package:xcrow/ui/onboarding/widgets/social_buttons.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/drop_down_widget.dart';
import 'package:xcrow/ui/shared/text_action_row.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class SignUpStepOne extends StatelessWidget {
  const SignUpStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Sign up',
        ),
        body: Column(
          children: [
            Expanded(
              flex: 20,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      Text(
                        "Create a Xcrow profile with a few details. Your password must have at least 8 characters including letters and a number.",
                        style: context.bodyMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 16.4 / 14),
                      ),
                      SizedBox(height: 32),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          final index = ref.watch(_pageIndexProvider);
                          return IndexedStack(
                            index: index,
                            children: [
                              _StepOneWidget(),
                              child!,
                            ],
                          );
                        },
                        child: _StepTwoWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            SocialButtons(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _StepOneWidget extends ConsumerWidget {
  const _StepOneWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Step 1/3',
            style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w200,
                fontFamily: FontFamily.light,
                fontSize: 17),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: '+234 xxxxxxxxxxxx'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'English'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'Email Address'),
        ),
        SizedBox(height: 52),
        AppButton.elevatedButton(
          label: 'Create an Account',
          onPressed: () {
            ref.read(_pageIndexProvider.notifier).state = 1;
          },
        ),
        SizedBox(height: 24),
        _AlreadyHasAccount()
      ],
    );
  }
}

class _StepTwoWidget extends StatelessWidget {
  const _StepTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Step 2/3',
            style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w200,
                fontFamily: FontFamily.light,
                fontSize: 17),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'First name'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'Surname name'),
        ),
        const SizedBox(height: 20),
        AppDropDownWidget(
          title: 'Gender',
          data: ['Male', 'Female'],
          builder: (data) {
            return Text(data);
          },
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'User Name'),
        ),
        SizedBox(height: 20),
        AppButton.elevatedButton(
          label: 'Next',
          onPressed: () {
            context.push(ConfirmEmailPage());
          },
        ),
        SizedBox(height: 24),
        _AlreadyHasAccount()
      ],
    );
  }
}

class _AlreadyHasAccount extends StatelessWidget {
  const _AlreadyHasAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextActionRow(
      title: 'Already have an account? ',
      action: 'Login',
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

final _pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
