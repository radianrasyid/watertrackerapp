import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watertrackerapp/pages/Profile/bloc/profile_bloc.dart';
import 'package:watertrackerapp/pages/Profile/ui/profile_edit_screen.dart';
import 'package:watertrackerapp/pages/Profile/ui/profile_screen.dart';

class ProfileParentScreen extends StatelessWidget {
  const ProfileParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => current is ProfileAppBarState,
      builder: (context, state) {
        final profileState = state as ProfileAppBarState;

        return Container(
          child: profileState.isProfileScreenEdit == false
              ? ProfileScreen()
              : ProfileEditScreen(),
        );
      },
    );
  }
}
