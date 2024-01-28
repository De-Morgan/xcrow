part of theme;

class LightTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: _AppColors.white,
          primaryColor: _AppColors.primaryOrange,
          textTheme: TextTheme(
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.blackDeep),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.blackDeep),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.primaryOrange,
              background: _AppColors.white,
            )
          ]);
}
