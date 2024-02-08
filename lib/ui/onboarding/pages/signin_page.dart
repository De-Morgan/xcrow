import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';
import 'package:xcrow/ui/onboarding/widgets/social_buttons.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/input_validator.dart';

import 'sign_up_step_one.dart';

class LoginPage extends HookWidget with InputValidatorMixin {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();

    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Login',
          actions: [
            TextButton(
                onPressed: () {
                  context.push(const SignUpStepOne());
                },
                child: const Text('Sign up'))
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        "Create a Xcrow profile with a few details. Your password must have at least 8 characters including letters and a number.",
                        textAlign: TextAlign.center,
                        style: context.bodyMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 16.4 / 14),
                      ),
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          AppInputField(
                            title: 'Email Address',
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) => isEmailValid(value)
                                  ? null
                                  : 'Enter a valid email address',
                              decoration: const InputDecoration(
                                  hintText: 'you@example.com'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppInputField(
                            title: 'Password',
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              obscuringCharacter: '*',
                              validator: (value) => isPasswordValidRelax(value)
                                  ? null
                                  : 'Enter a valid password',
                              decoration: const InputDecoration(hintText: ''),
                            ),
                          ),
                          const SizedBox(height: 32),
                          HookConsumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              final loading = useStreamController<bool>();
                              final notifier = ref.watch(authProvider.notifier);
                              return AppButton.elevatedButton(
                                label: 'Login',
                                loading: loading.stream,
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  try {
                                    loading.add(true);
                                    await notifier.signIn(
                                        email: email.text,
                                        password: password.text);
                                  } catch (error) {
                                    context.showError(error);
                                    password.clear();
                                  } finally {
                                    loading.add(false);
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Or'),
                        ],
                      ),
                      const SocialButtonsVertical(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
