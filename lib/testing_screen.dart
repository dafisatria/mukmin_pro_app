import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/pray_times_model.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PrayerTimesProvider>(context, listen: false).getPrayTimes();
  }

  PrayTimesModel pt = PrayTimesModel();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrayerTimesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TESTING'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (pt != null)
                ? Text(provider.prayTimes.data!.jadwal!.ashar.toString())
                : Text('null')
          ],
        ),
      ),
    );
  }
}
