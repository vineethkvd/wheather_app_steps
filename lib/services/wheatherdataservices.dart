import 'dart:convert';

import '../model/wheathermodel.dart';
import 'package:http/http.dart' as http;

class WheaterDataServices {
  final String url =
      'https://api.openweathermap.org/data/2.5/weather?q=kochi&appid=9249449b9d9dc2cb85b7c036ab971241';
  Future<WeatherDataModel> getService() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherDataModel.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
