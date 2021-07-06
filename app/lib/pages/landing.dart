import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'landing.animation.dart';
import 'landing.main.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333337),
      body: Container(
        color: Color(0xff333337),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimationScreen(),
      ),
    );
  }
}
