// ignore_for_file: unused_import, unused_local_variable, avoid_print, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../Model/model.dart';

class DioService extends ChangeNotifier {

  final TextEditingController searchBar = TextEditingController();
  
  static String _key = "152131c1dfc05a87f6f7e463a135a149"; 
  String nameCity = "Islamabad";

  Future<WeatherModel> currentWeather() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://api.openweathermap.org/data/2.5/weather?q=$nameCity&appid=$_key');
    print(response.data.toString());
    if (response.statusCode == 200) {
      WeatherModel currentResult = WeatherModel.fromJson(response.data);
      return currentResult;
    } else {
      return WeatherModel();
    }
  }

  searchCityName(String name) {
    nameCity =name;
    currentWeather();
    notifyListeners();
  }


}
