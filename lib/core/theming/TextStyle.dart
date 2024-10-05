import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class TextStyleTheme {
  static TextStyle text22Regular = TextStyle(
      fontSize: 22.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.regular);

  static TextStyle text24Bold = TextStyle(
      fontSize: 24.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.bold);

  static TextStyle text10Regular = TextStyle(
      fontSize: 10.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.regular);

  static TextStyle text15Regular = TextStyle(
      fontSize: 15.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.regular);

  static TextStyle text15Bold = TextStyle(
      fontSize: 15.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.bold);

  static TextStyle text13Regular = TextStyle(
      fontSize: 13.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.regular);

  static TextStyle text13Bold = TextStyle(
      fontSize: 13.sp,
      color: ColorsTheme.primaryColor,
      fontWeight: FontWeightHelper.bold);
}
