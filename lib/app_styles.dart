import 'package:flutter/material.dart';
import './size_configs.dart';
/*
Color kPrimaryColor = Color(0xffFC9D45);
Color kSecondaryColor = Color(0xff573353);
*/

const textColor = Color(0xFF196680);
const backgroundColor = Color(0xFFfcfcfc);
const primaryColor = Color(0xFF28afaf);
const primaryFgColor = Color(0xFFfcfcfc);
const secondaryColor = Color(0xFFf4d35d);
const secondaryFgColor = Color(0xFFfcfcfc);
const accentColor = Color(0xFFee9649);
const accentFgColor = Color(0xFFfcfcfc);

const colorScheme = ColorScheme(
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
  error: Brightness.light == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);

final kTitle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: primaryColor,
);

final kBodyText1 = TextStyle(
  color: secondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
);