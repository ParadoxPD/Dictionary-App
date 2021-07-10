import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.3,
        toolbarHeight: 60,
        foregroundColor: Color(0xff1F1F1F),
        backgroundColor: Color(0xff1F1F1F),
        leading: Container(
          margin: EdgeInsets.only(left: 0),
          child: ImageIcon(
            AssetImage('assets/icon.png'),
            color: Color(0xffFFA000),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Color(0xff333337),
        child: Column(
          children: [
            Container(
              color: Color(0xff656565),
              height: 10,
            ),
            searchBox(context),
            wordOfTheDay(context),
          ],
        ),
      ),
    );
  }

  Widget searchBox(BuildContext context) {
    return Container(
      height: 0.4 * MediaQuery.of(context).size.height,
      margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Color(0xff161616),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Theme(
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                focusedBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                ),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                  color: Color(0xff999999),
                  fontStyle: FontStyle.italic,
                ),
                fillColor: Color(0xff333337),
                prefixIcon: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Icon(
                    Icons.search,
                    color: Color(0xff999999),
                  ),
                ),
                hintText: "Search",
                suffixIcon: Container(
                  child: IconButton(
                    color: Color(0xff999999),
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      print('mic button pressed');
                    },
                  ),
                ),
              ),
            ),
          ),
          // data: Theme.of(context).copyWith(
          //   primaryColor: Color(0xff999999),
          // ),
          // ),
        ],
      ),
    );
  }

  Widget wordOfTheDay(BuildContext context) {
    return Container(
      child: Text("Word"),
    );
  }
}
