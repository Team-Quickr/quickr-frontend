import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding {
  final String title;
  final String image;
  final String subTitle;
  final IconData? icon;


  OnBoarding({
    required this.title,
    required this.image,
    required this.icon,
    required this.subTitle,

  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: "Travel in your city",
    image: 'images/city.png',
    icon: Icons.favorite,
    subTitle: "Keep track of all your tracks",
  ),

  OnBoarding(
    title: "Leaderboard",
    image: 'images/city3.png',
    icon: Icons.stars,
    subTitle: "Keep track of all your tracks",
  ),

  OnBoarding(
    title: "New Destination",
    image: 'images/city4.png',
    icon: Icons.place,
    subTitle: "Keep track of all your tracks",
  ),

];