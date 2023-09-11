part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

class SignInInitial extends SignInState {
  final bool isPassVisible;
  final String password, email;

  SignInInitial(
      {required this.email,
      required this.password,
      required this.isPassVisible});

  SignInInitial copyWith({
    String? inputPassword,
    String? inputEmail,
    bool? isPassVisible,
  }) {
    return SignInInitial(
        email: inputEmail ?? email,
        password: inputPassword ?? password,
        isPassVisible: isPassVisible ?? this.isPassVisible);
  }
}
