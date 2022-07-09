import 'dart:async';

import 'package:badges/badges.dart';
import 'package:model_x/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRunning = true;

  @override
  void initState() {
    timerStart();
    super.initState();
  }

  void timerStart() {
    Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      int index = Provider.of<BottomButtonModel>(context, listen: false).number;
      if (index == 0) {
        Provider.of<BottomButtonModel>(context, listen: false).charging =
            !Provider.of<BottomButtonModel>(context, listen: false).charging;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool charging =
        Provider.of<BottomButtonModel>(context, listen: false).charging;
    return Container(
      alignment: Alignment.topCenter,
      height: size.height,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: kBackGroundGradient),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //alignment: Alignment.topCenter,
          children: [
            const TopBarHome(),
            Column(
              children: const [
                Text(
                  'Your Tesla',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                Text('MODEL X',
                    style: TextStyle(fontSize: 26, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: size.height * 0.48,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      'assets/homepage_tesla.png',
                      height: size.height * 0.32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.28,
                    child: CircularPercentIndicator(
                      curve: Curves.decelerate,
                      animation: true,
                      radius: size.width * 0.2,
                      animationDuration: 1200,
                      percent: batteryCharge / 100,
                      lineWidth: 15,
                      progressColor: kPrimaryColor,
                      backgroundColor: kProgressBackGroundColor,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(batteryCharge.toString() + '%',
                              style: const TextStyle(
                                fontSize: 40,
                              )),
                          const Text('Charged')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/assets/images/lighting.svg',
                    color: charging ? kPrimaryColor : Colors.grey),
                const Text(
                  'Charging... 14 mins remaining',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                InfoCard(
                  title: 'Temperature',
                  label: 'Cabin',
                  value: '21°',
                ),
                SizedBox(width: 30),
                InfoCard(
                  title: 'Consumption',
                  label: 'Today',
                  value: '4.3',
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class TopBarHome extends StatelessWidget {
  const TopBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 30, top: 15),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: kPrimaryColor,
                size: 40,
              )),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
                color: Colors.white10, shape: BoxShape.circle),
            child: Badge(
              badgeColor: kPrimaryColor,
              badgeContent: const Text('1'),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.solidUser,
                    color: kBottomAppBarColor,
                    size: 25,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.label,
    required this.value,
  }) : super(key: key);
  final String title, label, value;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
      height: size.height * 0.16,
      width: size.height * 0.18,
      decoration: BoxDecoration(gradient: kCardGradient,
      boxShadow: [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(20), color: kBottomAppBarColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              value,
              style: const TextStyle(
                  letterSpacing: 1, color: kPrimaryColor, fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
