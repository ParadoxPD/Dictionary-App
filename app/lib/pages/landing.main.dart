import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [FirstPage(), SecondPage(), ThirdPage()];

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
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
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

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  FocusNode searchedWord = new FocusNode();
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: mainBody(context),
    );
  }

  Widget mainBody(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isSearching = !isSearching;
          });
        },
        child: Container(
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
        ));
  }

  Widget searchBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearching = !isSearching;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: !isSearching
            ? 0.4 * MediaQuery.of(context).size.height
            : 0.5 * MediaQuery.of(context).size.height,
        margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Color(0xff161616),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x000000).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(7, 7), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              padding: EdgeInsets.zero,
              child: TextField(
                focusNode: searchedWord,
                style: TextStyle(color: Colors.white, fontSize: 20),
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
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }

  Widget wordOfTheDay(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSearching ? 0 : 1,
      duration: Duration(milliseconds: 500),
      child: Container(
        height: 0.2 * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Color(0xff161616),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x000000).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(7, 7), // changes position of shadow
            ),
          ],
        ),
        child: Text("Word"),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
