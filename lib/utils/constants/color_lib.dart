import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppColor {
  static const mainBg = Color(0xFF5DCCFC);
  static const softWhite = Color(0xFFFBFAF5);
  static const softBlack = Color(0xFF0e1111);
  static const contentMainBg = Color(0xFFF4F8FB);
  static const secondaryTextColor = Color(0xFF90A5B4);
  static const readOnlyTextColor = Color(0xFF5E5D5D);
}

class SecureStorage {
  static const storage = FlutterSecureStorage();
}
