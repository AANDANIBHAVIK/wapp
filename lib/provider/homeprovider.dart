import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wapp/model/weatherDataModel.dart';

class Home_Provider extends ChangeNotifier {
  String lat = "21.1702";
  String lon = "72.8311";

  void change(String clat, String clon) {
    lat = clat;
    lat = clat;
    notifyListeners();
  }

  Future<WeatherDataModel> weatherapi(String latitude, String longitude) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=9628b95a2235abb2f18055013ade5de8";

    var jsonString = await http.get(Uri.parse(link));
    var json = jsonDecode(jsonString.body);

    return WeatherDataModel.fromJson(json);
  }


}
