import 'package:app/pages/mainBody/historypage.dart';
import 'package:app/pages/mainBody/settings.dart';
import 'package:flutter/material.dart';

import 'mainBody/dictionarypage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DictionaryPage(),
    HistoryPage(),
    SettingsPage()
  ];

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff0C0404),
          selectedItemColor: Color(0xffFFA000),
          unselectedItemColor: Color(0xff656565),
          onTap: onTabTapped, // new
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Image.asset('assets/home-yellow.png')
                  : Image.asset('assets/home.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Image.asset('assets/history-yellow.png')
                  : Image.asset('assets/history.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Image.asset('assets/settings-yellow.png')
                  : Image.asset('assets/settings.png'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
