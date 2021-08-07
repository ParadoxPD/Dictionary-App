import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  List<Map<String, String>> historyItems = [];

  Widget build(BuildContext context) {
    return Scaffold(body: mainBody(context));
  }

  Widget mainBody(BuildContext context) {
    buildList();
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
              Container(
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: historyItems.length,
                    itemBuilder: _listBuilder,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _listBuilder(context, index) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      padding: EdgeInsets.only(left: 30, right: 30),
      color: Color(0xff656565),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            historyItems[index]['title'],
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date :",
                  style: TextStyle(color: Color(0xa0ffffff), fontSize: 14),
                ),
                Text(
                  "Time :",
                  style: TextStyle(color: Color(0xa0ffffff), fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void buildList() {
    for (int i = 0; i < 50; i++) {
      historyItems.add({'title': i.toString(), 'date': '', 'time': ''});
    }
  }
}
