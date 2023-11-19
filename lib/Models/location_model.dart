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
  final String description;

  // BitmapDescriptor? image;

  Location({
    required this.uuid,
    required this.name,
    required this.type,
    required this.position,
    required this.description,
  });

  Marker getMarker(CustomInfoWindowController mapController) {
    return Marker(
      markerId: MarkerId(uuid),
      position: position,
      onTap: () {
        mapController.addInfoWindow!(
          InfoPanel(
            name: name,
            description: description,
            difficulty: type,
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

class InfoPanel extends StatelessWidget {
  final String name;
  final String description;
  final int difficulty;

  const InfoPanel({super.key,
    required this.name,
    required this.description,
    required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 5, left: 10, right: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(description),
                ),
              ),
              const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Difficulty: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          StarRating(rating: 2),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("Distance: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text("0.5km"),
                        ],
                      ),
                      Align(
                        alignment: Alignment(1, 1),
                        heightFactor: 0.01,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: FittedBox(
                            child: FloatingActionButton(
                                shape: CircleBorder(),

                                onPressed: null,
                                child: Icon(Icons.arrow_forward_outlined),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme
            .of(context)
            .colorScheme
            .tertiary,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
        List.generate(starCount, (index) => buildStar(context, index)));
  }
}
