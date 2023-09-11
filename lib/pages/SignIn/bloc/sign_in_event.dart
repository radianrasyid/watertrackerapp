part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInUiPasswordVisibleChangeEvent extends SignInEvent {
  final bool? passVisibleValue;

  SignInUiPasswordVisibleChangeEvent({this.passVisibleValue});
}

class SignInEmailChangeEvent extends SignInEvent {
  final String emailValue;

  SignInEmailChangeEvent({required this.emailValue});
}

class SignInPassChangeEvent extends SignInEvent {
  final String password;

  SignInPassChangeEvent({required this.password});
}
