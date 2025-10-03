import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/core/services/fire_base_auth_service.dart';
import 'package:stylish/core/services/shared_preferences_singleton.dart';
import 'package:stylish/features/authentication/presentation/view/signin_screen.dart';
import 'package:stylish/features/home/presentation/views/home_screen.dart';
import '../../../on_boarding/presentation/views/on_boarding_screen.dart';
import 'widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SplashScreenBody(),
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isLoggedIn = FireBaseAuthService().isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninScreen.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }
    });
  }
}
