import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/models/trip_model.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/views/city/widgets/activity_list.dart';
import 'package:trips_app_flutter/views/city/widgets/trip_activity_list.dart';
import 'package:trips_app_flutter/views/city/widgets/trip_overview.dart';

class CityView extends StatefulWidget {
  CityView({super.key});

  final List<City> city = data.cities;
  static String routeName = '/city';

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late int index;
  late Trip myTrip;

  DateTime? result;

  @override
  void initState() {
    super.initState();
    myTrip = Trip(city: '', activities: [], date: null);
    index = 0;
  }

  void switchIndex(nexIndex) {
    setState(() {
      print(nexIndex);
      index = nexIndex;
    });
  }

  void setDate() {
    showDatePicker(
      context: context,
      locale: const Locale("fr", "FR"),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
    });
  }

  void toggleActivity(Activity activity) {
    setState(() {
      myTrip.activities.contains(activity)
          ? myTrip.activities.remove(activity)
          : myTrip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      myTrip.activities.remove(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation du voyage'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Column(
            children: [
              TripOverview(setDate: setDate, amount:  amount, cityImage: city.image, cityName: cityName, myTrip: myTrip,),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: index == 0
                    ? ActivityList(
                        activities: city.activities,
                        selectedActivities: myTrip.activities,
                        toggleActivity: toggleActivity,
                      )
                    : TripActivityList(
                        activities: myTrip.activities,
                        deleteTripActivity: deleteTripActivity),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Découvert'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: 'Mes activités')
        ],
        onTap: switchIndex,
      ),
    );
  }
}
