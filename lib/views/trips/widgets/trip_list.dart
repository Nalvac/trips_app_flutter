import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trips_app_flutter/models/trip_model.dart';
import 'package:trips_app_flutter/views/trips/trips_view.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  const TripList({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, i) {
        var trip = trips[i];
        return ListTile(
          title: Text(trip.city),
          subtitle: trip.date != null
              ? Text(DateFormat('d/M/y').format(trip.date!))
              : null,
          trailing: const Icon(Icons.info),
          onTap: () {
            Navigator.pushNamed(context, TripsView.routeName, arguments: {'tripId': trip.id, 'cityName': trip.city});
          },
        );
      },
    );
  }
}
