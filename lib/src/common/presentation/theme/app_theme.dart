import 'package:flutter/material.dart';

part 'app_colors.dart';

part 'app_text_styles.dart';

final ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headline1: AppTextStyles.text700Size36,
    headline6: AppTextStyles.text700Size14,
  ),
);
