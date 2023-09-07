import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 19.h,
        ),
        Container(
          height: 36.h,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          child: Text(
            'Reminder Settings',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 19.h,
        ),
        Container(
          height: 36.h,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          child: Text(
            'Reminder Sound',
            style: TextStyle(
              fontSize: 14.sp,
            ),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reminder Mode',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'As Device Setting',
                    style: TextStyle(fontSize: 12.sp, color: AppColor.mainBg),
                  ),
                )
              ],
            ),
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
              'General',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
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
              'Remove ADS',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light or Dark Interface',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Light',
                    style: TextStyle(fontSize: 12.sp, color: AppColor.mainBg),
                  ),
                )
              ],
            ),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Kg. ml',
                    style: TextStyle(fontSize: 12.sp, color: AppColor.mainBg),
                  ),
                )
              ],
            ),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Intakge Goal',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '2000ml',
                    style: TextStyle(fontSize: 12.sp, color: AppColor.mainBg),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
