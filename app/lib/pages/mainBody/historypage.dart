import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  Widget build(BuildContext context) {
    return Scaffold(body: mainBody(context));
  }

  Widget mainBody(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: Color(0xff333337),
          child: Column(
            children: [
              Container(
                color: Color(0xff656565),
                height: 10,
              ),
            ],
          ),
        ));
  }
}
