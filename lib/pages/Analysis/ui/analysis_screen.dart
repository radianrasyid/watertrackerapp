import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/Playground/pie_chart.dart';
import 'package:watertrackerapp/components/Playground/playground_screen.dart';
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
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Positioned(
                                    top: 0,
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
                                Positioned(
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/img/splashwater1.png',
                                    color: AppColor.mainBg.withOpacity(1),
                                    fit: BoxFit.cover,
                                    height: 70.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/img/splashwater2.png',
                                    color: AppColor.mainBg.withOpacity(0.5),
                                    fit: BoxFit.cover,
                                    height: 70.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 21, left: 20, right: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                    padding: EdgeInsets.only(bottom: 20),
                                    height: 80.h,
                                    width: 124.w,
                                    child: BarChartTest(),
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
                                Positioned(
                                  top: 0,
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
                                  child: PieChartTest(),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.077,
                                  left:
                                      MediaQuery.of(context).size.width * 0.057,
                                  child: Column(
                                    children: [
                                      Text(
                                        '2628',
                                        style: TextStyle(
                                            color: AppColor.mainBg,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp),
                                      ),
                                      Text(
                                        'Steps \n Completed',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.w,
                        childAspectRatio: 154.h / 336.w,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 140.w,
                                width: 154.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 0.4,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Calories',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                height: 140.w,
                                width: 154.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 0.4,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sleep',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/img/heartBeat.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/img/heartBip.png'),
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20, top: 28),
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
                                        EdgeInsets.only(left: 20, bottom: 28),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                  ]),
            ));
      },
    );
  }
}
