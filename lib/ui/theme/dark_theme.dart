part of theme;

class DarkTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: _AppColors.primaryBlack,
          primaryColor: _AppColors.primaryOrange,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 57),
              elevation: 0,
              textStyle: _AppTextStyle.normal400Size14,
              foregroundColor: _AppColors.primaryBlack,
              backgroundColor: _AppColors.primaryOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          textTheme: TextTheme(
            bodyMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.gray01),
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.primaryOrange),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.gray01),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.black01,
              background: _AppColors.primaryOrange,
            ),
            DashboardTheme(
                border: _AppColors.black02, background: _AppColors.black02),
            AppColors(navBarColor: _AppColors.payBillDarkColor),
            AppAssetTheme(newYearSvg: SvgPath.darkNewYear)
          ]);
}
