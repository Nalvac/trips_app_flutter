import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trips_app_flutter/views/city/activity_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;

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
        myTrips
            .add(activity);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Paris',
                style: TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(result != null
                      ? DateFormat("d/M/y").format(result!)
                      : 'Choisissez une date'),
                  ElevatedButton(
                    onPressed: () {
                      setDate();
                    },
                    child: Text('Selectionner une date'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Montant / Personnne',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '0.0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: [
                    ...widget.activities.map(
                      (activity) {
                        return Card(
                          elevation: 2,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Ink.image(
                                image: AssetImage(activity.image),
                                fit: BoxFit.cover,
                                child: InkWell(
                                  onTap: () {
                                    addActivity(activity);
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (myTrips.contains(activity))
                                          const Icon(Icons.check, color: Colors.white, size: 40,)
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: FittedBox(
                                            child: Text(
                                              'Titre de lactivité',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
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
