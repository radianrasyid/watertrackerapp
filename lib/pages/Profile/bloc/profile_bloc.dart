import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileAppBarState()) {
    on<AppBarTitleChangeEvent>(appBarTitleChangeEvent);
    on<ProfileScreenEditStateChangeEvent>(profileScreenEditStateChangeEvent);
  }

  FutureOr<void> appBarTitleChangeEvent(
      AppBarTitleChangeEvent event, Emitter<ProfileState> emit) {
    final appBarState = state as ProfileAppBarState;

    emit(appBarState.copyWith(appBarTitle: event.appBarTitle));
  }

  FutureOr<void> profileScreenEditStateChangeEvent(
      ProfileScreenEditStateChangeEvent event, Emitter<ProfileState> emit) {
    final appBarState = state as ProfileAppBarState;

    emit(appBarState.copyWith(
        profileScreenEditChange: event.profileScreenChangeValue));
  }
}
