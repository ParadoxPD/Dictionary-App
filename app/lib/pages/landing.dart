import 'dart:async';

import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff333337),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimationScreen(),
      ),
    );
  }
}

Animation<double> width;

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreen createState() => _AnimationScreen();
}

class _AnimationScreen extends State<AnimationScreen>
    with TickerProviderStateMixin {
  double _width = 79;
  double _height = 74;

  bool firstAnim = false;
  bool secondAnim = false;
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        firstAnim = !firstAnim;
      });
    });
    Timer(Duration(milliseconds: 2500), () {
      setState(() {
        secondAnim = !secondAnim;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        squareAnim(),
      ],
    );
  }

  Widget squareAnim() {
    return Center(
      child: AnimatedContainer(
        width: !firstAnim ? _width - 68 : _width,
        height: _height,
        color: Color(0xffFFA000),
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: AnimatedPadding(
          padding: !secondAnim
              ? EdgeInsets.fromLTRB(
                  _width / 2, _height / 2, _width / 2, _height / 2)
              : EdgeInsets.all(3),
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            color: Color(0xff333337),
          ),
        ),
      ),
    );
  }
}
