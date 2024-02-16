part of theme;

class AccountActionTheme extends ThemeExtension<AccountActionTheme> {
  final Color? background;
  final Color textColor;
  final Color? trailingIconColor;

  const AccountActionTheme({
    this.background,
    required this.textColor,
    this.trailingIconColor,
  });

  @override
  ThemeExtension<AccountActionTheme> copyWith({
    Color? background,
    Color? textColor,
  }) {
    return AccountActionTheme(
        background: background ?? this.background,
        textColor: textColor ?? this.textColor,
        trailingIconColor: trailingIconColor);
  }

  @override
  ThemeExtension<AccountActionTheme> lerp(
      ThemeExtension<AccountActionTheme>? other, double t) {
    if (other is! AccountActionTheme) {
      return this;
    }
    return AccountActionTheme(
      background: Color.lerp(background, other.background, t),
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      trailingIconColor:
          Color.lerp(trailingIconColor, other.trailingIconColor, t),
    );
  }
}
