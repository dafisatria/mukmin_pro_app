import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../city_model.dart';
import '../pray_times_model.dart';
import '../pray_times_month_model.dart';

class MyService {
  final Dio dio = Dio();
  Future<List<CityModel>> fetchCity() async {
    try {
      final Response response =
          await dio.get('https://api.myquran.com/v1/sholat/kota/semua');
      debugPrint(response.data.toString());
      var cityModels =
          (response.data as List).map((e) => CityModel.fromJson(e)).toList();
      return cityModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<PrayTimesModel> fetchPrayTimes(
      String id, String year, String month, String day) async {
    try {
      final Response response = await dio.get(
          'https://api.myquran.com/v1/sholat/jadwal/$id/$year/$month/$day');
      debugPrint(response.data.toString());
      var prayTimesModels = PrayTimesModel.fromJson(response.data);
      return prayTimesModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<PrayTimesMonthModel> fetchPrayTimesMonth(
      String id, String year, String month) async {
    try {
      final Response response = await dio
          .get('https://api.myquran.com/v1/sholat/jadwal/$id/$year/$month');
      debugPrint(response.data.toString());
      var prayTimesModels = PrayTimesMonthModel.fromJson(response.data);
      return prayTimesModels;
    } catch (e) {
      rethrow;
    }
  }
}
