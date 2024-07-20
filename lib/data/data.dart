import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/views/city/activity_model.dart';

List<City> cities = [
  City(
    id: '',
    name: 'Paris',
    image: 'assets/images/paris.jpg',
  ),

  City(
    id: '',
    name: 'Lyon',
    image: 'assets/images/lyon.jpg',
  ),
  City(
    id: '',
    name: 'Nice',
    image: 'assets/images/nice.jpg',
  )

];

List<Activity> activities = [
  Activity(
    image: 'assets/images/activities/louvre.jpeg',
    name: 'Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/chaumont.jpeg',
    name: 'Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 0.00,
  ),
  Activity(
    image: 'assets/images/activities/dame.jpeg',
    name: 'Notre-Dame',
    id: 'a3',
    city: 'Paris',
    price: 0.00,
  ),
];
