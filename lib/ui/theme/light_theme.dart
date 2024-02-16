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
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: _AppColors.k272626)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 57),
              elevation: 0,
              textStyle: _AppTextStyle.normal400Size14,
              foregroundColor: _AppColors.k272626,
              backgroundColor: _AppColors.kFFCC00,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
              color: _AppColors.white, surfaceTintColor: _AppColors.white),
          inputDecorationTheme: InputDecorationTheme(
              constraints: const BoxConstraints(
                minHeight: 57,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              hintStyle: _AppTextStyle.normal300Size14
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w200),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.k6B6A6A),
                  borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.k6B6A6A),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: _AppColors.k141313),
                  borderRadius: BorderRadius.circular(8))),
          textTheme: TextTheme(
            bodySmall: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.k7C7979, fontSize: 10),
            bodyMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.k141313),
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.k272626),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.k272626),
            bodyLarge: _AppTextStyle.normal400Size14.copyWith(fontSize: 14),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.kFAFAFA,
              background: _AppColors.kFFCC00,
            ),
            DashboardTheme(
                border: _AppColors.kF9F9FA, background: _AppColors.white),
            AppColors(
                navBarColor: _AppColors.payBillLightColor,
                outlineColor: _AppColors.k797575,
                amountBgColor: _AppColors.kF9F9FA,
                dividerColor: _AppColors.kB7B3B3),
            AppAssetTheme(newYearSvg: SvgPath.lightNewYear),
            DashboardActionTheme(
              border: _AppColors.kFFCC00,
              iconColor: _AppColors.k5D5C5C,
              background: _AppColors.kFFCC00,
            ),
            AccountActionTheme(
                textColor: _AppColors.k7C7979,
                background: _AppColors.kFAFAFA,
                trailingIconColor: _AppColors.k7C7979)
          ]);
}
