import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';
import 'package:mukmin_pro_app/model/pray_times_model.dart';
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
  List pages = [
    const HomeScreen(),
    const PrayTimesScreen(),
  ];
  int selectedIndex = 0;
  void changeSelectedNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mukmin Pro App Demo'),
        backgroundColor: const Color(0xff45871B),
        centerTitle: true,
      ),
      body: pages.elementAt(selectedIndex),
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
        currentIndex: selectedIndex,
        onTap: (index) {
          changeSelectedNavBar(index);
        },
        selectedItemColor: Color(0xff45871B),
      ),
    );
  }
}
