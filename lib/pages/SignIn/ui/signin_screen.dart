import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watertrackerapp/components/InputDecoration/profile_screen_input_decoration.dart';
import 'package:watertrackerapp/controllers/SignInController/signin_controller.dart';
import 'package:watertrackerapp/pages/SignIn/bloc/sign_in_bloc.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              final currentState = state as SignInInitial;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Securely sign in to your account',
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
                      BlocProvider.of<SignInBloc>(context)
                          .add(SignInEmailChangeEvent(emailValue: value));
                    },
                    decoration: ProfileScreenInputDecoration
                        .logRegScreenInputDecoration(
                      hintText: 'Enter your email',
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
                    onChanged: (value) {
                      BlocProvider.of<SignInBloc>(context)
                          .add(SignInPassChangeEvent(password: value));
                    },
                    obscureText: currentState.isPassVisible ? false : true,
                    decoration: ProfileScreenInputDecoration
                        .logRegScreenInputDecoration(
                            hintText: 'Enter your password',
                            prefixIcon: Icon(
                              currentState.isPassVisible
                                  ? Icons.lock_outlined
                                  : Icons.lock_open_outlined,
                              color: AppColor.mainBg,
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility_outlined,
                              color: AppColor.mainBg,
                            ),
                            onTapSuffix: () {
                              BlocProvider.of<SignInBloc>(context).add(
                                  SignInUiPasswordVisibleChangeEvent(
                                      passVisibleValue:
                                          !currentState.isPassVisible));
                            }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/main');
                        print(currentState.email);
                        print(currentState.password);
                        print(currentState.isPassVisible);
                        SignInController(context: context)
                            .handleSignIn('email');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColor.mainBg),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          color: AppColor.softWhite,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.mainBg,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Text(
                      '- OR Continue With -',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          SignInController(context: context)
                              .handleSignIn('google');
                        },
                        icon: const ImageIcon(
                          AssetImage('assets/img/google.png'),
                          size: 24,
                        ),
                        label: Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.secondaryTextColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppColor.mainBg),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage('assets/img/facebook.png'),
                          size: 24,
                        ),
                        label: Text(
                          'Facebook',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.secondaryTextColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppColor.mainBg),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'Create An Account ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                                color: AppColor.mainBg,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.mainBg),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              })
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'By clicking continue,',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const TextSpan(
                          text: 'you agree to our ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Terms of service ',
                            style: const TextStyle(
                              color: AppColor.mainBg,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('this is aggreement consent');
                              }),
                        const TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: AppColor.mainBg,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('this is aggreement consent');
                              }),
                      ]))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
