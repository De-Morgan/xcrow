import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/utils/contact_service.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class PhoneNumberWidget extends HookConsumerWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final phone = ref.watch(phoneNumberProvider);
    // final userNumber = ref.watch(userProvider.select((value) => value.phone));
    // useEffect(
    //   () {
    //     if (phone.text.isEmpty) {
    //       phone.text = '$userNumber' ?? '';
    //     }
    //     return;
    //   },
    //   const [],
    // );
    return AppInputField(
      titleWidget: Row(
        children: [
          Text('Phone Number',
              style: context.titleMedium?.copyWith(fontSize: 13)),
          const Spacer(),
          InkWell(
            onTap: () async {
              final number = await ContactService().pickPhoneNumber();
              if (number != null) {
                phone.text = number.sanitizePhoneNumber;
              }
            },
            child: Text(
              'Choose contact',
              style: context.titleSmall?.copyWith(
                  fontSize: 13,
                  color: appColor.outlineColor,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      child: TextFormField(
        controller: phone,
        decoration: const InputDecoration(hintText: '09031193287'),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) =>
            value.nullToEmpty.isNotEmpty ? null : 'Enter a valid phone number',
      ),
    );
  }
}
