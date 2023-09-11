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

  static logRegScreenInputDecoration(
      {required String hintText,
      Icon? prefixIcon,
      Icon? suffixIcon,
      void Function()? onTapSuffix}) {
    return InputDecoration(
      fillColor: AppColor.secondaryTextColor.withOpacity(0.1),
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: InkWell(
        onTap: onTapSuffix ?? () {},
        child: suffixIcon,
      ),
      suffixIconConstraints: BoxConstraints(
        maxHeight: 24,
        maxWidth: 40,
        minHeight: 24,
        minWidth: 40,
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}
