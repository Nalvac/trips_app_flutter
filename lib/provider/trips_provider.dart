import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/models/trip_model.dart';
import 'package:http/http.dart' as http;

class TripsProvider extends ChangeNotifier {
  bool isLoading = false;
  final String host = 'localhost';
  List<Trip> _trips = [];

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http.get(Uri.http(host, '/api/trips'));
      if (response.statusCode == 200) {
        _trips = (json.decode(response.body) as List)
            .map((tripJson) => Trip.fromJson(tripJson))
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  Future<void> addTrip(Trip trip) async {
    try {
      isLoading = true;
      http.Response response = await http.post(
        Uri.http(
          host,
          '/api/trip',
        ),
        body: json.encode(
          trip.toJson(),
        ),
        headers: {'Content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        _trips.add(
          Trip.fromJson(
            json.decode(response.body),
          ),
        );
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
  Trip getById(String id) {
    return trips.firstWhere((trip) => trip.id == id);
  }
  Future<void> updateTrip(Trip trip, String activityId) async {
    try {
      Activity activity =
      trip.activities.firstWhere((activity) => activity.id == activityId);
      activity.status = ActivityStatus.done;
      http.Response response = await http.put(
        Uri.http(host, '/api/trip'),
        body: json.encode(
          trip.toJson(),
        ),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode != 200) {
        activity.status = ActivityStatus.ongoing;
        throw const HttpException('error');
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
