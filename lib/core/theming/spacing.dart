import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingManager {
  static double pageHorizontalPadding = 20.w;
  static const borderRadius = 15.0;
  static double mobileAppBarHeight = 60.h;
  static double desktopAppBarHeight = 100;
  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
}
