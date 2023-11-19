import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quickr/Models/location_mock.dart';

import '../Models/location_model.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late CustomInfoWindowController mapController = CustomInfoWindowController();

  final LatLng _center = const LatLng(45.76, 21.22);

  Set<Marker> pins = <Marker>{};

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locations = context.watch<LocationsModel>();
    for (var element in locations.getLocations()) {pins.add(element.getMarker(mapController));}
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
            compassEnabled: false,
            myLocationEnabled: true,
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
            height: 200,
            width: 300,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
