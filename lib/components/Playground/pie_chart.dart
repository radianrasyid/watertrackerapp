

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class PieChartTest extends StatelessWidget {
  PieChartTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChart(PieChartData(
          borderData: FlBorderData(show: false),
          centerSpaceColor: Colors.white,
          centerSpaceRadius: 50,
          sectionsSpace: 0,
          startDegreeOffset: 90,
          sections: [
            PieChartSectionData(
              value: 60,
              color: AppColor.mainBg,
              showTitle: false,
              radius: 10,
            ),
            PieChartSectionData(
              value: 40,
              color: AppColor.mainBg.withOpacity(0.3),
              showTitle: false,
              radius: 10,
            ),
          ])),
    );
  }
}
