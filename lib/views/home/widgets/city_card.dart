import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/views/city/city_view.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  child: Hero(
                    tag: city.name,
                    child: Image.network(
                      city.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/city',
                      arguments: city.name,
                    );
                  },
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
