import 'package:flutter/material.dart';
import 'package:stylish/features/authentication/presentation/view/signin_screen.dart';
import 'package:stylish/features/authentication/presentation/view/sign_up_screen.dart';
import 'package:stylish/features/home/presentation/views/home_screen.dart';
import 'package:stylish/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:stylish/features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SigninScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
