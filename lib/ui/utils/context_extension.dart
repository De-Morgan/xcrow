import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  Color get primaryColor => themeData.primaryColor;

  Color get scaffoldBackgroundColor => themeData.scaffoldBackgroundColor;

  Color get errorColor => themeData.errorColor;

  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  ListTileThemeData get listTileThemeData => themeData.listTileTheme;
  InputDecorationTheme get inputDecorationTheme =>
      themeData.inputDecorationTheme;
  double get height => MediaQuery.maybeSizeOf(this)?.height ?? 800;

  double get width => MediaQuery.maybeSizeOf(this)?.width ?? 320;

  bool get isSmallScreen => (height / width) < 1.61 && height < 500;

  /// Tablet and above
  bool get isLargeScreen => (width / height) > 0.65 && width > 700;

  bool get isExtraLarge => isLargeScreen && width > 1290;

  T customTheme<T>() => Theme.of(this).extension<T>()!;

  /// Pop to first screen,
  /// check [ref.popToFirstScreen({String pageKey})] to pop to first screen and specify what page
  void popToFirstScreen() =>
      Navigator.of(this).popUntil((route) => route.isFirst);

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void popUntil({required RoutePredicate predicate}) =>
      Navigator.popUntil(this, predicate);

  void openDrawer() => Scaffold.maybeOf(this)?.openDrawer();

  void closeDrawer() => Scaffold.maybeOf(this)?.closeDrawer();

  void toggleDrawer() {
    if (Scaffold.maybeOf(this)?.isDrawerOpen ?? false) {
      closeDrawer();
    } else {
      openDrawer();
    }
  }

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.push<T>(
          this,
          MaterialPageRoute(
              builder: (context) => widget,
              fullscreenDialog: fullscreenDialog));

  void pushReplacement(Widget widget) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => widget));

  void pushAndRemoveUntil(Widget widget, {required RoutePredicate predicate}) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), predicate);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

  /// Do not use this directly unless absolutely necessary
  /// use [AppFeedback.showError]
  void showError(Object? error,
      {Duration duration = const Duration(seconds: 8)}) {
    if (error == null) return;
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Icon(
                Icons.error_outline_rounded,
                color: errorColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                error.toString(),
                maxLines: 2,
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToast(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          maxLines: 2,
        ),
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  EdgeInsetsGeometry get bottomPaddingForTextField =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);
}
