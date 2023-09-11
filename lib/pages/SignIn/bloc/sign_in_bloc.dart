import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc()
      : super(SignInInitial(email: "", password: "", isPassVisible: false)) {
    on<SignInEmailChangeEvent>(signInEmailChangeEvent);
    on<SignInPassChangeEvent>(signInPassChangeEvent);
    on<SignInUiPasswordVisibleChangeEvent>(signInUiPasswordVisibleChangeEvent);
  }

  FutureOr<void> signInUiPasswordVisibleChangeEvent(
      SignInUiPasswordVisibleChangeEvent event, Emitter<SignInState> emit) {
    final currentState = state as SignInInitial;

    emit(currentState.copyWith(isPassVisible: event.passVisibleValue));
  }

  FutureOr<void> signInEmailChangeEvent(
      SignInEmailChangeEvent event, Emitter<SignInState> emit) {
    final currentState = state as SignInInitial;

    emit(currentState.copyWith(inputEmail: event.emailValue));
  }

  FutureOr<void> signInPassChangeEvent(
      SignInPassChangeEvent event, Emitter<SignInState> emit) {
    final currentState = state as SignInInitial;

    emit(currentState.copyWith(inputPassword: event.password));
  }
}
