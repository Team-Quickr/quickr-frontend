import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quickr/Components/cards.dart';
import 'package:quickr/Models/location_mock.dart';
import 'package:quickr/Models/location_model.dart';
import 'package:searchable_listview/searchable_listview.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    var locations = context.watch<LocationsModel>();

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
                child: searchableJournal(locations),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchableJournal(LocationsModel locations) {
    return SearchableList<Location>(
      style: const TextStyle(fontSize: 25),
      builder: (list, index, item) {
        return JournalCard(location: item);
      },
      initialList: locations.getLocations(),
      filter: (p0) {
        return locations.getLocations().where((element) => element.name.contains(p0)).toList();
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
