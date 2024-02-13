part of theme;

class DashboardActionTheme extends ThemeExtension<DashboardActionTheme> {
  final Color? background;
  final Color border;
  final Color iconColor;

  const DashboardActionTheme(
      {this.background, required this.border, required this.iconColor});

  @override
  ThemeExtension<DashboardActionTheme> copyWith({
    Color? background,
    Color? border,
    Color? iconColor,
  }) {
    return DashboardActionTheme(
        background: background ?? this.background,
        iconColor: iconColor ?? this.iconColor,
        border: border ?? this.border);
  }

  @override
  ThemeExtension<DashboardActionTheme> lerp(
      ThemeExtension<DashboardActionTheme>? other, double t) {
    if (other is! DashboardActionTheme) {
      return this;
    }
    return DashboardActionTheme(
      background: Color.lerp(background, other.background, t),
      border: Color.lerp(border, other.border, t) ?? border,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? iconColor,
    );
  }
}
