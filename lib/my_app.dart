import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/view/screen/home_screen.dart';
import 'package:mukmin_pro_app/view/screen/home_view_model.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';

import 'view/screen/prayer_times_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentTab = [
    const HomeScreen(),
    const PrayTimesScreen(),
  ];
  int selectedNavbar = 0;
  void changeSelectedNavBar(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrayerTimesProvider(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Mukmin Pro Demo'),
          ),
          body: currentTab[selectedNavbar],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule),
                label: 'Prayer Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: selectedNavbar,
            onTap: (index) {
              changeSelectedNavBar(index);
            },
          ),
        ),
      ),
    );
  }
}
