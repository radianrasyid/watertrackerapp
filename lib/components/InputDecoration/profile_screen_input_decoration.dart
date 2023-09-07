import 'package:flutter/material.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class ProfileScreenInputDecoration {
  static InputDecoration profieScreenInputDecoration = InputDecoration(
    fillColor: AppColor.mainBg.withOpacity(0.3),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );

  static InputDecoration profileScreenEditInputDecoration = InputDecoration(
    fillColor: AppColor.mainBg.withOpacity(0.3),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );
}
