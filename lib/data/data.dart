import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/models/activity_model.dart';

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
    image: 'assets/images/activities/louvre.jpg',
    name: 'Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/chaumont.jpg',
    name: 'Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 0.00,
  ),
  Activity(
    image: 'assets/images/activities/dame.jpg',
    name: 'Notre-Dame',
    id: 'a3',
    city: 'Paris',
    price: 0.00,
  ),
  Activity(
    image: 'assets/images/activities/nice_orthodox.jpg',
    name: 'Eglise orthodoxe',
    id: 'n1',
    city: 'Nice',
    price: 5.00,
  ),
  Activity(
    image: 'assets/images/activities/nice_riviera.jpg',
    name: 'Riviera',
    id: 'n2',
    city: 'Nice',
    price: 0.00,
  ),
  Activity(
    image: 'assets/images/activities/nice_promenade.jpg',
    name: 'Promenade des Anglais',
    id: 'n3',
    city: 'Nice',
    price: 0.00,
  ),
  Activity(
    image: 'assets/images/activities/nice_opera.jpg',
    name: 'Opéra',
    id: 'n4',
    city: 'Nice',
    price: 100.00,
  ),
];
