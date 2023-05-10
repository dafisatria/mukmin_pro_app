import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/api/service.dart';
import '../model/city_model.dart';

class LoginProvider with ChangeNotifier {
  List<CityModel> cities = [];
  MyService service = MyService();
  CityModel valueCity = CityModel();
  final snackBar = const SnackBar(
    content: Text('Isi lokasi anda terlebih dahulu'),
  );

  Future getCity() async {
    try {
      cities = await service.fetchCity();
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  setValueCityId(String value) {
    valueCity.id = value;
    notifyListeners();
  }
}
