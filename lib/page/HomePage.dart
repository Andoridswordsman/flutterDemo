import 'package:flutter/material.dart';
import 'package:flutter_app/page/MinePage.dart';
import 'package:flutter_app/page/StudyPage.dart';

class HomePage extends StatefulWidget {

  static final String sName = "home";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  Widget _buildStack() {
    final List<Widget> list = <Widget>[];
    list.add(new StudyPage());
    list.add(new StudyPage());
    list.add(new MinePage());
    return new IndexedStack(
      children: list,
      index: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("主页"),
//        ),
        body: _buildStack(),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("学习")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.search), title: new Text("双师课堂")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.info), title: new Text("我的")),
          ]),
    );
  }
}