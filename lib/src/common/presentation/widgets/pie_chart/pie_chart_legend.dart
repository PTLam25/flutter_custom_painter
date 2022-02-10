part of 'pie_chart.dart';

typedef OnLegendItemTap = void Function(int index);

class PieChartLegend extends StatelessWidget {
  final List<PieChartItem> items;
  final OnLegendItemTap onItemTap;

  const PieChartLegend({
    required this.items,
    required this.onItemTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .asMap()
          .entries
          .map(
            (entry) => _PieChartLegendItem(
              item: entry.value,
              index: entry.key,
              onTap: onItemTap,
            ),
          )
          .toList(),
    );
  }
}

class _PieChartLegendItem extends StatelessWidget {
  final PieChartItem item;
  final int index;
  final OnLegendItemTap onTap;

  const _PieChartLegendItem({
    required this.item,
    required this.index,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActiveItem = PieChart.of(context)?.activeItemIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 160.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: isActiveItem ? item.color : AppColors.pieChartInactiveAcr,
            borderRadius: const BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.24),
                ),
                child: Icon(
                  item.icon,
                  size: 20.0,
                  color: isActiveItem
                      ? AppColors.textColorPrimary
                      : AppColors.textColorSecondary,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: isActiveItem
                            ? AppColors.textColorPrimary
                            : AppColors.textColorSecondary,
                      ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
