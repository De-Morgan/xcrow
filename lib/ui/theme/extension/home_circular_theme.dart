part of theme;

class HomeCircularTheme extends ThemeExtension<HomeCircularTheme> {
  final Color? background;
  final Color border;

  const HomeCircularTheme({
    this.background,
    required this.border,
  });

  @override
  ThemeExtension<HomeCircularTheme> copyWith({
    Color? background,
    Color? border,
  }) {
    return HomeCircularTheme(
        background: background ?? this.background,
        border: border ?? this.border);
  }

  @override
  ThemeExtension<HomeCircularTheme> lerp(
      ThemeExtension<HomeCircularTheme>? other, double t) {
    if (other is! HomeCircularTheme) {
      return this;
    }
    return HomeCircularTheme(
      background: Color.lerp(background, other.background, t),
      border: Color.lerp(border, other.border, t) ?? border,
    );
  }
}
