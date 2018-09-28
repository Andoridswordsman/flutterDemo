import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudyState();
  }
}

class _StudyState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Center(
        child: new Text(
          "fragment-study",
          style: new TextStyle(color: Colors.blue,fontSize: 16.0),
        ),
      ),
    );
  }
}