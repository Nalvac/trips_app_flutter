import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              'Trip',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.flight),
            title: const Text('Mes voyages'),
            onTap: () {
            },
          )
        ],
      ),
    );
  }
}
