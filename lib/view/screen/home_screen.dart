import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mukmin_pro_app/model/city_model.dart';
import 'package:mukmin_pro_app/view/screen/home_view_model.dart';
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
            (provider.prayTimes.data == null)
                ? SizedBox()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('subuh : '),
                          Text(
                              provider.prayTimes.data!.jadwal!.subuh.toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('dzuhur : '),
                          Text(provider.prayTimes.data!.jadwal!.dzuhur
                              .toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ashar : '),
                          Text(
                              provider.prayTimes.data!.jadwal!.ashar.toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('maghrib : '),
                          Text(provider.prayTimes.data!.jadwal!.maghrib
                              .toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('isya : '),
                          Text(provider.prayTimes.data!.jadwal!.isya.toString())
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
      ),
    );
  }
}
