import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';
import 'package:mukmin_pro_app/model/pray_times_model.dart';

import '../../model/api/services.dart';

class CityProvider with ChangeNotifier {
  List cities = <CityModel>[];
  PrayTimesModel prayTimes = PrayTimesModel();
  MyService service = MyService();
  CityModel valueCity = CityModel();

  Future getCity() async {
    try {
      cities = await service.fetchCity();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  Future getPrayTimes(value) async {
    try {
      prayTimes = await service.fetchPrayTimes(value);
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
