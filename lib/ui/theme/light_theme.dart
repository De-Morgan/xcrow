part of theme;

class LightTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: _AppColors.white,
          primaryColor: _AppColors.kFFCC00,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              iconTheme: const IconThemeData(color: _AppColors.k272626),
              backgroundColor: _AppColors.white,
              titleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: _AppColors.k272626)),
          listTileTheme: ListTileThemeData(
            iconColor: _AppColors.k797575,
            titleTextStyle: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.k272626),
            subtitleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                color: _AppColors.k797575,
                fontWeight: FontWeight.w300,
                fontSize: 11),
            horizontalTitleGap: 20,
            visualDensity: VisualDensity.compact,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 57),
              elevation: 0,
              textStyle: _AppTextStyle.normal400Size14,
              foregroundColor: _AppColors.k272626,
              backgroundColor: _AppColors.kFFCC00,
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
                .copyWith(color: _AppColors.k272626),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.k272626),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.kFFCC00,
              background: _AppColors.white,
            ),
            DashboardTheme(
                border: _AppColors.kF9F9FA, background: _AppColors.white),
            AppColors(navBarColor: _AppColors.payBillLightColor),
            AppAssetTheme(newYearSvg: SvgPath.lightNewYear)
          ]);
}
