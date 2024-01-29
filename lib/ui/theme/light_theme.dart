part of theme;

class LightTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: _AppColors.white,
          primaryColor: _AppColors.primaryOrange,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 57),
              elevation: 0,
              textStyle: _AppTextStyle.normal400Size14,
              foregroundColor: _AppColors.black03,
              backgroundColor: _AppColors.primaryOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
              color: _AppColors.white, surfaceTintColor: _AppColors.white),
          textTheme: TextTheme(
            bodyMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.gray02),
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.blackDeep),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.blackDeep),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.primaryOrange,
              background: _AppColors.white,
            ),
            DashboardTheme(
                border: _AppColors.dashboardBg, background: _AppColors.white),
            AppColors(navBarColor: _AppColors.payBillLightColor),
            AppAssetTheme(newYearSvg: SvgPath.lightNewYear)
          ]);
}
