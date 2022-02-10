part of 'pie_chart.dart';

@immutable
class PieChartItem {
  final String title;
  final double percentage;
  final Color color;
  final IconData icon;

  const PieChartItem({
    required this.title,
    required this.percentage,
    required this.color,
    required this.icon,
  });
}
