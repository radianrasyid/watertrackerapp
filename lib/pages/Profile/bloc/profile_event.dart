part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class AppBarTitleChangeEvent extends ProfileEvent {
  final String appBarTitle;

  AppBarTitleChangeEvent({required this.appBarTitle});
}

class ProfileScreenEditStateChangeEvent extends ProfileEvent {
  final bool profileScreenChangeValue;

  ProfileScreenEditStateChangeEvent({required this.profileScreenChangeValue});
}
