part of 'app_theme.dart';

class AppColors {
  static const Color scaffoldBackground = _black;

  static final Color textColorPrimary = _black.shade800;
  static const Color textColorSecondary = _gray;

  static final Color pieChartInactiveAcr = _black.shade100;

  static const MaterialColor _black = MaterialColor(
    0xFF000000,
    <int, Color>{
      100: Color(0xFF1E1E1E),
      800: Color(0xFF0E0E0E),
    },
  );
  static const Color _gray = Color(0xFF8A8A8A);

  const AppColors._();
}
