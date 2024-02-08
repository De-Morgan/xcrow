import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/date_picker_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/input_validator.dart';

import '../providers/selected_phone_number.dart';

class SignUpStepThree extends HookConsumerWidget with InputValidatorMixin {
  SignUpStepThree({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();

    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Step 3/3',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "Please enter your email or phone\nnumber to continue !",
                    style: context.bodyMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: FontFamily.light,
                        height: 16.4 / 14),
                  ),
                  const SizedBox(height: 32),
                  DatePickerWidget(
                    label: 'Date of birth',
                    lastDate: DateTime.now(),
                    onDateSelected: (date) {
                      ref.read(selectedDateProvider.notifier).state = date;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Passwords'),
                    validator: (password) => isPasswordValid(password)
                        ? null
                        : 'Enter a valid password',
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPassword,
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: 'Confirm passwords'),
                    validator: (pass) => password.text == pass
                        ? null
                        : 'Confirm password does not match',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Your password must have a minimum of 10 characters. Which should include Uppercase, lowercase, number and special characters.',
                    textAlign: TextAlign.center,
                    style: context.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 32),
                  HookConsumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final loading = useStreamController<bool>();
                      final notifier = ref.watch(authProvider.notifier);
                      return AppButton.elevatedButton(
                        loading: loading.stream,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          final date = ref.read(selectedDateProvider);
                          if (date == null) {
                            context.showToast('Select date of birth');
                            return;
                          }
                          final email = ref.read(signupEmailProvider).text;
                          final phone = ref.read(selectedPhoneNumberProvider);
                          final phoneCode = phone?.dialCode ?? '+234';
                          final phoneNumber =
                              phone?.phoneNumber?.replaceFirst(phoneCode, '');
                          final emailOtp = ref.read(emailOtpProvider);
                          final firstname =
                              ref.read(firstNameEmailProvider).text;
                          final surname = ref.read(surnameEmailProvider).text;
                          final username = ref.read(usernameEmailProvider).text;
                          final gender = ref.read(selectedGenderProvider);
                          final language = ref.read(selectedLanguageProvider);

                          final request = SignUpRequest(
                            email: email,
                            password: password.text,
                            phone: '$phoneNumber',
                            countryCode: phone?.isoCode ?? 'NG',
                            phoneCode: phoneCode,
                            otp: emailOtp,
                            firstName: firstname,
                            surName: surname,
                            language: language.name,
                            gender: '${gender?.name}',
                            dateofbirth: date.toIso8601String(),
                          );
                          try {
                            loading.add(true);
                            await notifier.signUp(request);
                            context.popToFirstScreen();
                          } catch (error) {
                            context.showError(error);
                          } finally {
                            loading.add(false);
                          }
                        },
                        label: 'Next',
                      );
                    },
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
