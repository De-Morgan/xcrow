part of theme;

class AppAssetTheme extends ThemeExtension<AppAssetTheme> {
  final String newYearSvg;

  const AppAssetTheme({
    this.newYearSvg = SvgPath.lightNewYear,
  });

  @override
  ThemeExtension<AppAssetTheme> copyWith() {
    return AppAssetTheme(
      newYearSvg: newYearSvg,
    );
  }

  @override
  ThemeExtension<AppAssetTheme> lerp(
      ThemeExtension<AppAssetTheme>? other, double t) {
    if (other is! AppAssetTheme) {
      return this;
    }
    return AppAssetTheme(
      newYearSvg: newYearSvg,
    );
  }
}
