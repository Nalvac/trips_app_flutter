import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/models/city_model.dart';
import 'package:trips_app_flutter/data/data.dart' as data;
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/views/home/widgets/city_card.dart';
import 'package:trips_app_flutter/widgets/drawer.dart';
import 'package:trips_app_flutter/widgets/loader.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  static String routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CityProvider citiesProvider = Provider.of<CityProvider>(context);

    final List<City> filteredCities =
        citiesProvider.getFilteredCity(searchController.text);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations')
      ),
      drawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: 'Rechercher une ville',
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(Icons.cancel))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: RefreshIndicator(
                  displacement: 100.0,
                  onRefresh: Provider.of<CityProvider>(context, listen: false)
                      .fetchData,
                  child: citiesProvider.isLoading
                      ? const Loader()
                      : filteredCities.isNotEmpty
                          ? ListView.builder(
                              itemCount: filteredCities.length,
                              itemBuilder: (_, i) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CityCard(city: filteredCities[i])),
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: const Text('Aucun résultat'),
                            )),
            )
          ],
        ),
      ),
    );
  }
}
