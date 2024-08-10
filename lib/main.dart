import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/provider/trips_provider.dart';
import 'package:trips_app_flutter/views/activity_form/activity_form_view.dart';
import 'package:trips_app_flutter/views/city/city_view.dart';
import 'package:trips_app_flutter/views/home/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trips_app_flutter/views/not-found/not_found.dart';
import 'package:trips_app_flutter/views/trip/trip_view.dart';
import 'package:trips_app_flutter/views/trips/trips_view.dart';

void main() {
  runApp(const MyTrips());
}

class MyTrips extends StatefulWidget {
  const MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  final CityProvider cityProvider = CityProvider();
  final TripsProvider tripsProvider = TripsProvider();

  @override
  void initState() {
    cityProvider.fetchData();
    tripsProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: cityProvider),
        ChangeNotifierProvider.value(value: tripsProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fr'), // français
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          HomeView.routeName: (_) => HomeView(),
          CityView.routeName: (_) => CityView(),
          TripView.routeName: (_) => const TripView(),
          TripsView.routeName: (_) => const TripsView(),
          ActivityFormView.routeName: (_) => const ActivityFormView(),
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => const NotFound(),
        ),
      ),
    );
  }
}
