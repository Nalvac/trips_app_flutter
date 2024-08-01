import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/activity_model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({super.key, required this.activities, required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        var activity = activities[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(activity.image),
            ),
            title: Text(activity.name),
            subtitle: Text(
              activity.price.toString(),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => deleteTripActivity(activity),
            ),
          ),
        );
      },
    );
  }
}
