part of 'register_acc_bloc.dart';

@immutable
sealed class RegisterAccState {}

final class RegisterAccInitial extends RegisterAccState {
  final String username, email, password, confirmPassword;

  RegisterAccInitial(
      {required this.email,
      required this.username,
      required this.password,
      required this.confirmPassword});

  RegisterAccInitial copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterAccInitial(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
