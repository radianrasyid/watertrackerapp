import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watertrackerapp/pages/SignIn/bloc/sign_in_bloc.dart';

import '../../utils/constants/color_lib.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future handleSignIn(String type) async {
    try {
      switch (type) {
        case 'google':
          {
            GoogleSignIn _googleSignIn = GoogleSignIn();
            final GoogleSignInAccount? googleUser =
                await _googleSignIn.signIn();

            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken,
            );

            return await FirebaseAuth.instance.signInWithCredential(credential);
          }
        case 'email':
          {
            final state =
                BlocProvider.of<SignInBloc>(context).state as SignInInitial;

            String emailAddress = state.email;
            String password = state.password;

            if (emailAddress.isEmpty) {
              return SnackBar(
                content: const Text('email address is empty'),
                backgroundColor: Colors.black.withOpacity(0.5),
                action: SnackBarAction(label: 'dismiss', onPressed: () {}),
                duration: const Duration(milliseconds: 3000),
              );
            }

            if (password.isEmpty) {
              return SnackBar(
                content: const Text('Password is empty'),
                backgroundColor: Colors.black.withOpacity(0.5),
                action: SnackBarAction(label: 'dismiss', onPressed: () {}),
                duration: const Duration(milliseconds: 3000),
              );
            }

            try {
              final credential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailAddress, password: password);

              if (credential.user == null) {
                return SnackBar(
                  content:
                      const Text('you might provide wrong email or password'),
                  backgroundColor: Colors.black.withOpacity(0.5),
                  action: SnackBarAction(label: 'dismiss', onPressed: () {}),
                  duration: const Duration(milliseconds: 3000),
                );
              }

              if (!credential!.user!.emailVerified) {
                return SnackBar(
                  content: const Text('you need to verify your email'),
                  backgroundColor: Colors.black.withOpacity(0.5),
                  action: SnackBarAction(label: 'dismiss', onPressed: () {}),
                  duration: const Duration(milliseconds: 3000),
                );
              }
              User user = credential.user as User;
              if (user != null) {
                // GET VERIFIED USER FROM DATABASE
                var name = await SecureStorage.storage
                    .write(key: 'user_name', value: user.displayName);

                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false,
                    arguments: {"username": user as User});
              } else {
                return SnackBar(
                  content: const Text('Account not found, please sign up'),
                  backgroundColor: Colors.black.withOpacity(0.5),
                  action: SnackBarAction(label: 'dismiss', onPressed: () {}),
                  duration: const Duration(milliseconds: 3000),
                );
              }
            } on FirebaseAuthException catch (e) {
              switch (e.code) {
                case 'invalid-email':
                  {
                    return SnackBar(
                      content: const Text('email is invalid'),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      action:
                          SnackBarAction(label: 'dismiss', onPressed: () {}),
                      duration: const Duration(milliseconds: 3000),
                    );
                  }
                case 'wrong-password':
                  {
                    return SnackBar(
                      content: const Text('password is wrong'),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      action:
                          SnackBarAction(label: 'dismiss', onPressed: () {}),
                      duration: const Duration(milliseconds: 3000),
                    );
                  }
                case 'user-not-found':
                  {
                    return SnackBar(
                      content: const Text(
                          'user not found, please create an account'),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      action:
                          SnackBarAction(label: 'dismiss', onPressed: () {}),
                      duration: const Duration(milliseconds: 3000),
                    );
                  }
                default:
                  {
                    return SnackBar(
                      content: Text("Error occured: ${e.message}"),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      action:
                          SnackBarAction(label: 'dismiss', onPressed: () {}),
                      duration: const Duration(milliseconds: 3000),
                    );
                  }
              }
            }
          }
      }
    } catch (e) {
      return SnackBar(
        content: Text('error occured: ${e.toString()}'),
        backgroundColor: Colors.black.withOpacity(0.5),
        action: SnackBarAction(label: 'dismiss', onPressed: () {}),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }
}
