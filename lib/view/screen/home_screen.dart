import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/view/screen/home_view_model.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
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
    Provider.of<HomeProvider>(context, listen: false).getCity();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Center(
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
              provider.setValueCityId(value!);
              debugPrint(provider.valueCity.id);
            },
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<PrayerTimesProvider>()
                  .getPrayTimes(provider.valueCity.id);
            },
            child: const Text('GET STARTED'),
          ),
        ],
      ),
    );
  }
}
