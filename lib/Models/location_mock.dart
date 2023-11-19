import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickr/Models/location_model.dart';

class LocationsModel extends ChangeNotifier {
  List<Location> locations = [
    Location(
        uuid: "test1",
        name: "Test Location 1",
        description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        type: 1,
        position: const LatLng(45.75, 21.22)),
    Location(
        uuid: "test2",
        name: "Test Location 2",
        description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
        type: 2,
        position: const LatLng(45.76, 21.22)),
    Location(
        uuid: "test3",
        name: "Test Location 3",
        description: "Neque porro ",
        type: 3,
        position: const LatLng(45.75, 21.215)),
  ];

  List<Location> getLocations() {
    return locations;
  }

  void setLocations(List<Location> locs) {
    locations = locs;
    notifyListeners();
  }

  Location getFromID(String uuid) {
    return locations.firstWhere((element) => element.uuid == uuid);
  }
}