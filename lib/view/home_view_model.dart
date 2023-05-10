import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/api/service.dart';
import '../model/city_model.dart';
import '../model/pray_times_model.dart';

class HomeProvider with ChangeNotifier {
  PrayTimesModel prayTimes = PrayTimesModel();
  CityModel cityId = CityModel();
  MyService service = MyService();
  DateTime now = DateTime.now();
  String? formattedDiff;
  DateTime? subuh, dzuhur, ashar, maghrib, isya;

  void getDifference(DateTime now, DateTime prayTime) {
    String nows = DateFormat.Hms().format(now);
    String prayTimes = DateFormat.Hms().format(prayTime);
    DateTime nowss = DateFormat.Hms().parse(nows);
    DateTime prayTimess = DateFormat.Hms().parse(prayTimes);
    Duration difference = prayTimess.difference(nowss);
    int totalSecond = difference.inSeconds;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSecond > 0) {
        totalSecond--;
        notifyListeners();
        Duration remainingTime = Duration(seconds: totalSecond);
        notifyListeners();
        formattedDiff =
            '-${remainingTime.inHours.toString().padLeft(2, '0')}:${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}';
      } else {
        timer.cancel();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void updatePrayTimesModel(PrayTimesModel model) {
    prayTimes = model;
    notifyListeners();
  }

  void setDateTimes(PrayTimesModel pt) {
    subuh = DateFormat('yyyy-MM-dd HH:mm')
        .parse('${pt.data!.jadwal!.date!} ${pt.data!.jadwal!.subuh!}');
    dzuhur = DateFormat('yyyy-MM-dd HH:mm')
        .parse('${pt.data!.jadwal!.date!} ${pt.data!.jadwal!.dzuhur!}');
    ashar = DateFormat('yyyy-MM-dd HH:mm')
        .parse('${pt.data!.jadwal!.date!} ${pt.data!.jadwal!.ashar!}');
    maghrib = DateFormat('yyyy-MM-dd HH:mm')
        .parse('${pt.data!.jadwal!.date!} ${pt.data!.jadwal!.maghrib!}');
    isya = DateFormat('yyyy-MM-dd HH:mm')
        .parse('${pt.data!.jadwal!.date!} ${pt.data!.jadwal!.isya!}');
    notifyListeners();
  }

  Future getPrayTimes({
    required String id,
    required String year,
    required String month,
    required String day,
  }) async {
    try {
      prayTimes = await service.fetchPrayTimes(id, year, month, day);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
