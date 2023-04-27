import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mukmin_pro_app/model/city_model.dart';
import 'package:mukmin_pro_app/view/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CityProvider>(context, listen: false).getCity();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mukmin Pro Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: provider.valueCity.id,
              items: provider.cities.map(
                (item) {
                  return DropdownMenuItem(
                    value: item.id.toString(),
                    child: Text(item.lokasi.toString()),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(
                  () {
                    provider.valueCity.id = value;
                    debugPrint(provider.valueCity.id);
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                provider.getPrayTimes(provider.valueCity.id);
              },
              child: const Text('GET STARTED'),
            ),
          ],
        ),
      ),
    );
  }
}
