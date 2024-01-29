part of theme;

class DashboardTheme extends ThemeExtension<DashboardTheme> {
  final Color? background;
  final Color border;

  const DashboardTheme({
    this.background,
    required this.border,
  });

  @override
  ThemeExtension<DashboardTheme> copyWith({
    Color? background,
    Color? border,
  }) {
    return DashboardTheme(
        background: background ?? this.background,
        border: border ?? this.border);
  }

  @override
  ThemeExtension<DashboardTheme> lerp(
      ThemeExtension<DashboardTheme>? other, double t) {
    if (other is! DashboardTheme) {
      return this;
    }
    return DashboardTheme(
      background: Color.lerp(background, other.background, t),
      border: Color.lerp(border, other.border, t) ?? border,
    );
  }
}
