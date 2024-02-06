import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xcrow/core/models/gender.dart';
import 'package:xcrow/core/models/language_enum.dart';
import 'package:xcrow/core/repository/email_repository.dart';
import 'package:xcrow/core/repository/user_repository.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/onboarding/pages/confirm_email_page.dart';
import 'package:xcrow/ui/onboarding/providers/selected_phone_number.dart';
import 'package:xcrow/ui/onboarding/widgets/social_buttons.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/drop_down_widget.dart';
import 'package:xcrow/ui/shared/round_border_widget.dart';
import 'package:xcrow/ui/shared/text_action_row.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/input_validator.dart';

class SignUpStepOne extends StatelessWidget {
  const SignUpStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Sign up',
        ),
        body: SingleChildScrollView(
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
                      style: context.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          height: 16.4 / 14),
                    ),
                    const SizedBox(height: 32),
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
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
              const SocialButtons(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepOneWidget extends ConsumerWidget with InputValidatorMixin {
  _StepOneWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signupEmailProvider);
    final userRepo = ref.watch(userRepositoryProvider);
    return Form(
      key: _formKey,
      child: Column(
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
          RoundBorderWidget(
            // height: 57,
            padding: EdgeInsets.zero,
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber value) {
                ref.read(selectedPhoneNumberProvider.notifier).state = value;
              },
              initialValue: PhoneNumber(isoCode: 'NG'),
              spaceBetweenSelectorAndTextField: 0,
              validator: (_) => null,
              inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 10)),
            ),
          ),
          const SizedBox(height: 20),
          AppDropDownWidget<Language>(
            data: Language.values,
            title: 'Select language',
            initialData: Language.English,
            builder: (Language data) => Text(data.name),
            onChange: (value) =>
                ref.read(selectedLanguageProvider.notifier).state = value,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                isEmailValid(value) ? null : 'Enter a valid email address',
            decoration: const InputDecoration(
              hintText: 'Email Address',
            ),
          ),
          const SizedBox(height: 52),
          HookConsumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final loading = useStreamController<bool>();
              return AppButton.elevatedButton(
                label: 'Create an Account',
                loading: loading.stream,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final phone = ref.read(selectedPhoneNumberProvider);
                  if (phone?.phoneNumber == null) {
                    context.showToast('Enter a valid phone number');
                    return;
                  }
                  try {
                    loading.add(true);
                    await userRepo.phoneExist(phone: '${phone?.phoneNumber}');
                    await userRepo.emailExist(email: email.text);
                    ref.read(_pageIndexProvider.notifier).state = 1;
                  } catch (error) {
                    context.showError(error);
                  } finally {
                    loading.add(false);
                  }
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const _AlreadyHasAccount()
        ],
      ),
    );
  }
}

class _StepTwoWidget extends ConsumerWidget with InputValidatorMixin {
  _StepTwoWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(firstNameEmailProvider);
    final surname = ref.watch(surnameEmailProvider);
    final username = ref.watch(usernameEmailProvider);
    final emailRepo = ref.watch(emailRepositoryProvider);
    return Form(
      key: _formKey,
      child: Column(
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
          TextFormField(
            controller: firstName,
            validator: (value) =>
                isNameValid(value) ? null : 'Enter a valid name',
            decoration: InputDecoration(hintText: 'First name'),
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: surname,
            validator: (value) =>
                isNameValid(value) ? null : 'Enter a valid name',
            decoration: InputDecoration(hintText: 'Surname'),
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 20),
          AppDropDownWidget(
            title: 'Gender',
            data: Gender.values,
            builder: (data) {
              return Text(data.name);
            },
            onChange: (value) =>
                ref.read(selectedGenderProvider.notifier).state = value,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: username,
            validator: (value) =>
                isNameValid(value) ? null : 'Enter a valid username',
            decoration: InputDecoration(hintText: 'Username'),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 20),
          HookConsumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final loading = useStreamController<bool>();
              return AppButton.elevatedButton(
                label: 'Next',
                loading: loading.stream,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final gender = ref.read(selectedGenderProvider);
                  if (gender == null) {
                    context.showToast('Select your gender');
                    return;
                  }
                  try {
                    loading.add(true);
                    final phone = ref.read(selectedPhoneNumberProvider);
                    final email = ref.read(signupEmailProvider).text;
                    final otpResponse = await emailRepo.emailOtp(
                        phoneCode: '${phone?.dialCode}',
                        countryCode: '${phone?.isoCode}',
                        phone: '${phone?.phoneNumber}',
                        email: email);
                    ref.read(emailOtpProvider.notifier).state = otpResponse.otp;
                    print('otpResponse.otp ${otpResponse.otp}');
                    context.push(const ConfirmEmailPage());
                  } catch (error) {
                    context.showError(error);
                  } finally {
                    loading.add(false);
                  }
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const _AlreadyHasAccount(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _AlreadyHasAccount extends StatelessWidget {
  const _AlreadyHasAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextActionRow(
      title: 'Already have an account? ',
      action: 'Login',
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

final _pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
