import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/InputDecoration/profile_screen_input_decoration.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Image(image: AssetImage('assets/img/profilePhoto.png')),
            ),
            SizedBox(
              height: 23.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name'),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 46.h,
                  child: TextFormField(
                    initialValue: 'Aashifa',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.readOnlyTextColor,
                    ),
                    readOnly: true,
                    decoration: ProfileScreenInputDecoration
                        .profieScreenInputDecoration,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Last Name'),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: 'Sheikh',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.readOnlyTextColor,
                  ),
                  readOnly: true,
                  decoration:
                      ProfileScreenInputDecoration.profieScreenInputDecoration,
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email Address'),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: 'aashifasheikh@gmail.com',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.readOnlyTextColor,
                  ),
                  readOnly: true,
                  decoration:
                      ProfileScreenInputDecoration.profieScreenInputDecoration,
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Age'),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: '25',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.readOnlyTextColor,
                  ),
                  readOnly: true,
                  decoration:
                      ProfileScreenInputDecoration.profieScreenInputDecoration,
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gender'),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: 'Female',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.readOnlyTextColor,
                  ),
                  readOnly: true,
                  decoration:
                      ProfileScreenInputDecoration.profieScreenInputDecoration,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
