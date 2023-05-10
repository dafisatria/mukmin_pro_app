import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

import '../../model/api/services.dart';
import '../../model/pray_times_model.dart';

class HomeProvider with ChangeNotifier {
  List cities = <CityModel>[];
  MyService service = MyService();
  DateTime dateTime = DateTime.now();
  DateFormat inputFormat = DateFormat('HH:mm:ss');
  getParameter(BuildContext context) =>
      ModalRoute.of(context)!.settings.arguments as PrayTimesModel;
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
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.hour, from.minute, from.second);
    to = DateTime(to.hour, to.minute, to.second);
    int result = (to.difference(from).inSeconds).round();
    print(result);
    return result;
  }
}
