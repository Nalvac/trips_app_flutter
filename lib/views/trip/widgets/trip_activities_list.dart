import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/models/trip_model.dart';
import 'package:trips_app_flutter/provider/trips_provider.dart';

class TripActivitiesList extends StatelessWidget {
  final String tripId;
  final ActivityStatus filter;

  const TripActivitiesList(
      {super.key, required this.tripId, required this.filter});

  @override
  Widget build(BuildContext context) {
    final Trip trip = Provider.of<TripsProvider>(context).getById(tripId);
    final List<Activity> activities =
        trip.activities.where((activity) => activity.status == filter).toList();
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        final Activity activity = activities[i];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.ongoing
              ? Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent[700],
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  key: ValueKey(activity.id),
                  child: Card(
                    child: ListTile(
                      title: Text(activity.name),
                    ),
                  ),
                  confirmDismiss: (_) =>
                      Provider.of<TripsProvider>(context, listen: false)
                          .updateTrip(trip, activity.id!)
                          .then((_) => true)
                          .catchError((_) => false),
                )
              : Card(
                  child: ListTile(
                    title: Text(
                      activity.name,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
