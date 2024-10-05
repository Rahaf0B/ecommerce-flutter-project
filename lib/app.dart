import 'package:ecommerce/core/routing/app_router.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/screens/onboarding/mobile/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key, required this.route});
  final AppRouter route;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, child) {
          return MaterialApp(
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 900, name: MOBILE),
                const Breakpoint(start: 901, end: 1200, name: TABLET),
                const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
              ],
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: ScreenRoutes.loginScreen,
            onGenerateRoute: route.generateRoute,
            theme: ThemeData(
                bottomSheetTheme: const BottomSheetThemeData(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    backgroundColor: ColorsTheme.whiteColor),
                fontFamily: "Inter",
                scaffoldBackgroundColor: ColorsTheme.whiteColor,
                bottomAppBarTheme:
                const BottomAppBarTheme(color: ColorsTheme.whiteColor),
                appBarTheme: const AppBarTheme(
                  toolbarHeight: 80,
                  scrolledUnderElevation: 0,
                  color: ColorsTheme.whiteColor,
                ),
                drawerTheme: const DrawerThemeData(
                    backgroundColor: ColorsTheme.whiteColor)),
          );
        });
  }
}
