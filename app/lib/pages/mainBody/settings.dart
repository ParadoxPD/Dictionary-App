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
                    style: TextStyle(
                        fontSize: _fontSliderValue, color: Colors.white),
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
                    style: TextStyle(
                        fontSize: _fontSliderValue, color: Colors.white),
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
      decoration: BoxDecoration(
        color: const Color(0xff333337),
        border: Border.all(
          color: Color(0xff707070),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      margin: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          Row(
            children: [
              SliderTheme(
                  data: SliderThemeData(
                      thumbColor: Color(0xff3E3E3F),
                      activeTrackColor: Color(0xffCDCDCD),
                      inactiveTrackColor: Color(0xff3E3E3F)),
                  child: Slider(
                      value: _value, min: 0, max: 100, onChanged: _onChanged)),
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
