import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const textColor = Color(0xFF196680);
  static const textColorAlternate = Color(0xFF1F414E);
  static const backgroundColor = Color(0xFFfcfcfc);
  static const primaryColor = Color(0xFF28afaf);
  static const primaryFgColor = Color(0xFFfcfcfc);
  static const secondaryColor = Color(0xFFf4d35d);
  static const secondaryFgColor = Color(0xFFfcfcfc);
  static const accentColor = Color(0xFFee9649);
  static const accentFgColor = Color(0xFFfcfcfc);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quickr App',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          onSurfaceVariant: textColorAlternate,
          brightness: Brightness.light,
          background: backgroundColor,
          onBackground: textColor,
          primary: primaryColor,
          onPrimary: primaryFgColor,
          secondary: secondaryColor,
          onSecondary: secondaryFgColor,
          tertiary: accentColor,
          onTertiary: accentFgColor,
          surface: backgroundColor,
          onSurface: textColor,
          error: Brightness.light == Brightness.light
              ? Color(0xffB3261E)
              : Color(0xffF2B8B5),
          onError: Brightness.light == Brightness.light
              ? Color(0xffFFFFFF)
              : Color(0xff601410),
        ),
        textTheme: const TextTheme(),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
