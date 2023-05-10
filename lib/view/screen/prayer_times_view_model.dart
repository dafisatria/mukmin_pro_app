import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/api/services.dart';
import '../../model/pray_times_model.dart';

class PrayerTimesProvider with ChangeNotifier {
  PrayTimesModel prayTimes = PrayTimesModel();
  MyService service = MyService();
  DateTime now = DateTime.now();

  Future getPrayTimes() async {
    try {
      prayTimes = await service.fetchPrayTimes(
        '1634',
        now.year.toString(),
        now.month.toString(),
        now.day.toString(),
      );
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
