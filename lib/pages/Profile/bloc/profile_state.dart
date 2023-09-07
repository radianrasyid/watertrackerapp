part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileAppBarState extends ProfileState {
  final String AppBarTitle;
  final bool isProfileScreenEdit;

  ProfileAppBarState(
      {this.AppBarTitle = "My Profile", this.isProfileScreenEdit = false});

  ProfileAppBarState copyWith({
    String? appBarTitle,
    bool? profileScreenEditChange,
  }) {
    return ProfileAppBarState(
      AppBarTitle: appBarTitle ?? AppBarTitle,
      isProfileScreenEdit: profileScreenEditChange ?? isProfileScreenEdit,
    );
  }
}
