import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

import '../../model/api/services.dart';

enum LoginViewState {
  none,
  loading,
  error,
}

class LoginProvider with ChangeNotifier {
  LoginViewState state = LoginViewState.none;
  List cities = <CityModel>[];
  MyService service = MyService();
  CityModel valueCity = CityModel();

  changeState(LoginViewState s) {
    state = s;
    notifyListeners();
  }

  setValueCityId(String value) {
    valueCity.id = value;
    notifyListeners();
  }

  Future getCity() async {
    changeState(LoginViewState.loading);
    try {
      cities = await service.fetchCity();
      notifyListeners();
      changeState(LoginViewState.none);
    } catch (e) {
      changeState(LoginViewState.error);
    }
  }
}
