import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/screens/login/mobile/login.dart';
import 'package:ecommerce/screens/onboarding/mobile/onboarding_screen.dart';
import 'package:ecommerce/screens/register/mobile/register.dart';
import 'package:flutter/material.dart';


class AppRouter {
  /// Generate a route based on the given [RouteSettings].
  ///
  /// The returned route is used by the [Navigator] to generate a new screen.
  ///
  /// The [RouteSettings.name] is used to determine which route to generate.
  ///
  /// The [RouteSettings.arguments] are used to pass arguments to the route.
  ///
  /// The generated route is a [MaterialPageRoute] and it will be used
  /// to generate a new screen.
  ///
  /// The [MaterialPageRoute.builder] is used to build the screen.
  /// The builder function is called with the current [BuildContext] and
  /// should return a [Widget] that is the screen to be displayed.
  ///
  /// The generated route is returned as a [Route] object.
  ///

  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name!) {
      case ScreenRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case ScreenRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const Register());
      case ScreenRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}
