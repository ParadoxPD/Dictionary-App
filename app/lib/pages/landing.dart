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
  bool thirdAnim = false;
  bool fourthAnim = false;
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        firstAnim = !firstAnim;
      });
    });
    Timer(Duration(milliseconds: 1300), () {
      setState(() {
        secondAnim = !secondAnim;
      });
    });
    Timer(Duration(milliseconds: 2100), () {
      setState(() {
        thirdAnim = !thirdAnim;
      });
    });
    Timer(Duration(milliseconds: 3200), () {
      setState(() {
        fourthAnim = !fourthAnim;
      });
    });
    Timer(Duration(milliseconds: 5400), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[squareAnimTransform(), wordAnim()],
    );
  }

  Widget wordAnim() {
    return AnimatedOpacity(
      opacity: fourthAnim ? 1 : 0,
      duration: Duration(seconds: 2),
      child: Transform.translate(
        offset: Offset(0, _width / 2 - 11),
        child: Container(
          child: Image.asset('assets/iction.png'),
        ),
      ),
    );
  }

  Widget squareAnimTransform() {
    return Transform.translate(offset: Offset(-68, 0), child: squareAnim());
  }

  Widget squareAnim() {
    return Center(
      child: AnimatedContainer(
        width: !firstAnim ? _width - 68 : _width,
        height: _height,
        color: Color(0xffFFA000),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        child: AnimatedPadding(
          padding: !secondAnim
              ? EdgeInsets.fromLTRB(
                  _width / 2, _height / 2, _width / 2, _height / 2)
              : EdgeInsets.all(3),
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
          child: Container(
            color: Color(0xff333337),
            child: AnimatedOpacity(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 800),
              opacity: !thirdAnim ? 0 : 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/D.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
