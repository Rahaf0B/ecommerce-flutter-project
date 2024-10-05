import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await ScreenUtil.ensureScreenSize();
  runApp(App(route: AppRouter()));
}
