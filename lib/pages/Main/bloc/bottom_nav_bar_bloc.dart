import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial(indexedTab: 0)) {
    on<BottomNavBarEventChange>(bottomNavBarEventChange);
  }

  FutureOr<void> bottomNavBarEventChange(
      BottomNavBarEventChange event, Emitter<BottomNavBarState> emit) {
    final currentState = state as BottomNavBarInitial;

    emit(currentState.copyWith(indexTab: event.newIndex));
  }
}
