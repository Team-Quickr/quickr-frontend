import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Models/location_model.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late CustomInfoWindowController mapController = CustomInfoWindowController();

  final LatLng _center = const LatLng(45.76, 21.22);

  final List<Location> locations = [
    Location(
        uuid: "test1",
        name: "Test Location 1",
        type: 1,
        position: const LatLng(45.75, 21.22)),
    Location(
        uuid: "test2",
        name: "Test Location 2",
        type: 2,
        position: const LatLng(45.76, 21.22)),
    Location(
        uuid: "test3",
        name: "Test Location 3",
        type: 3,
        position: const LatLng(45.75, 21.215)),
  ];

  Set<Marker> pins = <Marker>{};

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var element in locations) {pins.add(element.getMarker(mapController));}
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Nearby',
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
        ),
        backgroundColor: Colors.black.withOpacity(0.4),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              mapController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              mapController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              mapController.googleMapController = controller;
            },
            markers: pins,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          ),
          CustomInfoWindow(
            controller: mapController,
            height: 75,
            width: 150,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
