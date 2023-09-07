import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watertrackerapp/pages/Main/bloc/bottom_nav_bar_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
      {super.key,
      required this.icon,
      required this.indexedItem,
      required this.label,
      required this.currentIndex});

  final String label;
  final IconData icon;
  final int indexedItem;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: IconButton(
            onPressed: () {
              BlocProvider.of<BottomNavBarBloc>(context)
                  .add(BottomNavBarEventChange(newIndex: indexedItem));
            },
            icon: Icon(
              icon,
              color:
                  currentIndex == indexedItem ? AppColor.mainBg : Colors.black,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
              color:
                  currentIndex == indexedItem ? AppColor.mainBg : Colors.black),
        )
      ],
    );
  }
}
