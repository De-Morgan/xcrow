part of theme;

class DarkTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: _AppColors.k141313,
          primaryColor: _AppColors.kFFCC00,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              backgroundColor: _AppColors.k141313,
              iconTheme: const IconThemeData(color: _AppColors.kA7A3A3),
              titleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: _AppColors.kA7A3A3)),
          listTileTheme: ListTileThemeData(
            titleTextStyle: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.kFFCC00),
            subtitleTextStyle: _AppTextStyle.normal400Size14.copyWith(
                color: _AppColors.kA7A3A3,
                fontWeight: FontWeight.w300,
                fontSize: 11),
            iconColor: _AppColors.kA7A3A3,
            horizontalTitleGap: 20,
            visualDensity: VisualDensity.compact,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: _AppColors.kFFCC00)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 57),
              elevation: 0,
              textStyle: _AppTextStyle.normal400Size14,
              foregroundColor: _AppColors.k141313,
              backgroundColor: _AppColors.kFFCC00,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
              color: _AppColors.k141313, surfaceTintColor: _AppColors.k141313),
          inputDecorationTheme: InputDecorationTheme(
              constraints: const BoxConstraints(
                minHeight: 57,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              hintStyle: _AppTextStyle.normal300Size14
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w200),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.kA7A3A3),
                  borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.kA7A3A3),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.kFFCC00),
                  borderRadius: BorderRadius.circular(8))),
          textTheme: TextTheme(
            bodySmall: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.k9B9898, fontSize: 10),
            bodyMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.gray01),
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.kFFCC00),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.gray01),
            bodyLarge: _AppTextStyle.normal400Size14.copyWith(fontSize: 14),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.k302F2E,
              background: _AppColors.kFFCC00,
            ),
            DashboardTheme(
                border: _AppColors.k272626, background: _AppColors.k202126),
            AppColors(
                navBarColor: _AppColors.payBillDarkColor,
                outlineColor: _AppColors.kA7A3A3,
                amountBgColor: _AppColors.k312E2E),
            AppAssetTheme(newYearSvg: SvgPath.darkNewYear)
          ]);
}
