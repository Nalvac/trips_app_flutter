import 'package:flutter/material.dart';
import 'package:trips_app_flutter/widgets/drawer.dart';
import 'widgets/activity_form.dart';

class ActivityFormView extends StatelessWidget {
  static const String routeName = '/activity-form';

  const ActivityFormView({super.key});

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ajouter une activité'),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),

      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: ActivityForm(cityName: cityName),
      ),
    );
  }
}
