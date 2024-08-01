import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/models/activity_model.dart';


List<City> cities = [
  City(
    id: 'c1',
    name: 'Paris',
    image: 'assets/images/paris.jpg',
    activities: [
      Activity(
        id: 'a1',
        name: 'Musée du Louvre',
        image: 'assets/images/activities/louvre.jpg',
        city: 'Paris',
        price: 12.00,
      ),
      Activity(
        id: 'a2',
        name: 'Buttes-Chaumont',
        image: 'assets/images/activities/chaumont.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a3',
        name: 'Notre-Dame',
        image: 'assets/images/activities/dame.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a4',
        name: 'La Défense',
        image: 'assets/images/activities/defense.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a5',
        name: 'Tour Eiffel',
        image: 'assets/images/activities/effeil.jpg',
        city: 'Paris',
        price: 15.00,
      ),
      Activity(
        id: 'a6',
        name: 'Jardin du Luxembourg',
        image: 'assets/images/activities/luxembourg.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a7',
        name: 'Bibliothèque Mitterrand',
        image: 'assets/images/activities/mitterrand.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a8',
        name: 'Montmartre',
        image: 'assets/images/activities/montmartre.jpg',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        id: 'a9',
        name: 'Catacombes',
        image: 'assets/images/activities/catacombe.jpg',
        city: 'Paris',
        price: 10.00,
      ),
    ],
  ),
  City(
    id: 'c2',
    name: 'Lyon',
    image: 'assets/images/lyon.jpg',
    activities: [
      Activity(
        id: 'l1',
        name: 'Opéra',
        image: 'assets/images/activities/lyon_opera.jpg',
        city: 'Lyon',
        price: 100.00,
      ),
      Activity(
        id: 'l2',
        name: 'Place Bellecour',
        image: 'assets/images/activities/lyon_bellecour.jpg',
        city: 'Lyon',
        price: 0.00,
      ),
      Activity(
        id: 'l3',
        name: 'Basilique St-Pierre',
        image: 'assets/images/activities/lyon_basilique.jpg',
        city: 'Lyon',
        price: 10.00,
      ),
      Activity(
        id: 'l4',
        name: 'Mairie',
        image: 'assets/images/activities/lyon_mairie.jpg',
        city: 'Lyon',
        price: 0.00,
      ),
    ],
  ),
  City(
    id: 'c3',
    name: 'Nice',
    image: 'assets/images/nice.jpg',
    activities: [
      Activity(
        id: 'n1',
        name: 'Eglise orthodoxe',
        image: 'assets/images/activities/nice_orthodox.jpg',
        city: 'Nice',
        price: 5.00,
      ),
      Activity(
        id: 'n2',
        name: 'Riviera',
        image: 'assets/images/activities/nice_riviera.jpg',
        city: 'Nice',
        price: 0.00,
      ),
      Activity(
        id: 'n3',
        name: 'Promenade des Anglais',
        image: 'assets/images/activities/nice_promenade.jpg',
        city: 'Nice',
        price: 0.00,
      ),
      Activity(
        id: 'n4',
        name: 'Opéra',
        image: 'assets/images/activities/nice_opera.jpg',
        city: 'Nice',
        price: 100.00,
      ),
    ],
  ),
];

