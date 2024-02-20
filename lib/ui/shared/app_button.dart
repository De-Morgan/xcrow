import 'package:flutter/material.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AppButton extends StatelessWidget {
  final String label;
  final ButtonType buttonType;
  final VoidCallback? onPressed;
  final ValueNotifier<bool> _enableButtonNotifier;
  final Stream<bool>? loading;
  final String loadingText;
  final ButtonStyle? style;
  final Widget? icon;

  AppButton._(
      {Key? key,
      required this.label,
      this.loading,
      this.onPressed,
      this.style,
      this.loadingText = 'Loading...',
      this.buttonType = ButtonType.raised,
      this.icon,
      ValueNotifier<bool>? enableButtonNotifier})
      : _enableButtonNotifier =
            enableButtonNotifier ?? ValueNotifier<bool>(true),
        super(key: key);

  factory AppButton.elevatedButton(
          {required String label,
          required VoidCallback onPressed,
          ButtonStyle? style,
          Stream<bool>? loading,
          Key? key,
          ValueNotifier<bool>? enable}) =>
      AppButton._(
        label: label,
        onPressed: onPressed,
        style: style,
        loading: loading,
        key: key,
        enableButtonNotifier: enable,
      );

  factory AppButton.elevatedIconButton(
          {required String label,
          required VoidCallback onPressed,
          ButtonStyle? style,
          Stream<bool>? loading,
          Key? key,
          required Widget icon,
          ValueNotifier<bool>? enable}) =>
      AppButton._(
        label: label,
        onPressed: onPressed,
        style: style,
        loading: loading,
        icon: icon,
        key: key,
        buttonType: ButtonType.raisedIcon,
        enableButtonNotifier: enable,
      );

  factory AppButton.textButton({
    required String label,
    required VoidCallback onPressed,
    ButtonStyle? style,
    String loadingText = "loading...",
    Stream<bool>? loading,
  }) =>
      AppButton._(
        label: label,
        onPressed: onPressed,
        style: style,
        loadingText: loadingText,
        buttonType: ButtonType.text,
        loading: loading,
      );

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    switch (buttonType) {
      case ButtonType.raised:
        widget = ValueListenableBuilder<bool>(
          valueListenable: _enableButtonNotifier,
          builder: (BuildContext context, bool value, Widget? child) {
            return StreamBuilder<bool>(
              stream: loading,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.data ?? false) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: context.primaryColor,
                    ),
                  );
                }
                return ElevatedButton(
                    style: style,
                    onPressed: value ? onPressed : null,
                    child: child);
              },
            );
          },
          child: Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        );
        break;
      case ButtonType.text:
        widget = StreamBuilder<bool>(
            stream: loading,
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.data ?? false) {
                return Text(
                  loadingText,
                );
              }
              return TextButton(
                  onPressed: onPressed,
                  style: style,
                  child: Text(
                    label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ));
            });
        break;
      case ButtonType.raisedIcon:
        widget = ValueListenableBuilder<bool>(
          valueListenable: _enableButtonNotifier,
          builder: (BuildContext context, bool value, Widget? child) {
            return StreamBuilder<bool>(
              stream: loading,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.data ?? false) {
                  return ElevatedButton(
                      onPressed: () {}, child: CircularProgressIndicator());
                }
                return ElevatedButton.icon(
                    style: style,
                    icon: icon ?? Container(),
                    onPressed: value ? onPressed : null,
                    label: child ?? Container());
              },
            );
          },
          child: Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        );
        break;
    }
    return widget;
  }
}

enum ButtonType {
  raised,
  raisedIcon,
  text,
}
