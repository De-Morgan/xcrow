part of theme;

class DarkTheme {
  static ThemeData get theme => ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: _AppColors.primaryBlack,
          primaryColor: _AppColors.primaryOrange,
          textTheme: TextTheme(
            titleMedium: _AppTextStyle.normal400Size14
                .copyWith(color: _AppColors.primaryOrange),
            titleSmall: _AppTextStyle.normal400Size14
                .copyWith(fontSize: 10, color: _AppColors.gray01),
          ),
          extensions: const [
            HomeCircularTheme(
              border: _AppColors.black01,
              background: _AppColors.primaryOrange,
            )
          ]);
}
