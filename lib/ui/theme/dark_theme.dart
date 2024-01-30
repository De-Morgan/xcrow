part of theme;

class DarkTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: _AppColors.primaryBlack,
          primaryColor: _AppColors.primaryOrange,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              backgroundColor: _AppColors.primaryBlack,
              iconTheme: const IconThemeData(color: _AppColors.kA7A3A3),
              titleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: _AppColors.kA7A3A3)),
          listTileTheme: ListTileThemeData(
            titleTextStyle: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.primaryOrange),
            subtitleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                color: _AppColors.kA7A3A3,
                fontWeight: FontWeight.w300,
                fontSize: 11),
            iconColor: _AppColors.kA7A3A3,
            horizontalTitleGap: 20,
            visualDensity: VisualDensity.compact,
          ),
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
          bottomAppBarTheme: const BottomAppBarTheme(
              color: _AppColors.primaryBlack,
              surfaceTintColor: _AppColors.primaryBlack),
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
                border: _AppColors.k272626, background: _AppColors.k272626),
            AppColors(navBarColor: _AppColors.payBillDarkColor),
            AppAssetTheme(newYearSvg: SvgPath.darkNewYear)
          ]);
}
