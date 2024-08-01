import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'dart:convert';

class CityProvider extends ChangeNotifier {
  bool isLoading = false;
  final String host = 'localhost';
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  UnmodifiableListView<City> getFilteredCity(String filter) =>
      UnmodifiableListView(_cities.where((city) =>
          city.name.toLowerCase().startsWith(filter.toLowerCase())).toList());

  City getCityByName(String name) {
    return _cities.firstWhere(
          (city) => city.name == name,
      orElse: () => City(id: 'unknown', name: 'Unknown', image: '', activities: []),
    );
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http.get(Uri.http(host, '/api/cities'));
      if (response.statusCode == 200) {
        _cities = (json.decode(response.body) as List)
            .map((cityJson) => City.fromJson(cityJson))
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
