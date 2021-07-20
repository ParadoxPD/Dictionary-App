import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key key}) : super(key: key);

  _DictionaryPage createState() => _DictionaryPage();
}

class _DictionaryPage extends State<DictionaryPage>
    with WidgetsBindingObserver {
  FocusNode searchBoxFocus = new FocusNode();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    searchBoxFocus = new FocusNode();
    searchBoxFocus.addListener(_onOnFocusNodeEvent);
    // WidgetsBinding.instance.addObserver(this);
  }

  // @override
  // void didChangeMetrics() {
  //   super.didChangeMetrics();
  //   final value = WidgetsBinding.instance.window.viewInsets.bottom;
  //   print(value);
  //   if (value == 0) {
  //     if (isSearching) {
  //       print("Back");
  //     }
  //     // isSearching = !isSearching;
  //   }
  // }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    searchBoxFocus.dispose();
    super.dispose();
  }

  _onOnFocusNodeEvent() {
    setState(() {
      if (searchBoxFocus.hasFocus)
        isSearching = true;
      else
        isSearching = false;
    });
  }

  @override
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
        body: mainBody(context),
      ),
    );
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
              searchBox(context),
              wordOfTheDay(context),
            ],
          ),
        ));
  }

  Widget searchBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: !isSearching
            ? 0.35 * MediaQuery.of(context).size.height
            : 0.45 * MediaQuery.of(context).size.height,
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
                focusNode: searchBoxFocus,
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
      duration: Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: !isSearching ? 0.2 * MediaQuery.of(context).size.height : 0,
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
