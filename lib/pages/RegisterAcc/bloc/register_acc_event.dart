part of 'register_acc_bloc.dart';

@immutable
sealed class RegisterAccEvent {}

class RegisterUsernameChangeEvent extends RegisterAccEvent {
  final String inputUsername;

  RegisterUsernameChangeEvent({required this.inputUsername});
}

class RegisterEmailChangeEvent extends RegisterAccEvent {
  final String inputEmail;

  RegisterEmailChangeEvent({required this.inputEmail});
}

class RegisterPasswordChangeEvent extends RegisterAccEvent {
  final String inputPassword;

  RegisterPasswordChangeEvent({required this.inputPassword});
}

class RegisterConfirmPasswordChangeEvent extends RegisterAccEvent {
  final String inputConfirmPassword;

  RegisterConfirmPasswordChangeEvent({required this.inputConfirmPassword});
}
