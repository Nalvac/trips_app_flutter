import 'package:flutter/cupertino.dart';
import 'package:trips_app_flutter/models/activity_model.dart';

class Trip {
  String city;
  String? id;
  List<Activity> activities;
  DateTime? date;

  Trip({required this.city, required this.activities, required this.date})
      : id = UniqueKey().toString();

  Trip.fromJson(Map<String, dynamic> json)
      :
        id = json['_id'],
        city = json['city'],
        date = DateTime.parse(json['date']),
        activities = (json['activities'] as List).map((activityJson) => Activity.fromJson(activityJson)).toList();

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'city': city,
        'date': date!.toIso8601String(),
        'activities': activities
            .map(
              (activity) => activity.toJson(),
        )
            .toList()
      };
    } else {
      return {
        'city': city,
        'date': date!.toIso8601String(),
        'activities': activities
            .map(
              (activity) => activity.toJson(),
        )
            .toList(),
      };
    }
  }
}
