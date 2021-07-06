import 'dart:async';

import 'package:app/pages/landing.main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreen createState() => _AnimationScreen();
}

class _AnimationScreen extends State<AnimationScreen>
    with TickerProviderStateMixin {
  double _width = 79;
  double _height = 74;
  bool secondAnim = false;
  bool thirdAnim = false;
  bool fourthAnim = false;

  int animTime = 700;

  Animation<double> offsetAnimation;
  AnimationController offsetAnimationController;
  Animation<double> offsetWordAnimation;
  AnimationController offsetWordAnimationController;

  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(milliseconds: 10), () {
        offsetAnimationController.forward();
        Timer(Duration(milliseconds: 800), () {
          setState(() {
            secondAnim = !secondAnim;
          });
          Timer(Duration(milliseconds: animTime + 800), () {
            setState(() {
              thirdAnim = !thirdAnim;
            });
            Timer(Duration(milliseconds: 2 * animTime), () {
              offsetWordAnimationController.forward();
              setState(() {
                fourthAnim = !fourthAnim;
              });

              Timer(Duration(milliseconds: 3 * animTime + 1000), () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              });
            });
          });
        });
      });
    });

    offsetAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: animTime));
    offsetAnimation = Tween<double>(
      begin: -68,
      end: 0,
    ).animate(
      CurvedAnimation(
          parent: offsetAnimationController, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
      });
    offsetWordAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: animTime + 100));
    offsetWordAnimation = Tween<double>(
      begin: 30,
      end: 0,
    ).animate(
      CurvedAnimation(
          parent: offsetWordAnimationController, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[squareAnimTransform(), wordAnim()],
      ),
    );
  }

  Widget wordAnim() {
    return AnimatedOpacity(
      opacity: fourthAnim ? 1 : 0,
      duration: Duration(milliseconds: (animTime * 2.5).toInt()),
      child: Transform.translate(
        offset: Offset(0, _height / 2 - 11 - offsetWordAnimation.value),
        child: Container(
          child: Image.asset('assets/iction.png'),
        ),
      ),
    );
  }

  Widget squareAnimTransform() {
    return Transform.translate(
        offset: Offset(offsetAnimation.value / 2 - 10, 0), child: squareAnim());
  }

  Widget squareAnim() {
    return Center(
      child: Container(
        width: _width + offsetAnimation.value,
        height: _height,
        color: Color(0xffFFA000),
        child: AnimatedPadding(
          padding: !secondAnim
              ? EdgeInsets.fromLTRB(
                  _width / 2, _height / 2, _width / 2, _height / 2)
              : EdgeInsets.all(3),
          duration: Duration(milliseconds: animTime),
          curve: Curves.fastOutSlowIn,
          child: Container(
            color: Color(0xff333337),
            child: AnimatedOpacity(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: animTime),
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
