import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/pages/Analysis/bloc/analysis_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedGroupIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisBloc, AnalysisState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'For Today',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.softBlack,
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                SizedBox(
                  height: 220.h,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    childAspectRatio: 150.h / 236.w,
                    primary: false,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                            width: 0.4,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Water',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.softBlack,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Image.asset(
                                'assets/img/splashwater1.png',
                                color: AppColor.mainBg.withOpacity(1),
                                fit: BoxFit.cover,
                                height: 70.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Image.asset(
                                'assets/img/splashwater2.png',
                                color: AppColor.mainBg.withOpacity(0.5),
                                fit: BoxFit.cover,
                                height: 70.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 21, left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('2.1',
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'liters',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 20),
                                height: 80.h,
                                width: 124.w,
                                child: BarChart(
                                  BarChartData(
                                    gridData: const FlGridData(show: false),
                                    titlesData: const FlTitlesData(show: false),
                                    borderData: FlBorderData(
                                      border: const Border(
                                        bottom: BorderSide(
                                          color: AppColor.mainBg,
                                        ),
                                      ),
                                    ),
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.zero,
                                                bottomRight: Radius.zero,
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              color: AppColor.mainBg
                                                  .withOpacity(0.3)),
                                          BarChartRodData(
                                              fromY: 0,
                                              toY: 5,
                                              width: 8.w,
                                              borderRadius:
                                                  const BorderRadius.only(
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
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                            width: 0.4,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 19, bottom: 21),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Walk',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.softBlack,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  PieChart(PieChartData(
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
                                          color:
                                              AppColor.mainBg.withOpacity(0.3),
                                          showTitle: false,
                                          radius: 10,
                                        ),
                                      ])),
                                  Positioned.fill(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "2305",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    primary: false,
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    childAspectRatio: 154.h / 336.w,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 150.w,
                            width: 154.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.3),
                                width: 0.4,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Calories',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '510.43',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.mainBg),
                                    ),
                                    Text(
                                      'Kcol',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 150.w,
                            width: 154.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.3),
                                width: 0.4,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sleep',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '08:00',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.mainBg),
                                    ),
                                    Text(
                                      'hours',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                            width: 0.4,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.only(top: 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                          'assets/img/heartBeat.png'),
                                      fit: BoxFit.cover,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                    Image(
                                      image: const AssetImage(
                                          'assets/img/heartBip.png'),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 28),
                                child: Text(
                                  'Heart',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.softBlack,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '105',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.mainBg),
                                    ),
                                    Text(
                                      'bpm',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
