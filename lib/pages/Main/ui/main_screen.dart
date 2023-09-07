import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/BottomNavBar/bottom_navbar_item.dart';
import 'package:watertrackerapp/pages/Analysis/ui/analysis_screen.dart';
import 'package:watertrackerapp/pages/Home/ui/home_screen.dart';
import 'package:watertrackerapp/pages/Main/bloc/bottom_nav_bar_bloc.dart';
import 'package:watertrackerapp/pages/Profile/bloc/profile_bloc.dart';
import 'package:watertrackerapp/pages/Profile/ui/profile_parent_screen.dart';
import 'package:watertrackerapp/pages/Setting/ui/setting_screen.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class MainScreeen extends StatefulWidget {
  const MainScreeen({super.key});

  @override
  State<MainScreeen> createState() => _MainScreeenState();
}

class _MainScreeenState extends State<MainScreeen> {
  static final List<Widget> _WidgetOptions = [
    const HomeScreen(),
    const AnalysisScreen(),
    const SettingScreen(),
    ProfileParentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        buildWhen: (previous, current) =>
            // ignore: unnecessary_type_check
            current is ProfileState || current is BottomNavBarState,
        builder: (context, state) {
          final state1 = state as BottomNavBarInitial;
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              final AppBarState = state as ProfileAppBarState;
              return Scaffold(
                appBar: state1.indexedTab == 3
                    ? AppBar(
                        title: Text(
                          AppBarState.AppBarTitle,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        centerTitle: true,
                        actions: AppBarState.isProfileScreenEdit == false
                            ? [
                                IconButton(
                                  onPressed: () {
                                    if (AppBarState.isProfileScreenEdit ==
                                        false) {
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          AppBarTitleChangeEvent(
                                              appBarTitle: "Edit Profile"));
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          ProfileScreenEditStateChangeEvent(
                                              profileScreenChangeValue: true));
                                    } else {
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          AppBarTitleChangeEvent(
                                              appBarTitle: "My Profile"));
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          ProfileScreenEditStateChangeEvent(
                                              profileScreenChangeValue: false));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColor.mainBg),
                                ),
                              ]
                            : [],
                        leading: IconButton(
                          onPressed: () {
                            if (AppBarState.isProfileScreenEdit == false) {
                              BlocProvider.of<BottomNavBarBloc>(context).add(
                                  BottomNavBarEventChange(
                                      newIndex: state1.indexedTab - 1));
                            } else {
                              BlocProvider.of<ProfileBloc>(context).add(
                                  AppBarTitleChangeEvent(
                                      appBarTitle: "My Profile"));
                              BlocProvider.of<ProfileBloc>(context).add(
                                  ProfileScreenEditStateChangeEvent(
                                      profileScreenChangeValue: false));
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.mainBg,
                          ),
                        ),
                      )
                    : null,
                backgroundColor: state1.indexedTab < 2
                    ? AppColor.contentMainBg
                    : Colors.white,
                body: SafeArea(
                    child: _WidgetOptions.elementAt(state1.indexedTab)),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.alarm_outlined),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 1,
                        iconSize: 30,
                        padding: const EdgeInsets.all(10)),
                  ),
                ),
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  height: 76,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomNavBarItem(
                          icon: Icons.home_outlined,
                          indexedItem: 0,
                          label: "Home",
                          currentIndex: state1.indexedTab,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 32,
                        ),
                        BottomNavBarItem(
                            icon: Icons.bar_chart_outlined,
                            indexedItem: 1,
                            label: "Analysis",
                            currentIndex: state1.indexedTab),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                        BottomNavBarItem(
                            icon: Icons.settings_outlined,
                            indexedItem: 2,
                            label: "Settings",
                            currentIndex: state1.indexedTab),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 32,
                        ),
                        BottomNavBarItem(
                            icon: Icons.person_outlined,
                            indexedItem: 3,
                            label: "Profile",
                            currentIndex: state1.indexedTab)
                      ]),
                ),
              );
            },
          );
        });
  }
}
