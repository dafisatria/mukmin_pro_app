import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

import '../../model/api/services.dart';

class HomeProvider with ChangeNotifier {
  List cities = <CityModel>[];
  MyService service = MyService();
  CityModel valueCity = CityModel();
  setValueCityId(String value) {
    valueCity.id = value;
    notifyListeners();
  }

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
}
