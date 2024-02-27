import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class PinInputWidget extends StatelessWidget {
  final TextEditingController pinController;
  final bool obscureText;
  final bool autoFocus;
  final int length;
  final TextInputType keyboardType;

  const PinInputWidget(
      {Key? key,
      required this.pinController,
      this.obscureText = true,
      this.keyboardType = TextInputType.number,
      this.length = 6,
      this.autoFocus = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 23,
      width: 23,
      textStyle: context.textTheme.bodyText2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: context.themeData.inputDecorationTheme.enabledBorder!
                .borderSide.color),
        //borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
          color: context
              .themeData.inputDecorationTheme.focusedBorder!.borderSide.color),
    );
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: context
          .themeData.inputDecorationTheme.focusedBorder!.borderSide.color
          .withOpacity(0.1),
      border: Border.all(
          color: context
              .themeData.inputDecorationTheme.focusedBorder!.borderSide.color),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Pinput(
          autofocus: autoFocus,
          controller: pinController,
          length: length,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          obscureText: obscureText,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

class TransactionPinInputWidget extends StatelessWidget {
  final TextEditingController pinController;
  final bool obscureText;
  final bool autoFocus;
  final int length;
  final TextInputType keyboardType;

  const TransactionPinInputWidget(
      {Key? key,
      required this.pinController,
      this.obscureText = true,
      this.keyboardType = TextInputType.number,
      this.length = 6,
      this.autoFocus = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 43,
      width: 44,
      textStyle: context.textTheme.bodyText2,
      decoration: BoxDecoration(
        border: Border.all(
            color: context.themeData.inputDecorationTheme.enabledBorder!
                .borderSide.color),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
          color: context
              .themeData.inputDecorationTheme.focusedBorder!.borderSide.color),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Pinput(
          autofocus: autoFocus,
          controller: pinController,
          length: length,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          obscureText: obscureText,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
