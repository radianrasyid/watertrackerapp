import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/InputDecoration/profile_screen_input_decoration.dart';
import 'package:watertrackerapp/controllers/RegisterController/register_controller.dart';
import 'package:watertrackerapp/pages/RegisterAcc/bloc/register_acc_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class RegisterAccScreen extends StatelessWidget {
  const RegisterAccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<RegisterAccBloc, RegisterAccState>(
            builder: (context, state) {
              final currentState = state as RegisterAccInitial;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Create your account ✨',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.readOnlyTextColor,
                      ),
                      onChanged: (value) {
                        BlocProvider.of<RegisterAccBloc>(context).add(
                            RegisterUsernameChangeEvent(inputUsername: value));
                      },
                      decoration: ProfileScreenInputDecoration
                          .logRegScreenInputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: AppColor.mainBg,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.readOnlyTextColor,
                      ),
                      onChanged: (value) {
                        BlocProvider.of<RegisterAccBloc>(context)
                            .add(RegisterEmailChangeEvent(inputEmail: value));
                      },
                      decoration: ProfileScreenInputDecoration
                          .logRegScreenInputDecoration(
                        hintText: 'Email address',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColor.mainBg,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.readOnlyTextColor,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        BlocProvider.of<RegisterAccBloc>(context).add(
                            RegisterPasswordChangeEvent(inputPassword: value));
                      },
                      decoration: ProfileScreenInputDecoration
                          .logRegScreenInputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: AppColor.mainBg,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.readOnlyTextColor,
                      ),
                      onChanged: (value) {
                        BlocProvider.of<RegisterAccBloc>(context).add(
                            RegisterConfirmPasswordChangeEvent(
                                inputConfirmPassword: value));
                      },
                      obscureText: true,
                      decoration: ProfileScreenInputDecoration
                          .logRegScreenInputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(
                          Icons.lock_person_outlined,
                          color: AppColor.mainBg,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          RegisterAccController(context: context)
                              .handleEmailRegister();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: AppColor.mainBg),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: AppColor.softWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "I already have an account ",
                              style: TextStyle(
                                color: AppColor.softBlack,
                                fontSize: 14.sp,
                              )),
                          TextSpan(
                              text: "Log In",
                              style: TextStyle(
                                  color: AppColor.mainBg,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                }),
                        ]),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
