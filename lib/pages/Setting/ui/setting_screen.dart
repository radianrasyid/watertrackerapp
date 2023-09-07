import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/pages/Setting/ui/components/history_screen.dart';
import 'package:watertrackerapp/pages/Setting/ui/components/settings_screen.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelColor: AppColor.mainBg,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_outlined),
                      SizedBox(width: 10.w),
                      Text('History')
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings_outlined),
                      SizedBox(width: 10.w),
                      Text('Settings')
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                Container(
                  child: HistoryScreen(),
                ),
                Container(
                  child: SettingsScreen(),
                )
              ],
            ))
          ],
        ));
  }
}
