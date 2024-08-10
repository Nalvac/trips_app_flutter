import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
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
  Future<dynamic> verifyIfActivityNameIsUnique(
      String cityName, String activityName) async {
    try {
      City city = getCityByName(cityName);
      http.Response response = await http.get(Uri.http(
          host, '/api/city/${city.id}/activities/verify/$activityName'));
      print(response.statusCode);
      if (response.statusCode != 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addActivityToCity(Activity newActivity) async {
    try {
      String cityId = getCityByName(newActivity.city).id;
      http.Response response = await http.post(
        Uri.http(host, '/api/city/$cityId/activity'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          newActivity.toJson(),
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        int index = _cities.indexWhere((city) => city.id == cityId);
        _cities[index] = City.fromJson(
          json.decode(response.body),
        );
        notifyListeners();
      }
    } catch (e) {
      print('error');
      rethrow;
    }
  }
}
