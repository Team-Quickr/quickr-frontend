import 'dart:developer';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String uuid;
  final String name;
  final int type;
  final LatLng position;

  // BitmapDescriptor? image;

  Location({
    required this.uuid,
    required this.name,
    required this.type,
    required this.position,
  });

  Marker getMarker(CustomInfoWindowController mapController) {
    return Marker(
      markerId: MarkerId(uuid),
      position: position,
      onTap: () {
        mapController.addInfoWindow!(
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name.substring(5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          position,
        );
      },
    );
  }

  // void loadIcon() async {
  //   await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/weekly.png").then((value) => image = value);
  // }

//TODO: Add this
// factory User.fromJson(Map<String, dynamic> json) {
//   return User(
//       uuid: json['uuid'],
//       username: json['username'],
//       email: json['email'],
//       discoveries: json['discoveries']
//   );
// }
}
