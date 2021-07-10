import 'package:flutter/material.dart';
import 'landing.animation.dart';
import 'landing.main.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff333337),
      body: Container(
        color: Color(0xff333337),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: MainPage(),
      ),
    );
  }
}
