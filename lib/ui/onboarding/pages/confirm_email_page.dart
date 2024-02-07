import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

import '../providers/email_otp_provider.dart';
import '../providers/selected_phone_number.dart';
import 'sign_up_step_three.dart';

class ConfirmEmailPage extends HookConsumerWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otp = useTextEditingController();

    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: '',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
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
                TextField(
                  controller: otp,
                ),
                const SizedBox(height: 12),
                HookConsumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final loading = useState<bool>(false);
                    return InkWell(
                      onTap: () async {
                        try {
                          loading.value = true;
                          await ref.read(sendEmailOtpProvider.future);
                          context.showToast('Code sent');
                        } catch (_) {
                        } finally {
                          loading.value = false;
                        }
                      },
                      child: Text(
                        switch (loading.value) {
                          false => 'Resend Code',
                          true => 'Resending...'
                        },
                        style: context.bodyMedium?.copyWith(
                            color: const Color(0xff33F413),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 52),
                // TextActionRow(
                //   title: 'Email address is not correct? ',
                //   action: 'Edit',
                // ),
                // const SizedBox(height: 16),
                AppButton.elevatedButton(
                  onPressed: () {
                    final code = ref.read(emailOtpProvider.notifier).state;
                    final inputCode = otp.text;
                    if (code != inputCode) {
                      context.showToast('Invalid code');
                      return;
                    }
                    context.push(const SignUpStepThree());
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
