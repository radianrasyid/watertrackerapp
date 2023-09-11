import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_acc_event.dart';
part 'register_acc_state.dart';

class RegisterAccBloc extends Bloc<RegisterAccEvent, RegisterAccState> {
  RegisterAccBloc()
      : super(RegisterAccInitial(
            email: "", username: "", confirmPassword: "", password: "")) {
    on<RegisterUsernameChangeEvent>(registerUsernameChangeEvent);
    on<RegisterEmailChangeEvent>(registerEmailChangeEvent);
    on<RegisterConfirmPasswordChangeEvent>(
        registerEmailConfirmPasswordChangeEvent);
    on<RegisterPasswordChangeEvent>(registerPasswordChangeEvent);
  }

  FutureOr<void> registerUsernameChangeEvent(
      RegisterUsernameChangeEvent event, Emitter<RegisterAccState> emit) {
    final currentState = state as RegisterAccInitial;

    emit(currentState.copyWith(username: event.inputUsername));
  }

  FutureOr<void> registerEmailChangeEvent(
      RegisterEmailChangeEvent event, Emitter<RegisterAccState> emit) {
    final currentState = state as RegisterAccInitial;

    emit(currentState.copyWith(email: event.inputEmail));
  }

  FutureOr<void> registerEmailConfirmPasswordChangeEvent(
      RegisterConfirmPasswordChangeEvent event,
      Emitter<RegisterAccState> emit) {
    final currentState = state as RegisterAccInitial;

    emit(currentState.copyWith(confirmPassword: event.inputConfirmPassword));
  }

  FutureOr<void> registerPasswordChangeEvent(
      RegisterPasswordChangeEvent event, Emitter<RegisterAccState> emit) {
    final currentState = state as RegisterAccInitial;

    emit(currentState.copyWith(password: event.inputPassword));
  }
}
