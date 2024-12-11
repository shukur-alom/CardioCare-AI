import 'package:cardio_care_ai/data/models/bar/bar_data.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.weeklySummery});
  final List weeklySummery;
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      satRpm: weeklySummery[0],
      sunRpm: weeklySummery[1],
      monRpm: weeklySummery[2],
      tueRpm: weeklySummery[3],
      wedRpm: weeklySummery[4],
      thuRpm: weeklySummery[5],
      friRpm: weeklySummery[6],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 150,
          minY: 50,
          gridData: FlGridData(
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.greyColor
                    .withOpacity(0.1), // Set color with reduced opacity
                strokeWidth: 1, // Adjust the thickness of the grid line
              );
            },
          ),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles),
            ),
          ),
          barGroups: myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: AppColors.appColor,
                      width: 15,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        topLeft: Radius.circular(6),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 140,
                          color: AppColors.appColor.withOpacity(0.4)),
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.greyColor);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('sat', style: style);
      break;
    case 1:
      text = const Text('sun', style: style);
      break;
    case 2:
      text = const Text('mon', style: style);
      break;
    case 3:
      text = const Text('tue', style: style);
      break;
    case 4:
      text = const Text('wed', style: style);
      break;
    case 5:
      text = const Text('thu', style: style);
      break;
    case 6:
      text = const Text('fri', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
