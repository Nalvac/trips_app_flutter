
import 'package:trips_app_flutter/models/activity_model.dart';

class City {
  String id;
  String name;
  String image;
  List<Activity> activities;
  City({required this.id, required this.name, required this.image, required this.activities});


  City.fromJson(Map<String, dynamic> json)
    : id = json['_id'],
      image = json['image'],
      name = json['name'],
      activities = (json['activities'] as List).map((activityJson) => Activity.fromJson(activityJson)).toList();
}
