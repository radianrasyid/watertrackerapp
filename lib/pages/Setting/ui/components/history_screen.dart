import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:watertrackerapp/pages/Setting/bloc/setting_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> _drinkWaterReport = [
    {"title": 'Weekly Average', "content": "0 ml / Day", "color": Colors.green},
    {
      "title": "Monthly Average",
      "content": "0 ml / Day",
      "color": AppColor.mainBg
    },
    {"title": "Average Completion", "content": "0%", "color": Colors.orange},
    {
      "title": "Drink Frequency",
      "content": "0 times / Day",
      "color": Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        final calendarState = state as CalendarInitial;
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 104.h,
                decoration: BoxDecoration(
                  color: AppColor.mainBg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 13, bottom: 13),
                      child: Text(
                        'Weekly Competition',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: calendarState.dateList.map((e) {
                        final isCurrentDay =
                            DateFormat('DD/MM/YYYY').format(e['date']) ==
                                DateFormat('DD/MM/YYYY').format(DateTime.now());
                        final isLessThenToday =
                            DateTime.parse(e['date'].toString())
                                .isBefore(DateTime.now());
                        return InkWell(
                          onTap: () {
                            print(e['date']);
                            print(DateTime.now());
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: isCurrentDay
                                  ? AppColor.mainBg
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: isCurrentDay
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(DateFormat.d().format(e['date']),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          )),
                                      Text(e['day'],
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          )),
                                    ],
                                  )
                                : isLessThenToday
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(DateFormat.d().format(e['date']),
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              )),
                                          Text(e['day'],
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              )),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat.d().format(e['date']),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            e['day'],
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Container(
                height: 54.h,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 17, right: 17),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Drink Water Report',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: _drinkWaterReport.map((e) {
                  return Container(
                    height: 54.h,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: e['color'] as Color,
                                  size: 8.h,
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Text(
                                  e['title'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              e['content'],
                              style: TextStyle(
                                  fontSize: 12.sp, color: AppColor.mainBg),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
