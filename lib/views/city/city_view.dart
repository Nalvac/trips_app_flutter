import 'package:flutter/material.dart';
import 'package:trips_app_flutter/views/city/activity_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;

class CityView extends StatefulWidget {
  CityView({super.key});

  final List<Activity> activity = data.activities;
  static String routeName = '/city';

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {

  void setDate() async {
    final result = showDatePicker(
      context: context,
      locale: const Locale("fr", "FR"),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) => {
      if(newDate != null) {
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
      body:  Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Paris',
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ const Text('Choisissez une date'), ElevatedButton(onPressed: () { setDate(); }, child: Text('Selectionner une date'),)],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Montant / Personnne',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '0.0',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
