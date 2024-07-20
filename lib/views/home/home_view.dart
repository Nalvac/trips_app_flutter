import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;
import 'package:trips_app_flutter/views/city/city_view.dart';

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
                return SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 5,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                            child: Ink.image(
                              image: AssetImage(city.image),
                              fit: BoxFit.cover,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(context, CityView.routeName),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.black54,
                            child: Text(
                              city.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
