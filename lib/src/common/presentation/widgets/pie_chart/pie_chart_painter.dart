part of 'pie_chart.dart';

class PieChartPainter extends CustomPainter {
  static const double totalAngle = math.pi * 2;

  final List<PieChartItem> items;
  final int activeValueIndex;
  final Color inactiveArcColor;
  final double initialAngle;
  final double angleGap;
  final double strokeWidth;

  final List<Paint> _paintList = [];
  late final Paint _activeArcShadowPaint;

  PieChartPainter({
    required this.items,
    required this.activeValueIndex,
    required this.inactiveArcColor,
    required this.initialAngle,
    required this.angleGap,
    required this.strokeWidth,
  }) {
    final totalPercentage = items
        .map(
          (item) => item.percentage,
        )
        .reduce(
          (previousValue, currentValue) => previousValue + currentValue,
        );
    assert(
      totalPercentage == 1.0,
      'Total percentage should be equal to 1.0',
    );

    _initPaints();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final side = size.width < size.height ? size.width : size.height;

    var previousStartAngle = initialAngle;

    for (var index = 0; index < items.length; index++) {
      final sweepAngle = totalAngle * items[index].percentage;
      canvas.drawArc(
        Rect.fromLTWH(0.0, 0.0, side, size.height),
        previousStartAngle,
        sweepAngle - angleGap,
        false,
        _paintList[index],
      );

      if (index == activeValueIndex) {
        canvas.drawArc(
          Rect.fromLTWH(0.0, 0.0, side, size.height),
          previousStartAngle,
          sweepAngle - angleGap,
          false,
          _activeArcShadowPaint,
        );
      }

      previousStartAngle = previousStartAngle + sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _initPaints() {
    for (var index = 0; index < items.length; index++) {
      final paint = Paint()
        ..color =
            index == activeValueIndex ? items[index].color : inactiveArcColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      _paintList.add(paint);

      if (index == activeValueIndex) {
        _activeArcShadowPaint = Paint()
          ..color = items[index].color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);
      }
    }
  }
}
