part of theme;

class AppColors extends ThemeExtension<AppColors> {
  final Color? navBarColor;

  const AppColors({
    this.navBarColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? navBarColor,
    Color? border,
  }) {
    return AppColors(
      navBarColor: navBarColor ?? this.navBarColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      navBarColor: Color.lerp(navBarColor, other.navBarColor, t),
    );
  }
}
