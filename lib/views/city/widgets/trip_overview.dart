import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trips_app_flutter/models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final double amount;
  final VoidCallback setDate;
  final Trip myTrip;
  final String cityName;
  final String cityImage;

  const TripOverview(
      {super.key,
      required this.setDate,
      required this.amount,
      required this.myTrip,
      required this.cityName,
      required this.cityImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style:
                const TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(myTrip.date != null ? DateFormat("d/M/y").format(myTrip.date!) : 'Choisissez une date' ),
              ElevatedButton(
                onPressed: () {
                  setDate();
                },
                child: const Text('Selectionner une date'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Montant / Personnne',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Text(
                amount.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
