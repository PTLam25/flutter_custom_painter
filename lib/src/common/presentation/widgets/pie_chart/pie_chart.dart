import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/src/common/presentation/theme/app_theme.dart';

part 'pie_chart_item.dart';

part 'pie_chart_legend.dart';

part 'pie_chart_painter.dart';

class PieChart extends StatefulWidget {
  static _PieChartState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PieChartState>();

  final List<PieChartItem> items;
  final Color inactiveColor;
  final double initialAngle;
  final double angleGap;
  final double strokeWidth;
  final TextStyle? legendTextStyle;
  final TextStyle? centeredTextStyle;
  final EdgeInsets? padding;
  final double chartLegendSpacing;

  const PieChart({
    required this.items,
    this.inactiveColor = Colors.black,
    this.initialAngle = math.pi * 3 * 2,
    this.angleGap = 0.0,
    this.strokeWidth = 20.0,
    this.legendTextStyle,
    this.centeredTextStyle,
    this.padding,
    this.chartLegendSpacing = 26.0,
    Key? key,
  }) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  int _activeItemIndex = 0;

  int get activeItemIndex => _activeItemIndex;

  @override
  Widget build(BuildContext context) {
    final activeItem = widget.items[_activeItemIndex];

    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: CustomPaint(
              painter: PieChartPainter(
                items: widget.items,
                inactiveArcColor: widget.inactiveColor,
                activeValueIndex: _activeItemIndex,
                initialAngle: widget.initialAngle,
                angleGap: widget.angleGap,
                strokeWidth: widget.strokeWidth,
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Center(
                  child: Text(
                    '${(activeItem.percentage * 100).round()}%',
                    style: widget.centeredTextStyle ??
                        Theme.of(context).textTheme.headline1?.copyWith(
                              color: activeItem.color,
                            ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: widget.chartLegendSpacing),
          PieChartLegend(
            items: widget.items,
            onItemTap: _changeActiveItemIndex,
          ),
        ],
      ),
    );
  }

  void _changeActiveItemIndex(int index) {
    if (_activeItemIndex == index) {
      return;
    }

    setState(() {
      _activeItemIndex = index;
    });
  }
}
