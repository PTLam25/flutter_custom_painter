import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/src/common/presentation/theme/app_theme.dart';
import 'package:flutter_custom_painter/src/common/presentation/widgets/pie_chart/pie_chart.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pieChartItems1 = <PieChartItem>[
      PieChartItem(
        title: 'Red',
        percentage: 0.2,
        color: Colors.red,
        icon: Icons.wifi,
      ),
      PieChartItem(
        title: 'Blue',
        percentage: 0.2,
        color: Colors.blue,
        icon: Icons.phone,
      ),
      PieChartItem(
        title: 'Yellow',
        percentage: 0.3,
        color: Colors.yellow,
        icon: Icons.cached,
      ),
      PieChartItem(
        title: 'Green',
        percentage: 0.3,
        color: Colors.green,
        icon: Icons.star,
      ),
    ];

    const pieChartItems2 = <PieChartItem>[
      PieChartItem(
        title: 'Red Red Red',
        percentage: 0.3,
        color: Colors.red,
        icon: Icons.wifi,
      ),
      PieChartItem(
        title: 'Blue Blue Blue',
        percentage: 0.5,
        color: Colors.blue,
        icon: Icons.phone,
      ),
      PieChartItem(
        title: 'Yellow Yellow Yellow',
        percentage: 0.2,
        color: Colors.yellow,
        icon: Icons.cached,
      ),
    ];

    const pieChartItems3 = <PieChartItem>[
      PieChartItem(
        title: 'Red Red Red',
        percentage: 0.6,
        color: Colors.red,
        icon: Icons.wifi,
      ),
      PieChartItem(
        title: 'Blue Blue Blue',
        percentage: 0.4,
        color: Colors.blue,
        icon: Icons.phone,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PieChart(
                items: pieChartItems1,
                inactiveColor: AppColors.pieChartInactiveAcr,
                angleGap: 0.3,
              ),
              PieChart(
                items: pieChartItems2,
                inactiveColor: AppColors.pieChartInactiveAcr,
                angleGap: 0.3,
              ),
              PieChart(
                items: pieChartItems3,
                inactiveColor: AppColors.pieChartInactiveAcr,
                angleGap: 0.3,
              ),
              PieChart(
                items: pieChartItems3,
                inactiveColor: AppColors.pieChartInactiveAcr,
                angleGap: 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
