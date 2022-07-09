import 'package:flutter/material.dart';

const Color kBottomAppBarColor = Color.fromARGB(255, 49, 52, 63);
const Color kPrimaryColor = Color.fromARGB(255, 1, 161, 254);
const Color kSecondaryColor = Color.fromARGB(255, 107, 200, 252);

const Color kProgressBackGroundColor = Color.fromARGB(255, 24, 24, 28);
const Color kCardColor = Color.fromARGB(255, 31, 32, 38);

const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kPrimaryColor, kSecondaryColor]);

const LinearGradient kBackGroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 78, 78, 92),
      Color.fromARGB(255, 43, 46, 56),
    ]);

const LinearGradient kCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 40, 40, 50),
      Color.fromARGB(255, 40, 40, 45),
    ]);

const LinearGradient kStatsGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kSecondaryColor,
      kPrimaryColor,
    ]);

const bottomSizeIcon = 35.0;
const batteryCharge = 85.0;
const motorPercent = 65.0;
const tempBatteryPercent = 35.0;
const brakePercent = 78.0;
const suspensionPercent = 53.0;
const kCircularBorder = 12.0;
const double paddingContainers = 20.0;

