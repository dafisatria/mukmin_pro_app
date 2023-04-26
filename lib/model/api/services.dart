import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mukmin_pro_app/model/city_model.dart';

class MyService {
  final Dio dio = Dio();
  Future<List<CityModel>> fetchCity() async {
    try {
      final Response response =
          await dio.get('https://api.myquran.com/v1/sholat/kota/semua');
      debugPrint(response.data.toString());
      return (response.data as List).map((e) => CityModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
