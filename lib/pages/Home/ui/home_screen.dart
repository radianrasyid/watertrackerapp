import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:watertrackerapp/pages/Home/bloc/home_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                              color: AppColor.secondaryTextColor,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Radian',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Badge(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_rounded,
                              color: AppColor.mainBg),
                          style: IconButton.styleFrom(
                              backgroundColor: AppColor.softWhite),
                        ),
                        label: Text('3'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Image.asset('assets/img/splashwater1.png',
                            color: const Color.fromARGB(255, 93, 204, 252)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Image.asset('assets/img/splashwater2.png',
                            color: const Color.fromARGB(255, 93, 204, 252)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, bottom: 27, right: 14),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '11:00 AM',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      '200ml water (2 glass)',
                                      style: TextStyle(
                                        color: AppColor.secondaryTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 47.h,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 23.5, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  child: const Text('Add Your Goal'),
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/img/Droplet.png',
                              fit: BoxFit.contain,
                              width: 122,
                              height: 144,
                              colorBlendMode: BlendMode.lighten,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(width: 10.w, color: AppColor.mainBg),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Image.asset(
                                'assets/img/splashwater1.png',
                                color: Color.fromARGB(255, 0, 179, 255),
                                fit: BoxFit.cover,
                              ),
                              height:
                                  MediaQuery.of(context).size.width / 2 * 0.5,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Image.asset(
                                'assets/img/splashwater2.png',
                                color: Color.fromARGB(255, 15, 179, 255),
                                fit: BoxFit.cover,
                              ),
                              height:
                                  MediaQuery.of(context).size.width / 2 * 0.5,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '500ml',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.softWhite),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 76.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                    "${DateFormat('hh:mm').format(DateTime.now())} AM"),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.mainBg,
                                        borderRadius: BorderRadius.circular(9)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.coffee_rounded,
                                          color: Colors.red),
                                      SizedBox(
                                        width: 14.w,
                                      ),
                                      Text(
                                        '100ml',
                                        style: TextStyle(
                                            color: AppColor.softBlack,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '10%',
                                  style: TextStyle(
                                      color: AppColor.secondaryTextColor,
                                      fontSize: 14.sp),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        width: MediaQuery.of(context).size.width / 3,
                        height: 76.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Target',
                              style: TextStyle(
                                  color: AppColor.secondaryTextColor,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              '2000ml',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.softBlack),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Go To Dashboard',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainBg,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 36.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 1),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'You got 50% of today’s goal, \n keep focus on your health!',
                  style: TextStyle(
                    color: AppColor.secondaryTextColor,
                    fontSize: 12.sp,
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
