import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/InputDecoration/profile_screen_input_decoration.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String genderVal = "female";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                Text('First Name '),
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
                    ),
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
                Text('Last Name '),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: 'Sheikh',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                Text('Email Address '),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: 'aashifasheikh@gmail.com',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                Text('Age '),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  initialValue: '25',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration:
                      ProfileScreenInputDecoration.profieScreenInputDecoration,
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gender '),
                  // SizedBox(
                  //   height: 7.h,
                  // ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "female",
                            groupValue: genderVal,
                            onChanged: (value) {
                              setState(() {
                                genderVal = value as String;
                              });
                            },
                          ),
                          Text('Female')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "male",
                            groupValue: genderVal,
                            onChanged: (value) {
                              setState(() {
                                genderVal = value as String;
                              });
                            },
                          ),
                          Text('Male'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
