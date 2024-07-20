import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;
import 'package:trips_app_flutter/views/home/widgets/city_card.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static String routeName = '/';

  final List<City> cities = data.cities;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
        leading: const Icon(Icons.house),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ...widget.cities.map(
              (city) {
                return CityCard(city: city);
              },
            ),
          ],
        ),
      ),
    );
  }
}
