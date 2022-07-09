import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: must_be_immutable
class VerticalPercentIndicator extends StatefulWidget {
  VerticalPercentIndicator({
    Key? key,
    required this.height,
    required this.width,
    required this.percent,
    required this.label,
    required this.showLabel,
  }) : super(key: key);

  final double height, width, percent;
  String label;
  final bool showLabel;

  @override
  State<VerticalPercentIndicator> createState() => _VerticalPercentIndicatorState();
}

class _VerticalPercentIndicatorState extends State<VerticalPercentIndicator>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = Tween<double>(begin: 0.1, end: 1).animate(_controller)
      ..addListener(() {
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
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: kBottomAppBarColor,
              borderRadius: BorderRadius.circular(15)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      gradient: kStatsGradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  height: widget.height * widget.percent * _animation.value),
            ],
          ),
        ),
        if(widget.showLabel == true) const SizedBox(height: 10),
        if(widget.showLabel == true)Text(widget.label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}