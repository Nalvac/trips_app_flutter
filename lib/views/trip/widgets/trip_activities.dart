import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/views/trip/widgets/trip_activities_list.dart';

class TripActivities extends StatelessWidget {
  final String tripId;

  const TripActivities({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.blue[700],
            child: const TabBar(
              indicatorColor: Colors.white,
              labelColor:
              Colors.white, // Couleur du texte des onglets sélectionnés
              unselectedLabelColor: Colors.white54,
              tabs: const [
                Tab(
                  text: 'En cours',
                ),
                Tab(
                  text: 'Terminés',
                )
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [TripActivitiesList(tripId: tripId, filter: ActivityStatus.ongoing), TripActivitiesList(tripId: tripId, filter: ActivityStatus.done)],
            ),
          )
        ],
      ),
    );
  }
}
