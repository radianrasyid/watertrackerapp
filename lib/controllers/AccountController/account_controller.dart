// import 'package:flutter/material.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class AccountController {
  Future<String> getDisplayName() async {
    final String displayName =
        await SecureStorage.storage.read(key: 'user_name') as String;
    print(displayName);
    return displayName;
  }
}
