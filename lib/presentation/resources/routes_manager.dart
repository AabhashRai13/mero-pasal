import 'package:flutter/material.dart';
import 'package:pasal/presentation/cart/cart_screen.dart';
import 'package:pasal/presentation/complete_profile/complete_profile_screen.dart';
import 'package:pasal/presentation/details/details_screen.dart';
import 'package:pasal/presentation/home/home_screen.dart';
import 'package:pasal/presentation/login_success/login_success_screen.dart';
import 'package:pasal/presentation/profile/profile_screen.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/sign_in/sign_in_screen.dart';
import 'package:pasal/presentation/sign_up/sign_up_screen.dart';

import '../intro_screen/intro_screen.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String completeProfileScreen = "/completeProfileScreen";
  static const String loginSuccessScreen = "/loginSuccessScreen";
  static const String home = "/home";
  static const String detailScreen = "/detailScreen";
  static const String profileScreen = "/profileScreen";
  static const String cart = "/cart";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.completeProfileScreen:
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      case Routes.loginSuccessScreen:
        return MaterialPageRoute(builder: (_) => const LoginSuccessScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailScreen:
        final args = routeSettings.arguments as ProductDetailsArguments;

        return MaterialPageRoute(
            builder: (_) => DetailsScreen(productDetailsArguments: args));
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
