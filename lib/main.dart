import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/pray_times_model.dart';
import 'package:mukmin_pro_app/my_app.dart';
import 'package:mukmin_pro_app/view/screen/home_screen.dart';
import 'package:mukmin_pro_app/view/screen/login_screen.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_screen.dart';
import 'package:provider/provider.dart';

import 'view/screen/home_view_model.dart';
import 'view/screen/login_view_model.dart';
import 'view/screen/prayer_times_view_model.dart';

void main() {
  runApp(const MukminProApp());
}

class MukminProApp extends StatelessWidget {
  const MukminProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrayerTimesProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (_) => const LoginScreen(),
          '/my-app': (_) => const MyApp(),
          '/home': (_) => const HomeScreen(),
          '/prayer-times': (_) => const PrayTimesScreen(),
        },
      ),
    );
  }
}
