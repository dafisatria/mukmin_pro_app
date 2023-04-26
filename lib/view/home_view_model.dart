import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

import '../model/api/services.dart';

class CityProvider with ChangeNotifier {
  List cities = <CityModel>[];
  MyService service = MyService();
  String dropDownValue = 'KAB. ACEH BARAT';

  Future get() async {
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
