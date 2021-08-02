import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  double _fontSliderValue = 10;
  int _noOfWordsInHistory = 15;
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
              createSlider(
                  context,
                  _fontSliderValue,
                  "Font",
                  Text(
                    "A",
                    style: TextStyle(fontSize: _fontSliderValue),
                  ), (double value) {
                setState(() {
                  _fontSliderValue = value;
                });
              }),
              createSlider(
                  context,
                  _noOfWordsInHistory * 1.0,
                  "No. of words in history",
                  Text(
                    _noOfWordsInHistory.toString(),
                    style: TextStyle(fontSize: _fontSliderValue),
                  ), (double value) {
                setState(() {
                  _noOfWordsInHistory = value.toInt();
                });
              }),
              Container()
            ],
          ),
        ));
  }

  Widget createSlider(BuildContext context, double _value, String title,
      Text sideText, _onChanged) {
    return Container(
      child: Column(
        children: [
          Align(
              child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          Row(
            children: [
              Slider(value: _value, min: 0, max: 100, onChanged: _onChanged),
              sideText
            ],
          ),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }
}
