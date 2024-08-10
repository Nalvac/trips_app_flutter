import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/views/trip/widgets/trip_activities.dart';
import 'package:trips_app_flutter/views/trip/widgets/trip_activities_list.dart';
import 'package:trips_app_flutter/views/trip/widgets/trip_city_bar.dart';

class TripView extends StatelessWidget {

  static const String routeName = '/trip';
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>)['cityName']!;
    final String tripId = (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>)['tripId']!;

    final City city = Provider.of<CityProvider>(context, listen: false).getCityByName(cityName);


    return Scaffold(
      body: Column(
        children: <Widget>[
          TripCityBar(
            city: city,
          ),
          TripActivities(tripId: tripId)
        ],
      ),
    );
  }
}
