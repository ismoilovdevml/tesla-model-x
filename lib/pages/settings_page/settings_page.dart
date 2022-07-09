import 'package:model_x/constants.dart';
import 'package:model_x/pages/settings_page/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width * 0.13;
    var height = size.height * 0.2;
    return Container(
      alignment: Alignment.topCenter,
      height: size.height,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: kBackGroundGradient),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SettingsBarStat(),
          CarCharging(size: size),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: paddingContainers, bottom: 20),
                  child: Text('Battery Health')),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingContainers / 2),
                child: LinearPercentIndicator(
                  curve: Curves.decelerate,
                  animation: true,
                  animationDuration: 1200,
                  percent: batteryCharge / 100,
                  progressColor: kPrimaryColor,
                  backgroundColor: kBottomAppBarColor,
                  lineHeight: 25,
                  center: Text(batteryCharge.toString() + '%'),
                  barRadius: const Radius.circular(10),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: paddingContainers, top: 20),
                  child: Text('Sensors')),
            ],
          ),
          const SizedBox(height: 30),
          GeneralHealth(width: width, height: height),
          const SizedBox(height: 50)
        ],
      )),
    );
  }
}

class GeneralHealth extends StatelessWidget {
  const GeneralHealth({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      margin: const EdgeInsets.symmetric(horizontal: paddingContainers),
      decoration: BoxDecoration(
          gradient: kCardGradient,
          borderRadius: BorderRadius.circular(kCircularBorder)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VerticalPercentIndicator(
              showLabel: true,
              label: 'Motor',
              width: width,
              height: height,
              percent: motorPercent / 100),
          VerticalPercentIndicator(
              showLabel: true,
              label: 'Battery Temp',
              width: width,
              height: height,
              percent: tempBatteryPercent / 100),
          VerticalPercentIndicator(
              showLabel: true,
              label: 'Brakers',
              width: width,
              height: height,
              percent: brakePercent / 100),
          VerticalPercentIndicator(
              showLabel: true,
              label: 'Suspensions',
              width: width,
              height: height,
              percent: suspensionPercent / 100),
        ],
      ),
    );
  }
}

class CarCharging extends StatelessWidget {
  const CarCharging({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.6,
      width: size.width * 0.70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: size.width * 0.45 + 200,
                height: size.width * 0.45 + 150,
                child: const CustomRipple()),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: size.width * 0.45,
                height: size.width * 0.45,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ], shape: BoxShape.circle, gradient: kStatsGradient),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.055,
            top: size.height * 0.05,
            child: ChargerCircles(size: size),
          ),
          Positioned(
            right: size.width * 0.055,
            top: size.height * 0.05,
            child: ChargerCircles(size: size),
          ),
          Positioned(
            left: size.width * 0.055,
            bottom: size.height * 0.05,
            child: ChargerCircles(size: size),
          ),
          Positioned(
            right: size.width * 0.055,
            bottom: size.height * 0.05,
            child: ChargerCircles(size: size),
          ),
          SizedBox(
            height: size.height * 0.65,
            child: Image.asset(
              'assets/bird_view_tesla.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

