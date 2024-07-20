import 'package:flutter/material.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;
import 'package:trips_app_flutter/views/city/widgets/activity_list.dart';
import 'package:trips_app_flutter/views/city/widgets/trip_activity_list.dart';
import 'package:trips_app_flutter/views/city/widgets/trip_overview.dart';

class CityView extends StatefulWidget {
  CityView({super.key});

  final List<Activity> activities = data.activities;
  static String routeName = '/city';

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late int index;
  DateTime? result;

  List<Activity> myTrips = [];

  @override
  void initState() {
    super.initState();
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
    ).then((value) {
      setState(() {
        result = value;
      });
    });
  }

  void addActivity(Activity activity) {
    setState(() {
      if (!myTrips.contains(activity)) {
        myTrips.add(activity);
      } else {
        myTrips.remove(activity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              TripOverview(setDate: setDate),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: index == 0 ? ActivityList(
                  activities: widget.activities,
                  myTrips: myTrips,
                  toggleActivity: addActivity,
                ) : TripActivityList(activities: myTrips),
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
