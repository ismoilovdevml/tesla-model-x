import 'package:model_x/constants.dart';
import 'package:model_x/models/models.dart';
import 'package:model_x/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'chart_widgets.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  bool stateSW1 = true, stateSW2 = false, stateSW3 = true;
  Color colorSW1Active = kPrimaryColor,
      colorSW1Thumb = Colors.white,
      colorSW1Track = Colors.white;
  Color colorSW2Active = kPrimaryColor,
      colorSW2Thumb = kPrimaryColor,
      colorSW2Track = Colors.white;
  Color colorSW3Active = kPrimaryColor,
      colorSW3Thumb = Colors.white,
      colorSW3Track = Colors.white;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeHeightContainers = size.height * 0.32;
    double controlContainerSize = size.width * 0.32;
    return Container(
      alignment: Alignment.topCenter,
      height: size.height,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: kBackGroundGradient),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const TopBarStat(),
          const SizedBox(height: 30),
          Image.asset('assets/stats.png'),
          Padding(
            padding: const EdgeInsets.only(
                left: paddingContainers, right: paddingContainers, top: 15),
            child: Column(
              children: [
                const LineChartChargeHistory(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: sizeHeightContainers,
                      width: controlContainerSize,
                      decoration: BoxDecoration(
                          gradient: kCardGradient,
                          borderRadius: BorderRadius.circular(12)),
                      child: ACCtrl(
                        width: controlContainerSize,
                        height: sizeHeightContainers,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildSwitch(sizeHeightContainers, size),
                        const SizedBox(height: 20),
                        Container(
                          height: sizeHeightContainers -
                              (sizeHeightContainers * 0.60 + 20),
                          width: size.width -
                              (size.width * 0.32 + 20 + 2 * paddingContainers),
                          decoration: BoxDecoration(
                              gradient: kCardGradient,
                              borderRadius:
                                  BorderRadius.circular(kCircularBorder)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Overall Health'),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width -
                                        (size.width * 0.39 +
                                            20 +
                                            2 * paddingContainers),
                                    child: LinearPercentIndicator(
                                      curve: Curves.decelerate,
                                      animation: true,
                                      animationDuration: 1200,
                                      percent: 0.78,
                                      progressColor: kPrimaryColor,
                                      backgroundColor: kBottomAppBarColor,
                                      lineHeight: 25,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Container buildSwitch(double sizeHeightContainers, Size size) {
    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: sizeHeightContainers * 0.60,
                        width: size.width -
                            (size.width * 0.32 + 20 + 2 * paddingContainers),
                        decoration: BoxDecoration(
                            gradient: kCardGradient,
                            borderRadius:
                                BorderRadius.circular(kCircularBorder)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.lock_rounded,
                                      color: kPrimaryColor),
                                  const SizedBox(width: 7),
                                  const Text('Doors Locked',
                                      style: TextStyle(color: Colors.grey)),
                                  const Spacer(),
                                  CupertinoSwitch(
                                      trackColor: colorSW1Track,
                                      thumbColor: colorSW1Thumb,
                                      activeColor: colorSW1Active,
                                      value: stateSW1,
                                      onChanged: (value) {
                                        stateSW1 = value;
                                        if (!stateSW1) {
                                          colorSW1Active = kPrimaryColor;
                                          colorSW1Thumb = kPrimaryColor;
                                          colorSW1Track = Colors.white;
                                        } else {
                                          colorSW1Active = kPrimaryColor;
                                          colorSW1Thumb = Colors.white;
                                          colorSW1Track = Colors.white;
                                        }
                                        setState(() {});
                                      }),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(FontAwesomeIcons.dog,
                                      color: kPrimaryColor),
                                  const SizedBox(width: 7),
                                  const Text('Dog Mode',
                                      style: TextStyle(color: Colors.grey)),
                                  const Spacer(),
                                  CupertinoSwitch(
                                      trackColor: colorSW2Track,
                                      thumbColor: colorSW2Thumb,
                                      activeColor: colorSW2Active,
                                      value: stateSW2,
                                      onChanged: (value) {
                                        stateSW2 = value;
                                        if (!stateSW2) {
                                          colorSW2Active = kPrimaryColor;
                                          colorSW2Thumb = kPrimaryColor;
                                          colorSW2Track = Colors.white;
                                        } else {
                                          colorSW2Active = kPrimaryColor;
                                          colorSW2Thumb = Colors.white;
                                          colorSW2Track = Colors.white;
                                        }
                                        setState(() {});
                                      }),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.security_rounded,
                                    color: kPrimaryColor),
                                const SizedBox(width: 7),
                                const Text('Sentry Mode',
                                    style: TextStyle(color: Colors.grey)),
                                const Spacer(),
                                CupertinoSwitch(
                                    trackColor: colorSW3Track,
                                    thumbColor: colorSW3Thumb,
                                    activeColor: colorSW3Active,
                                    value: stateSW3,
                                    onChanged: (value) {
                                      stateSW3 = value;
                                      if (!stateSW3) {
                                        colorSW3Active = kPrimaryColor;
                                        colorSW3Thumb = kPrimaryColor;
                                        colorSW3Track = Colors.white;
                                      } else {
                                        colorSW3Active = kPrimaryColor;
                                        colorSW3Thumb = Colors.white;
                                        colorSW3Track = Colors.white;
                                      }
                                      setState(() {});
                                    }),
                              ],
                            )
                          ],
                        ),
                      );
  }
}

class ACCtrl extends StatelessWidget {
  const ACCtrl({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width, height;

  @override
  Widget build(BuildContext context) {
    double heightContainer = height * 0.65;
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, bottom: 3, top: 1),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('A/C Control'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SideWithCircle(
              height: heightContainer,
              endPoint: 0.85,
            ),
            VerticalPercentIndicator(
              showLabel: false,
              label: "",
              height: heightContainer,
              percent: 0.68,
              width: width * 0.4,
            ),
            SideWithCircle(
              height: heightContainer,
              endPoint: 0.68,
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              FontAwesomeIcons.fan,
              size: 20,
              color: Colors.white,
            ),
            Text(
              ' 500 RPM',
              style: TextStyle(fontSize: 10),
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.temperatureFull,
              size: 20,
              color: Colors.white,
            ),
            Text(
              '25°C',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        )
      ]),
    );
  }
}

class SideWithCircle extends StatefulWidget {
  const SideWithCircle({Key? key, required this.height, required this.endPoint})
      : super(key: key);
  final double height;
  final double endPoint;

  @override
  State<SideWithCircle> createState() => _SideWithCircleState();
}
class _SideWithCircleState extends State<SideWithCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = Tween<double>(begin: 0.1, end: 1).animate(_controller)
      ..addListener(() {
        if(_controller.value > 0.35) {      //35% of the animation
          Provider.of<StatsModel>(context, listen: false).start = true;
        }
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 2,
              width: 10,
              color: Colors.grey,
            ),
            Container(
              width: 2,
              height: widget.height,
              color: Colors.grey,
            ),
            Container(
              height: 2,
              width: 10,
              color: Colors.grey,
            ),
          ],
        ),
        Positioned(
          bottom: widget.height * widget.endPoint * _animation.value,
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
