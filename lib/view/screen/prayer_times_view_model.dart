import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/api/services.dart';
import '../../model/pray_times_model.dart';

class PrayerTimesProvider with ChangeNotifier {
  PrayTimesModel prayTimes = PrayTimesModel();
  MyService service = MyService();

  Future getPrayTimes(id, year, month, day) async {
    try {
      prayTimes = await service.fetchPrayTimes(id, year, month, day);
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
