import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickr/Components/cards.dart';
import 'package:quickr/Models/location_model.dart';
import 'package:searchable_listview/searchable_listview.dart';

class Details extends StatelessWidget {
  final Location location;

  const Details({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Journal",
            style: TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Colors.black.withOpacity(0.25),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              image: const DecorationImage(
                image: AssetImage("images/weekly.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        height: 1.75,
                      ),
                      children: [
                        TextSpan(
                          text: "${location.name}\n",
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onBackground,
                            fontSize: 24,
                            letterSpacing: 0.32,
                          ),
                        ),

                        TextSpan(
                          text: location.description,
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 14,
                            letterSpacing: 0.32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
