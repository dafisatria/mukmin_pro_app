import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/api/service.dart';
import '../model/pray_times_model.dart';
import '../model/pray_times_month_model.dart';

class PrayTimesMonthProvider with ChangeNotifier {
  PrayTimesMonthModel prayTimes = PrayTimesMonthModel();
  MyService service = MyService();
  DateTime now = DateTime.now();

  Future getPrayTimesMonth({
    required String id,
    required String year,
    required String month,
  }) async {
    try {
      prayTimes = await service.fetchPrayTimesMonth(id, year, month);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void updatePrayTimesModel(PrayTimesMonthModel model) {
    prayTimes = model;
    notifyListeners();
  }
}
