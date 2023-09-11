import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watertrackerapp/pages/RegisterAcc/bloc/register_acc_bloc.dart';

class RegisterAccController {
  final BuildContext context;

  const RegisterAccController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterAccBloc>().state as RegisterAccInitial;

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    final Map<String, dynamic> myMap = {
      'username': username,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };

    bool validateForm = true;

    List<String> needValidation = [];

    myMap.forEach((key, value) {
      if (value.isEmpty) {
        validateForm = false;
        needValidation.add(key);
      }
    });

    if (needValidation.isNotEmpty) {
      SnackBar(
        content: Text('${needValidation.toString()} got errors'),
        backgroundColor: Colors.black.withOpacity(0.5),
        action: SnackBarAction(label: 'dismiss', onPressed: () {}),
        duration: const Duration(milliseconds: 3000),
      );
      return;
    }

    if (password != confirmPassword) {
      SnackBar(
        content: Text('Password is not the same'),
        backgroundColor: Colors.black.withOpacity(0.5),
        action: SnackBarAction(label: 'dismiss', onPressed: () {}),
        duration: const Duration(milliseconds: 3000),
      );
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        SnackBar(
          content: const Text(
              'An email has been sent to your email address to verify'),
          backgroundColor: Colors.black.withOpacity(0.5),
          action: SnackBarAction(label: 'dismiss', onPressed: () {}),
          duration: const Duration(milliseconds: 3000),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      SnackBar(
        content: Text('error occured: ${e.toString()}'),
        backgroundColor: Colors.black.withOpacity(0.5),
        action: SnackBarAction(label: 'dismiss', onPressed: () {}),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }
}
