import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mukmin_pro_app/my_app.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/pray_times_model.dart';

class PrayTimesScreen extends StatelessWidget {
  const PrayTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)!.settings.arguments as PrayTimesModel;
    final provider = Provider.of<PrayerTimesProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('subuh : '),
                Text(parameter.data!.jadwal!.subuh.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dzuhur : '),
                Text(parameter.data!.jadwal!.dzuhur.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ashar : '),
                Text(parameter.data!.jadwal!.ashar.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('maghrib : '),
                Text(parameter.data!.jadwal!.maghrib.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('isya : '),
                Text(parameter.data!.jadwal!.isya.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
