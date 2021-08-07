import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  List<Map<String, String>> historyItems = [];
  List<bool> isDeleteShowing = [];
  @override
  void initState() {
    super.initState();
    buildList();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: mainBody(context));
  }

  Widget mainBody(BuildContext context) {
    return Container(
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
    );
  }

  Widget _listBuilder(context, index) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(
          top: index == 0 ? 70 : 20,
          left: 45,
          right: 45,
          bottom: index == historyItems.length - 1 ? 70 : 0),
      padding: EdgeInsets.only(left: 30, right: 0),
      color: Color(0xff656565),
      child: InkWell(
        onTap: () {
          setState(() {
            isDeleteShowing[index] = !isDeleteShowing[index];
          });
          print(isDeleteShowing[index]);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              historyItems[index]['title'],
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date :",
                          style:
                              TextStyle(color: Color(0xa0ffffff), fontSize: 14),
                        ),
                        Text(
                          "Time :",
                          style:
                              TextStyle(color: Color(0xa0ffffff), fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: isDeleteShowing[index] ? 50 : 0,
                    height: 60,
                    color: Colors.white,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: isDeleteShowing[index] ? 1 : 0,
                      child: IconButton(
                        icon: new Icon(Icons.delete),
                        onPressed: () {
                          deleteItem(index);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteItem(int index) {
    setState(() {
      historyItems.removeAt(index);
    });
  }

  void buildList() {
    historyItems = [];
    for (int i = 0; i < 6; i++) {
      historyItems.add({
        'title': i.toString(),
        'date': '',
        'time': '',
      });
      isDeleteShowing.add(false);
    }
  }
}
