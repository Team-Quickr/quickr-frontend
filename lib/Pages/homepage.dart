import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quickr/Components/cards.dart';
import 'package:quickr/Pages/map.dart';
import 'package:quickr/Pages/qr_scanner.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          width: double.infinity,
          alignment: Alignment.topLeft,
          // color: Theme.of(context).colorScheme.primary,
          child: const MainLayout(),
        ),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QRScanner(),
              ))
            },
            tooltip: 'Scan',
            label: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.qr_code),
                ),
                Text(
                  "Scan",
                  style: TextStyle(
                    fontFamily: "Noto Sans Gunjala Gondi",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HomepageHeader(),
        SizedBox(height: 15),
        StatsCard(),
        SizedBox(height: 30),
        Menu(),
        SizedBox(height: 30),
        DiscoverCard(),
        SizedBox(height: 30),
        EventsHeader(),
        SizedBox(height: 15),
        EventsList(),
      ],
    );
  }
}

class HomepageHeader extends StatelessWidget {
  const HomepageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            height: 1.75,
          ),
          children: [
            WidgetSpan(
              child: Icon(
                Icons.location_on,
                size: 16,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            TextSpan(
              text: 'Timisoara, Romania\n',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 16,
                letterSpacing: 0.16,
              ),
            ),
            TextSpan(
              text: 'Hi, GoldenPotato76',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 24,
                letterSpacing: 0.32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> menuItems = [
  {
    "name": "Profile",
    "icon": Icons.person,
    "color": Color(0xfffcebdc),
    "foreground": Color(0xfff09e54),
  },
  {
    "name": "Journal",
    "icon": Icons.book,
    "color": Color(0xffd6edf8),
    "foreground": Color(0xff369cda),
  },
  {
    "name": "Badges",
    "icon": Icons.star,
    "color": Color(0xfffcf4db),
    "foreground": Color(0xfff2c94c),
  },
  {
    "name": "Discover",
    "icon": Icons.search,
    "color": Color(0xfffcebdc),
    "foreground": Color(0xfff29949),
  },
];

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (Map<String, dynamic> object in menuItems)
          Flexible(
            child: MenuCard(
              name: object["name"],
              icon: object["icon"],
              color: object["color"],
              fgColor: object["foreground"],
              page: const MapView(),
            ),
          )
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final Color fgColor;
  final Widget page;

  const MenuCard(
      {super.key,
      required this.page,
      required this.name,
      required this.icon,
      required this.color,
      required this.fgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("clicked");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: fgColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              height: 0.03,
              letterSpacing: 0.24,
            ),
          )
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final count = 34;

  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // image: const DecorationImage(
          // image: AssetImage("images/weekly.png"),
          // fit: BoxFit.cover,
          // ),
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
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your have completed:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          // height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "5",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "badges",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          // height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "23",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "discoveries",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          // height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "3",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "challenges",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            image: const DecorationImage(
              image: AssetImage("images/weekly.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 5,
            //     offset: const Offset(4, 4), // changes position of shadow
            //   ),
            // ],
          ),
          child: Row(
            children: [
              Container(
                width: 225,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Take this week's challenge!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const ShapeDecoration(
                    color: Color(0xfffcebdc),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        log("Navigate to weekly challenge");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Color(0xfff09e54),
                            size: 64,
                          ),
                          Text(
                            "Let's go!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4D1936),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class EventsHeader extends StatelessWidget {
  const EventsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text.rich(
        TextSpan(
          text: 'Local Events',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 24,
            letterSpacing: 0.32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class EventsList extends StatelessWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (Map<String, dynamic> object in menuItems)
          Flexible(
            child: EventCard(
              title: object["name"],
              shortDescription: "Str. Test, Null Island",
              color: object["color"],
              image: 'assets/weekly.png',
            ),
          )
      ],
    );
  }
}

// class TestCard extends StatefulWidget {
//   const TestCard({super.key});
//   @override
//   State<StatefulWidget> createState() => TestCardState();
// }

// class TestCardState extends State<TestCard> {
//
//   late Future<String> test;
//
//   Future<String> fetchAlbum() async {
//     final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/users'));
//
//     return jsonDecode(response.body);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     test = fetchAlbum();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Container(
//         width: double.infinity,
//         height: 125,
//         decoration: ShapeDecoration(
//           color: Theme.of(context).colorScheme.secondary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [Text("$test")],
//           ),
//         ),
//       ),
//     );
//   }
// }
