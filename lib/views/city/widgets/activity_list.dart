import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/views/city/widgets/activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<Activity> selectedActivities;
  final Function toggleActivity;

  const ActivityList(
      {super.key,
      required this.activities,
      required this.toggleActivity,
      required this.selectedActivities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: [
        ...activities.map(
          (activity) => ActivityCard(
            activity: activity,
            toggleActivity: () {
              toggleActivity(activity);
            },
            isSelected: selectedActivities.contains(activity),
          ),
        ),
      ],
    );
  }
}
