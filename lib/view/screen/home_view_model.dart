import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

import '../../model/api/services.dart';

class HomeProvider with ChangeNotifier {
  List cities = <CityModel>[];
  MyService service = MyService();
  DateTime dateTime = DateTime.now();
  // Timer? everySec;

  // setDateTime() {
  //   everySec = Timer.periodic(
  //     Duration(seconds: 1),
  //     (timer) {
  //       dateTime = DateTime.now();
  //       notifyListeners();
  //     },
  //   );
  // }
}
