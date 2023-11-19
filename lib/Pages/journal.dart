import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickr/Components/cards.dart';
import 'package:quickr/Models/location_model.dart';
import 'package:searchable_listview/searchable_listview.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final List<Location> locations = [
    Location(
        uuid: "test1",
        name: "Test Location 1",
        description:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        type: 1,
        position: const LatLng(45.75, 21.22)),
    Location(
        uuid: "test2",
        name: "Test Location 2",
        description:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        type: 2,
        position: const LatLng(45.76, 21.22)),
    Location(
        uuid: "test3",
        name: "Test Location 3",
        description: "Neque porro ",
        type: 3,
        position: const LatLng(45.75, 21.215)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal",
            style: TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: searchableJournal(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchableJournal() {
    return SearchableList<Location>(
      style: const TextStyle(fontSize: 25),
      builder: (list, index, item) {
        return JournalCard(location: item);
      },
      initialList: locations,
      filter: (p0) {
        return locations.where((element) => element.name.contains(p0)).toList();
      },
      reverse: false,
      emptyWidget: const EmptyView(),
      onRefresh: () async {},
      onItemSelected: (Location item) {},
      inputDecoration: InputDecoration(
        labelText: "Search Location",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const Text('no location found with this name'),
      ],
    );
  }
}
