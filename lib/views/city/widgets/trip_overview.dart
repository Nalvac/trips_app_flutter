import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;

  const TripOverview({super.key, required this.setDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paris',
            style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Choisissez une date'),
              ElevatedButton(
                onPressed: () {
                  setDate();
                },
                child: Text('Selectionner une date'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Montant / Personnne',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Text(
                '0.0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
