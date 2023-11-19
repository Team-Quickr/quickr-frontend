import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickr/Pages/login_page.dart';
import 'package:quickr/Pages/register_page.dart';
import './Pages/pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore App',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


