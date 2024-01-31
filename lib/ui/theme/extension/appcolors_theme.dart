part of theme;

class AppColors extends ThemeExtension<AppColors> {
  final Color? navBarColor;
  final Color? outlineColor;
  final Color? amountBgColor;

  const AppColors({this.navBarColor, this.amountBgColor, this.outlineColor});

  @override
  ThemeExtension<AppColors> copyWith({
    Color? navBarColor,
    Color? outlineColor,
  }) {
    return AppColors(
        navBarColor: navBarColor ?? this.navBarColor,
        amountBgColor: amountBgColor,
        outlineColor: outlineColor ?? this.outlineColor);
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      navBarColor: Color.lerp(navBarColor, other.navBarColor, t),
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t),
      amountBgColor: Color.lerp(amountBgColor, other.amountBgColor, t),
    );
  }
}
