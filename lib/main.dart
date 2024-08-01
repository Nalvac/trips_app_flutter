import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/views/city/city_view.dart';
import 'package:trips_app_flutter/views/home/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  @override
  void initState() {
    cityProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: cityProvider),
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
          HomeView.routeName: (context) => HomeView(),
          CityView.routeName: (context) => CityView(),
        },
      ),
    );
  }
}
