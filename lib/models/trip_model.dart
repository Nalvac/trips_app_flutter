import 'package:flutter/cupertino.dart';
import 'package:trips_app_flutter/models/activity_model.dart';

class Trip {
  String city;
  String id;
  List<Activity> activities;
  DateTime? date;

  Trip({required this.city, required this.activities, required this.date}): id = UniqueKey().toString();
}
