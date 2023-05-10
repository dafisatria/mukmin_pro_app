import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home_screen.dart';
import 'view/home_view_model.dart';
import 'view/login_screen.dart';
import 'view/login_view_model.dart';
import 'view/pray_times_month_screen.dart';
import 'view/pray_times_month_view_model.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const DummyApp());
}

class DummyApp extends StatelessWidget {
  const DummyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrayTimesMonthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashScreen(),
          '/login': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/pray-times': (_) => const PrayTimesMonthScreen(),
        },
      ),
    );
  }
}
