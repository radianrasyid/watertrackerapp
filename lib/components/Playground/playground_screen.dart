
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class BarChartTest extends StatelessWidget {
  BarChartTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BarChart(
        BarChartData(
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(
              border: const Border(
                  bottom: BorderSide(
            color: AppColor.mainBg,
          ))),
          backgroundColor: Colors.transparent,
          gridData: const FlGridData(show: false),
          groupsSpace: 10,
          barGroups: List.generate(
            8,
            (index) => BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: 10,
                    width: 8.w,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: AppColor.mainBg.withOpacity(0.3)),
                BarChartRodData(
                    fromY: 0,
                    toY: 5,
                    width: 8.w,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: AppColor.mainBg),
              ],
              groupVertically: true,
            ),
          ),
        ),
      ),
    );
  }
}
