import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';

class PrayTimesScreen extends StatelessWidget {
  const PrayTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrayerTimesProvider>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('subuh : '),
              Text(provider.prayTimes.data!.jadwal!.subuh.toString())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('dzuhur : '),
              Text(provider.prayTimes.data!.jadwal!.dzuhur.toString())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ashar : '),
              Text(provider.prayTimes.data!.jadwal!.ashar.toString())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('maghrib : '),
              Text(provider.prayTimes.data!.jadwal!.maghrib.toString())
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
    );
  }
}
