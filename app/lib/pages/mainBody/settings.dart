import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  double _fontSliderValue = 24;
  int _noOfWordsInHistory = 15;
  bool _wordOfTheDay = true;

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
                  ),
                  {'min': 15, 'max': 39}, (double value) {
                // print(_fontSliderValue);
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
                  ),
                  {'min': 0, 'max': 50}, (double value) {
                setState(() {
                  _noOfWordsInHistory = value.toInt();
                });
              }),
              Container(
                margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff333337),
                    border: Border.all(
                      color: Color(0xff707070),
                      width: 1,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Word of the day",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white, fontSize: _fontSliderValue),
                    ),
                    Container(
                      child: toogleSwitch(context),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget createSlider(BuildContext context, double _value, String title,
      Text sideText, Map<String, int> range, _onChanged) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff333337),
          border: Border.all(
            color: Color(0xff707070),
            width: 1,
          )),
      margin: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white, fontSize: _fontSliderValue),
                )),
          ),
          Container(
            color: Color(0xff656565),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Color(0xff3E3E3F),
                        activeTrackColor: Color(0xffCDCDCD),
                        inactiveTrackColor: Color(0xff3E3E3F)),
                    child: Slider(
                        value: _value,
                        min: range['min'] * 1.0,
                        max: range['max'] * 1.0,
                        onChanged: _onChanged)),
                sideText
              ],
            ),
          ),
          Container(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget toogleSwitch(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: _wordOfTheDay ? Color(0xFFFFA000) : Color(0xFFCDCDCD),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment:
              _wordOfTheDay ? Alignment.centerRight : Alignment.centerLeft,
          curve: Curves.decelerate,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _wordOfTheDay = !_wordOfTheDay;
        });
      },
    );
  }
}
