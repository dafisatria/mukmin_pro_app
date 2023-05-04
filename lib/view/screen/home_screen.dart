import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/my_app.dart';
import 'package:mukmin_pro_app/view/screen/home_view_model.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

import 'prayer_times_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerBuilder.periodic(
              const Duration(seconds: 1),
              builder: (context) {
                String second = DateTime.now().second < 10
                    ? "0${DateTime.now().second}"
                    : DateTime.now().second.toString();
                String minute = DateTime.now().minute < 10
                    ? "0${DateTime.now().minute}"
                    : DateTime.now().minute.toString();
                String hour = DateTime.now().hour < 10
                    ? "0${DateTime.now().hour}"
                    : DateTime.now().hour.toString();
                return SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Today ",
                      ),
                      Text(
                        "$hour:$minute:$second",
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
