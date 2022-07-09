import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomRipple extends StatefulWidget {
  const CustomRipple({Key? key}) : super(key: key);

  @override
  _CustomRippleState createState() => _CustomRippleState();
}
class _CustomRippleState extends State<CustomRipple>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<double>(begin: 0.4, end: 0.8).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            border: Border.all(color: kPrimaryColor, width: 4),
            shape: BoxShape.circle),
      ),
    );
  }
}

class ChargerCircles extends StatelessWidget {
  const ChargerCircles({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.12,
      width: size.height * 0.12,
      child: Stack(
        alignment: Alignment.center,
        children: const [
          CustomRipple(),
          SizedBox(
            height: 60,
            width: 60,
            child: CustomRipple(),
          )
        ],
      ),
    );
  }
}

class SettingsBarStat extends StatelessWidget {
  const SettingsBarStat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40,
                )),
            const Text('Diagnostic',
                style: TextStyle(
                    letterSpacing: 1, fontSize: 20, color: Colors.grey)),
            const Spacer(),
            const Text('MODEL X',
                style: TextStyle(
                    letterSpacing: 1, fontSize: 20, color: Colors.white)),
            const SizedBox(width: 15),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Text('Overall Health',
                  style: TextStyle(
                      letterSpacing: 1, fontSize: 15, color: Colors.grey)),
              const Spacer(),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: kPrimaryColor,
                padding: const EdgeInsets.all(12.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.refresh_rounded,
                  size: 25.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}