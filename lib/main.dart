import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stylish/core/services/custom_bloc_observer.dart';
import 'package:stylish/core/services/get_it_service.dart';
import 'package:stylish/core/services/shared_preferences_singleton.dart';
import 'package:stylish/firebase_options.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'features/splash/presentation/views/splash_screen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.init();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        /*colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
        ),*/
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      title: 'Stylish',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
