import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/provider/trips_provider.dart';
import 'package:trips_app_flutter/views/trips/widgets/trip_list.dart';
import 'package:trips_app_flutter/widgets/drawer.dart';
import 'package:trips_app_flutter/widgets/loader.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  static String routeName = '/trips';

  @override
  Widget build(BuildContext context) {
    TripsProvider tripsProvider = Provider.of<TripsProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          title: const Text(
            'Mes voyages',
          ),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor:
                  Colors.white, // Couleur du texte des onglets sélectionnés
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(
                  text: 'A venir',
                ),
                Tab(text: ' Passés'),
              ]),
        ),
        drawer: const DrawerWidget(),
        body: tripsProvider.isLoading == false
            ? tripsProvider.trips.isNotEmpty
                ? TabBarView(
                    children: [
                      TripList(
                          trips: tripsProvider.trips
                              .where(
                                  (trip) => DateTime.now().isBefore(trip.date!))
                              .toList()),
                      TripList(
                          trips: tripsProvider.trips
                              .where(
                                  (trip) => DateTime.now().isAfter(trip.date!))
                              .toList()),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    child: const Text('Aucun voyage pour le moment'),
                  )
            : const Loader(),
      ),
    );
  }
}
